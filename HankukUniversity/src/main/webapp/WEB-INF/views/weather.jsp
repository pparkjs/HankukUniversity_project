<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://js.bootpay.co.kr/bootpay-4.3.1.min.js" type="application/javascript"></script>
<title>Insert title here</title>
</head>
<body>
<div>
	<table border="1" style="border-collapse:collapse; ">
		<tr>
			<td>내가있는곳은?</td>
			<td id="city"></td>
		</tr>	
		<tr>
			<td>날씨는?</td>
			<td id="weather"></td>
		</tr>	
		<tr>
			<td>최저온도</td>
			<td id="min"></td>
		</tr>	
		<tr>
			<td>최고온도</td>
			<td id="max"></td>
		</tr>	
	</table>

</div>
</body>
<script>
const api_key = 'cb67762ab54bc7033bd6d74f4597ada9';

function onGeoOk(position) {
  const lat = position.coords.latitude;
  console.log("내용1:",lat);
  const lon = position.coords.longitude;
  console.log("내용2:",lon)
  const url = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${api_key}&lang=kr&units=metric`;

  fetch(url)
    .then(response => response.json())
    .then(data => {
    	console.log(data);
      console.log(data.name);
      $('#city')[0].innerText = data.name;
      $('#weather')[0].innerText = data.weather[0].main;
      $('#min')[0].innerText = data.main.temp_min;
      $('#max')[0].innerText = data.main.temp_max;
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

</script>
</html>