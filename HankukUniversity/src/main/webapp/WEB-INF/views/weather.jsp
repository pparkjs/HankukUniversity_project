<%@ page import="kr.or.hku.portal.controller.WeatherData" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://js.bootpay.co.kr/bootpay-4.3.1.min.js" type="application/javascript"></script>
<title>Insert title here</title>
<style type="text/css">
 #box:before{ 
  content: ''; 
 background: rgba(0, 0, 0, 0.3); 
 position: absolute; 
 top: 7px; 
 left: 7px; 
 width: 13.1%; 
 height: 84%; 
 } 
</style>
</head>
<body>
<div id="box" style="display :flex; flex-direction:column; justify-content:center; align-items:center; border:1px; width : 250px; height: 300px;  background-size: 100% 100% ; color:white; ">

	<h1 id="city" style="color:white; z-index: 1000;"></h1>
	<h4 id="weather" style="color:white; z-index: 1000;"></h4>
	<h1 id="temp" style="color:white; z-index: 1000;"></h1>
		
</div>
</body>
<script>
//오픈웨더 날씨API키 입력해야됨

function onGeoOk(position) {
  const lat = position.coords.latitude;
  console.log("내용1:",lat);
  const lon = position.coords.longitude;
  console.log("내용2:",lon)
  const url = `https://api.openweathermap.org/data/2.5/weather?lat=\${lat}&lon=\${lon}&appid=${key}&lang=kr&units=metric`;

  fetch(url)
    .then(response => response.json())
    .then(data => {
      console.log(data);
      console.log(data.name);
      $('#city')[0].innerText = data.name;
  
      cod = 802;
//       cod = parseInt(data.cod);
      if(cod >= 200 && cod < 300 ){
    	  $('#box').css('background-image','url(/images/weather/stormclouds.jpg)');
    	 $('#weather')[0].innerText = wDescEngToKor(cod);
      }else if(cod >= 300 && cod <600){
    	  
    	  $('#box').css('background-image','url(/images/weather/rain.jpg)');
    	 $('#weather')[0].innerText = wDescEngToKor(cod);
      }else if(cod == 800 || cod == 801){
    	  $('#box').css('background-image','url(/images/weather/sunny.jpg)');
    	 $('#weather')[0].innerText = wDescEngToKor(cod);
    	  
      }else if(cod == 802){
    	  $('#box').css('background-image','url(/images/weather/cloudsky.jpg)');
     	 $('#weather')[0].innerText = wDescEngToKor(cod);
       }
      
      $('#temp')[0].innerText = Math.round(data.main.temp*10)/10 + '°C';

    })
    .catch(error => {
      console.error('데이터 가져오기 실패:', error);
    });
}

function onGeoError() {
  alert("위치를 알 수 없어~");
}

window.addEventListener('load', function() {
  navigator.geolocation.getCurrentPosition(onGeoOk, onGeoError);
});

function wDescEngToKor(w_id) {
	var w_id_arr = [201,200,202,210,211,212,221,230,231,232,
	300,301,302,310,311,312,313,314,321,500,
	501,502,503,504,511,520,521,522,531,600,
	601,602,611,612,615,616,620,621,622,701,
	711,721,731,741,751,761,762,771,781,800,
	801,802,803,804,900,901,902,903,904,905,
	906,951,952,953,954,955,956,957,958,959,
	960,961,962];
	var w_kor_arr = ["가벼운 비를 동반한 천둥구름","비를 동반한 천둥구름","폭우를 동반한 천둥구름","약한 천둥구름",
	"천둥구름","강한 천둥구름","불규칙적 천둥구름","약한 연무를 동반한 천둥구름","연무를 동반한 천둥구름",
	"강한 안개비를 동반한 천둥구름","가벼운 안개비","안개비","강한 안개비","가벼운 적은비","적은비",
	"강한 적은비","소나기와 안개비","강한 소나기와 안개비","소나기","악한 비","중간 비","강한 비",
	"매우 강한 비","극심한 비","우박","약한 소나기 비","소나기 비","강한 소나기 비","불규칙적 소나기 비",
	"가벼운 눈","눈","강한 눈","진눈깨비","소나기 진눈깨비","약한 비와 눈","비와 눈","약한 소나기 눈",
	"소나기 눈","강한 소나기 눈","박무","연기","연무","모래 먼지","안개","모래","먼지","화산재","돌풍",
	"토네이도","구름 한 점 없는 맑은 하늘","약간의 구름이 낀 하늘","드문드문 구름이 낀 하늘","구름이 거의 없는 하늘",
	"구름으로 뒤덮인 흐린 하늘","토네이도","태풍","허리케인","한랭","고온","바람부는","우박","바람이 거의 없는",
	"약한 바람","부드러운 바람","중간 세기 바람","신선한 바람","센 바람","돌풍에 가까운 센 바람","돌풍",
	"심각한 돌풍","폭풍","강한 폭풍","허리케인"];
	for(var i=0; i<w_id_arr.length; i++) {
	if(w_id_arr[i]==w_id) {
	return w_kor_arr[i];
	break;
	}
	}
	return "none";
	}
</script>
</html>
