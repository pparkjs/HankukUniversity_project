import http from "http";
import SocketIO from "socket.io";
import express from "express";


/** set express */
const app = express();
const cors = require('cors');

app.use(cors({
    origin: true, // 출처 허용 옵션
    credential: true // 사용자 인증이 필요한 리소스(쿠키 ..등) 접근
}));



/** pug view engine */
app.set("view engine", "pug");
app.set("views", __dirname + "/views");

app.use("/public", express.static(__dirname + "/public"));

/** router */
app.get("/study", (req, res) => {
    let data = req.query;
    let name = data.room
    console.log(name);
    res.render("home", { name })
});

/** create http server */
const httpServer = http.createServer(app);

/** create io server */
const wsServer = SocketIO(httpServer);

wsServer.on("connection", socket => {

    let roomNm; // 연결 끊을 때 사용하기 위함.
    socket.on("join_room", (room, id) => {
        roomNm = room
        socket.join(room);
        console.log(socket.adapter);
        socket.to(room).emit("welcome", id);
    });

    socket.on("offer", (offer, room, newbieID, offersId) => {
        console.log("뉴비아이디 : " , newbieID);
        console.log("offer제공자 아이디 : " , offersId);
        socket.to(newbieID).emit("offer", offer, offersId); 
    });

    socket.on("answer", (offer, room, offersId, newbieId) => {
        console.log("응답받을 offer 제공자 아아디 : " , offersId);
        console.log("응답 보내는 newbie 아이디 : " , newbieId);
        socket.to(offersId).emit("answer", offer, newbieId);
    });

    socket.on("ice", (ice, room, othersId, myId) => {
        console.log("ice 보낸 녀셕 : ", myId)
        console.log("ice 받을 녀석 : ", othersId);
        socket.to(othersId).emit("ice", ice, myId);
    });

      // 클라이언트가 연결 끊을 시 동작.
    socket.on("disconnect", () => {
        console.log("체크 : ", roomNm);
        console.log("아이디 : ", socket.id);
        socket.in(roomNm).emit("bye", socket.id);
    })

})

/** open server */
const port = 3000;
httpServer.listen(port, () => { console.log(`http://localhost:${port}`) });