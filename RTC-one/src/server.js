import http from "http";
import SocketIO from "socket.io";
import express from "express";
import { Socket } from 'dgram';

// express를 이용하여 웹서버 생성
const app = express();
app.set("view engine", "pug"); // view 엔진 설정
app.set("views", __dirname + "/views"); // 현재 디렉토리에있는 /views 폴더를  뷰폴더로 지정
// express.static 미들웨어를 사용하여 정적파일 제공 /public경로 요청시 해당 디렉토리에 파일 제공
app.use("/public", express.static(__dirname + "/public")); 
app.get("/rtc", (req, res) => {
    let data = req.query;
    let name = data.dscsnNo;
    res.render("home", { name })
});
// app.get("/*", (_, res) => res.redirect("/"));


// 이렇게하면 http 서버랑 io 서버 둘다 돌릴 수 있음
const httpServer = http.createServer(app); // http 서버 제작
const wsServer = SocketIO(httpServer);

wsServer.on("connection", socket => {

    let roomNm; // 연결 끊을 때 사용하기 위함.

    socket.on("join_room", (roomName) => {
        roomNm = roomName;
        socket.join(roomName);
        console.log(socket.adapter);
        socket.to(roomName).emit("welcome");
    });

    // offer를 받고 해당방에 속한 나를 제외한 모든이에게 전송
    socket.on("offer", (offer, roomName) => {
        socket.to(roomName).emit("offer", offer);
    });
    // answer를 받고 해당방에 속한 나를 제외한 모든이에게 전송
    socket.on("answer", (answer, roomName) => {
        socket.to(roomName).emit("answer", answer);
    });
    // 우리가 icecandidate를 받으며ㅓㄴ
    socket.on("ice", (ice, roomName) => {
        socket.to(roomName).emit("ice", ice);
    })

    // 클라이언트가 연결 끊을 시 동작.
    socket.on("disconnect", () => {
        console.log("체크 : ", roomNm);
        socket.in(roomNm).emit("bye");
    })

});

const handleListen = () => console.log(`Listening on http://localhost:3001`);
httpServer.listen(3001, handleListen);







