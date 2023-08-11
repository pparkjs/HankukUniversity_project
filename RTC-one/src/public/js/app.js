const socket = io(); // io 함수는 알아서 socket.io를 실행하고 있는 서버를 찾는다.

const myFace = document.getElementById("myFace");
const muteBtn = document.getElementById("mute");
const cameraBtn = document.getElementById("camera");
const peersFace = document.getElementById("peersFace");

// 음소거 화면 끔 아이콘 요소
const muteIcon = muteBtn.querySelector(".muteIcon");
const unMuteIcon = muteBtn.querySelector(".unMuteIcon");
const cameraIcon = cameraBtn.querySelector(".cameraIcon");
const unCameraIcon = cameraBtn.querySelector(".unCameraIcon");

const call = document.getElementById("call");

const HIDDEN_CN = "hidden";

let myStream; // 스트림은 오디오와 비디오가 담긴거라 생각하면 됨
let muted = false;
let cameraOff = false;
muteIcon.classList.add(HIDDEN_CN);
unCameraIcon.classList.add(HIDDEN_CN);
let myPeerConnection;
let myDataChannel;

//navigator.mediaDevices.getUserMedia는 유저의 유저미디어 stream을 준다.
//async 비동기적인 작업을 수행하기 위함 async가 붙은 함수는 내부적으로 promise를 반환한다. await는 promise 객체를 반환하는 곳에 써준다.
async function getMedia(){
    
    // 최초 들어올때 videoId 없이 실행되기 위한 constrains
    const initialConstraints = {
        audio: true,
        video: { facingMode: "user"},   // 핸드폰으로 볼때 셀카모드로 보기위함
    };
    try {
        //
        myStream = await navigator.mediaDevices.getUserMedia( // await는 비동기인 해당 방식을 유지하되 코드 위아래 순서를 보장해줌
            initialConstraints // deviceId가 있으면 cameraConstraints 없으면 initialConstraints 가져옴
        );
        myFace.srcObject = myStream; // 얻어온 내 스트림을 video 객체에 삽입! -> 나의 영상이 잘 뜰것이다.
        // await getCameras(); // 맨처음 해당 유저의 카메라 가져오는 함수 한번 호출

    } catch(e){
        console.log(e);
    }
}


