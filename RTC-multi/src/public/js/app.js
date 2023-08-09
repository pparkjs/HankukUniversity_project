const socket = io();

const call = document.getElementById("call");
const myFace = document.getElementById("myFace");
const muteBtn = document.getElementById("mute");
const cameraBtn = document.getElementById("camera");

// 음소거 화면 끔 아이콘 요소
const muteIcon = muteBtn.querySelector(".muteIcon");
const unMuteIcon = muteBtn.querySelector(".unMuteIcon");
const cameraIcon = cameraBtn.querySelector(".cameraIcon");
const unCameraIcon = cameraBtn.querySelector(".unCameraIcon");

const HIDDEN_CN = "hidden";
/**
 * @type MediaStream
 */
let myStream;
let muted = false;
let cameraOff = false;
muteIcon.classList.add(HIDDEN_CN);
unCameraIcon.classList.add(HIDDEN_CN);
let peerId;

async function getMedia(){
    try {
        myStream = await navigator.mediaDevices.getUserMedia({
            audio: true,
            video: {facingMode: "user"},
        });
        console.log(myStream);
        myFace.srcObject = myStream;
        // getCameras();
        // setMute(true);
    }
    catch(e) {
        console.log(e);
    }
}

function handleMuteClick() {
    myStream
        .getAudioTracks()
        .forEach((track) => (track.enabled = !track.enabled)); // track.enabled는 소리 여부 (true or false)로 현재 value값을 가져와서 반대값
    if (!muted) {
        muteIcon.classList.remove(HIDDEN_CN);
        unMuteIcon.classList.add(HIDDEN_CN);
        muted = true;
    } else {
        unMuteIcon.classList.remove(HIDDEN_CN);
        muteIcon.classList.add(HIDDEN_CN);
        muted = false;
      }
}

// function handleMuteClick() {
//     setMute(!muted);
// }

function handleMuteCameraClick() {
    const cameraTracks = myStream.getVideoTracks();
    console.log(cameraTracks);

    if (cameraOff) {
        cameraIcon.classList.remove(HIDDEN_CN);
        unCameraIcon.classList.add(HIDDEN_CN);
        cameraOff = false;
        cameraTracks.forEach(track => track.enabled = true);
    } else {
        unCameraIcon.classList.remove(HIDDEN_CN);
        cameraIcon.classList.add(HIDDEN_CN);
        cameraOff = true;
        cameraTracks.forEach(track => track.enabled = false);
      }
}

muteBtn.addEventListener("click", handleMuteClick);
cameraBtn.addEventListener("click", handleMuteCameraClick);

/**
 * @type RTCPeerConnection[]
 */
let peerConnections = {};

async function initCall() {
    await getMedia();
}

let socketId;

// socket이 connect 됐을때 실행 -> 로드되면 실행 
socket.on("connect", async() => {
    socketId = socket.id
    await initCall();
    console.log("소켓아이디 : ", socketId)
    socket.emit("join_room", room, socketId);
})

// socket code

socket.on("welcome", async(newbieID) => {
    // 뉴비를 위해 새로운 커넥션을 만들고
    const offer = await makeConnection(newbieID);
    console.log("someone joined");
    // 뉴비에게 내 정보와 offer를 전달한다.
    socket.emit("offer", offer, room, newbieID, socket.id);
    console.log("send the offer");
});

socket.on("offer", async(offer, offersId) => {
    console.log("receive the offer");
    console.log(offer);
    // 뉴비는 현재 방안에 있던 모든사람의 offer를 받아 새로운 커넥션을 만들고, 답장을 만든다.
    const answer = await makeConnection(offersId, offer);
    // 답장을 현재 있는 받은 커넥션들에게 각각 보내준다.
    socket.emit("answer", answer, room, offersId, socket.id);
    console.log("send the answer");
});

socket.on("answer", async(answer, newbieID) => {
    console.log("receive the answer", newbieID);
    // 방에 있던 사람들은 뉴비를 위해 생성한 커섹션에 answer를 추가한다.
    peerConnections[newbieID].setRemoteDescription(answer);
});
socket.on("ice", (ice, othersId) => {
    console.log("receive candidate");
    /** 다른 사람에게서 받은 ice candidate를 각 커넥션에 넣는다. */
    peerConnections[othersId].addIceCandidate(ice);
});

// 클라이언트가 연결 끊을 시 상대 video 끄기
socket.on("bye", (leaveId) => {
    console.log("떠나는 아이디 : ", leaveId);
    let peerVideo = document.getElementById(leaveId);
    peerVideo.srcObject = null;
    peerVideo.remove();
})

// RTC Code
async function makeConnection(othersId, _offer) {
    const myPeerConnection = new RTCPeerConnection({
        iceServers: [
            {
                urls: [
                    "stun:stun.l.google.com:19302",
                    "stun:stun1.l.google.com:19302",
                    "stun:stun2.l.google.com:19302",
                    "stun:stun3.l.google.com:19302",
                    "stun:stun4.l.google.com:19302",
                    "stun:stun01.sipphone.com",
                    "stun:stun.ekiga.net",
                    "stun:stun.fwdnet.net",
                    "stun:stun.ideasip.com",
                    "stun:stun.iptel.org",
                    "stun:stun.rixtelecom.se",
                    "stun:stun.schlund.de",
                    "stun:stunserver.org",
                    "stun:stun.softjoys.com",
                    "stun:stun.voiparound.com",
                    "stun:stun.voipbuster.com",
                    "stun:stun.voipstunt.com",
                    "stun:stun.voxgratia.org",
                    "stun:stun.xten.com"
                ]
            }
        ]
    });
    peerConnections[othersId] = myPeerConnection;

    myPeerConnection.addEventListener("icecandidate", (data) => handleIce(data, othersId));
    myPeerConnection.addEventListener("addstream", (data) => handleAddStream(data, othersId));
    myStream.getTracks().forEach(track => myPeerConnection.addTrack(track, myStream));

    let offer = _offer;
    let answer;

    if(!offer) { // welcome에서 와서 offer 비어있을때 작동
        offer = await myPeerConnection.createOffer();
        myPeerConnection.setLocalDescription(offer);
    }
    else {
        myPeerConnection.setRemoteDescription(offer);
        answer = await myPeerConnection.createAnswer();
        myPeerConnection.setLocalDescription(answer);
    }

    return answer || offer;
}

/**
 * 
 * @param {RTCPeerConnectionIceEvent} data 
 */
function handleIce(data, othersId) {
    // ice breack가 생기면? 이를 해당 사람들에게 전달한다.
    console.log("got ice candidate");
    socket.emit("ice", data.candidate, room, othersId, socket.id); // othersId는 두번째 들어온 사람 socket.id 방개설한 나
    console.log("send ice candidate");
}

/**
 * 
 * @param {MediaStreamEvent} data 
 */
function handleAddStream(data, othersId) {
    console.log("got an stream from my peer");
    // stream을 받아오면, 비디오를 새로 생성하고 넣어준다.
    const video = document.createElement("video");
    document.getElementById("myStream").appendChild(video);
    video.id = othersId;
    video.autoplay = true;
    video.playsInline = true;
    video.width = 570;
    video.height = 410;
    video.srcObject = data.stream;
}