// 음소거 토글 동작 함수
function handleMuteClick() {
    myStream
        .getAudioTracks()
        .forEach((track) => (track.enabled = !track.enabled)); // track.enabled는 소리 여부 (true or false)로 현재 value값을 가져와서 반대값 반환
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

// 카메라 on/off 토글 동작 함수
function handleCameraClick() {
    myStream
        .getVideoTracks()
        .forEach((track) => (track.enabled = !track.enabled)); // track.enabled는 화면 여부 (true or false)로 현재 value값을 가져와서 반대값 반환
    if (cameraOff) {
        cameraIcon.classList.remove(HIDDEN_CN);
        unCameraIcon.classList.add(HIDDEN_CN);
        cameraOff = false;
      } else {
        unCameraIcon.classList.remove(HIDDEN_CN);
        cameraIcon.classList.add(HIDDEN_CN);
        cameraOff = true;
      }
}


muteBtn.addEventListener("click", handleMuteClick);
cameraBtn.addEventListener("click", handleCameraClick);

//  ------------------------------------------Welcome Form (join a room)-----------------------------------------------------------

// 방에 입장하면 Media 시작하는 함수
async function initCall(){
    // welcome.hidden = true;
    // call.hidden = false;
    await getMedia();
    makeConnection();
}

// 로드될때 실행?
handleWelcomeSubmit();

// 방생성 함수
async function handleWelcomeSubmit(event){
    // 방에 가입하기 전에 실행 (웹소켓에 속도가 너무 빠르기때문에 emit 에 콜백으로 넣으면 myPeerConnection가 생기기도 전에 B가 가입됨)
    await initCall(); 
    socket.emit("join_room", roomName);
}

//------------------------------Socket Code-----------------------------------------------

// 방에 들어올때 실행 (A가 실행)
socket.on("welcome", async () => {
    // offer를 생성하기 전에 dataChannel을 만들어야함 (다른 peer는 DataChannel이 있을 때 eventlistener만들면 됨)
    myDataChannel = myPeerConnection.createDataChannel("chat");
    myDataChannel.addEventListener("message", (event) => console.log(event.data))
    console.log("made data channel");

    //A가 먼저 방 생성 후에 B가 들어올떄 A가 Offer를 생성 한마디로 다른 브라우저가 참가할 수 있도록 초대장 만듬
    const offer = await myPeerConnection.createOffer(); 
    myPeerConnection.setLocalDescription(offer); // 만든 offer로 연결을 구성 ( peer A를 위한 localDescription)
    console.log("send the offer");
    socket.emit("offer", offer, roomName); // 방에 속한 사람에게 해당 초대장을 보냄
})

// B가 A로부터 해당 offer받음 (B가 실행)
socket.on("offer", async(offer) => { 
    // A가 datachannel이 있을때 event 발생 (datachannel받음)
    myPeerConnection.addEventListener("datachannel", (event) => {
        myDataChannel = event.channel;
        myDataChannel.addEventListener("message", (event) => console.log(event.data))
    });

    console.log("received the offer");
    // 멀리 떨어진 peer A의(내가 아닌 다른 누군가) description을 세팅함 (내 Peer의 description을 뜻함)
    myPeerConnection.setRemoteDescription(offer); 
    const answer = await myPeerConnection.createAnswer() // answer를 생성4
    myPeerConnection.setLocalDescription(answer); // 만든 answer로 연결을 구성 
    socket.emit("answer", answer, roomName); // 만든 answer을 A에게 보내기
    console.log("send the answer");
})

// A가 B로부터 answer 받음 (A가 실행)
socket.on("answer", (answer) => {
    console.log("received the answer");
    myPeerConnection.setRemoteDescription(answer); 
});

socket.on("ice", (ice) => {
    console.log("received candidate");
    // 우리가 상대의 candidate를 받으면 우리쪽에 ICECandidate를 추가
    myPeerConnection.addIceCandidate(ice);
})

// 클라이언트가 연결 끊을 시 상대 video 끄기
socket.on("bye", () => {
    peersFace.srcObject = null;
})

//-------------------------------RTC Code----------------------------------------

// 두 브라우저의 연결을 만드는 함수
function makeConnection(){
    myPeerConnection = new RTCPeerConnection({
        iceServers:[// 구글이 제공하는 STUN 서버로 나의 장치에서 공용주소를 알려주는 서버 (서로 다른 네트워크에 있어도 연결해줌)
            {
                urls: [
                    "stun:stun.l.google.com:19302",
                    "stun:stun1.l.google.com:19302",
                    "stun:stun2.l.google.com:19302",
                    "stun:stun3.l.google.com:19302",
                    "stun:stun4.l.google.com:19302",
                ],
            },
        ],
    });
    // myPeerConnection을 만들면 그 즉시 ice event를 listen
    myPeerConnection.addEventListener("icecandidate", handleIce);
    myPeerConnection.addEventListener("addstream", handleAddStream)
    myStream
        .getTracks()
        .forEach((track) => myPeerConnection.addTrack(track, myStream)); //나의 스트림에서 오디오와 비디오 트랙 가져와서 추가
}

function handleIce(data){
    console.log("sent candidate");
    //  icecandidate를 받으면 A와 B가 서로 candidate를 서로 주고받는다.
    // B의 모든 candidate를 A에게 보낸다.
    // A의 모든 candidate를 B에게 보낸다.
    socket.emit("ice", data.candidate, roomName);
}

function handleAddStream(data){
    // 나의 peer로 부터 stream을 가져옴
    console.log("got an stream from my peer");
    console.log("Peer's Stream", data.stream);
    console.log("My stream", myStream);
    
    
    // 상대의 stream을 가져와서 상대 video Object에 추가! 상대 비디오가 출력됨
    peersFace.srcObject = data.stream;
}


