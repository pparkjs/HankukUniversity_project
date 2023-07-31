<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.myChart{
	height: 200px;
}
.card-header{
	margin-bottom: 0px;
	margin-top: -5px;
    background-color: rgb(224, 224, 224);
    border-bottom: 3px solid #adb17d;
}
.card-title{
	font-size: 1.5em;
	font-weight: bold;
	color: rgb(68, 68, 68)
}
</style>
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">home</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">총지표</a></li>
		</ol>
    </div>
	<div class="container-fluid">
		<div class="card" id="card-title-1">
	
			<div class="card-body">
				<div class="row">
	                <div class="col-lg-6 col-sm-6">
	                    <div class="card">
	                        <div class="card-header">
	                            <h4 class="card-title">년도별 학생수</h4>
	                            <div class="icon-box icon-box-lg bg-primary-light rounded-circle" style="background-color: rgb(224, 224, 224); margin-top: -40px; margin-bottom: -40px;">
									<svg width="46" height="46" viewBox="0 0 46 46" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path fill-rule="evenodd" clip-rule="evenodd" d="M32.8961 26.5849C34.1612 26.5849 35.223 27.629 35.0296 28.8783C33.8947 36.2283 27.6026 41.6855 20.0138 41.6855C11.6178 41.6855 4.8125 34.8803 4.8125 26.4862C4.8125 19.5704 10.0664 13.1283 15.9816 11.6717C17.2526 11.3579 18.5553 12.252 18.5553 13.5605C18.5553 22.4263 18.8533 24.7197 20.5368 25.9671C22.2204 27.2145 24.2 26.5849 32.8961 26.5849Z" stroke="var(--primary)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
										<path fill-rule="evenodd" clip-rule="evenodd" d="M41.1733 19.2019C41.2739 13.5059 34.2772 4.32428 25.7509 4.48217C25.0877 4.49402 24.5568 5.04665 24.5272 5.70783C24.3121 10.3914 24.6022 16.4605 24.764 19.2118C24.8134 20.0684 25.4864 20.7414 26.341 20.7907C29.1693 20.9526 35.4594 21.1736 40.0759 20.4749C40.7035 20.3802 41.1634 19.8355 41.1733 19.2019Z" stroke="var(--primary)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
									</svg>
								</div>
	                        </div>
	                        <div class="card-body">
	                       		<canvas class="myChart" height="145" id="myChart1"></canvas>
		                    </div>
	                    </div>
	                </div>
	                 <div class="col-lg-6 col-sm-6">
	                    <div class="card">
	                        <div class="card-header">
	                            <h3 class="card-title">학적상황</h3>
	                            <div class="icon-box icon-box-lg bg-primary-light rounded-circle" style="background-color: rgb(224, 224, 224); margin-top: -40px; margin-bottom: -40px;">
									<svg class="peity" height="56" width="56"><path d="M 28 0 A 28 28 0 1 1 15.851255304708374 53.22712830126774 L 20.190092695883955 44.217439622243546 A 18 18 0 1 0 28 10" data-value="4" fill="rgb(54, 147, 255)"></path><path d="M 15.851255304708374 53.22712830126774 A 28 28 0 0 1 27.999999999999996 0 L 27.999999999999996 10 A 18 18 0 0 0 20.190092695883955 44.217439622243546" data-value="3" fill="rgba(54, 147, 255, .5)"></path></svg>
								</div> 
	                        </div>
	                        <div class="card-body">
	                       		<canvas class="myChart" height="145" id="myChart3"></canvas>
		                    </div>
	                    </div>
	                </div>                       
	                <div class="col-lg-6 col-sm-6">
	                    <div class="card">
	                        <div class="card-header">
	                            <h4 class="card-title">학과별 학생수</h4>
	                            <div class="icon-box icon-box-lg bg-primary-light rounded-circle" style="background-color: rgb(224, 224, 224); margin-top: -40px; margin-bottom: -40px;">
									<svg class="peity" height="60" width="60">
									    <rect data-value="5" fill="#0d99ff" x="1" y="44.44444444444444" width="7" height="55.55555555555556"></rect>
									    <rect data-value="6" fill="#ffaa2b" x="11.000000000000002" y="36.66666666666667" width="6.999999999999998" height="33.33333333333333"></rect>
									    <rect data-value="9" fill="#3693FF" x="21" y="0" width="8" height="100"></rect>
									    <rect data-value="6" fill="#0d99ff" x="31" y="33.33333333333334" width="7" height="66.66666666666666"></rect>
									    <rect data-value="5" fill="#ffaa2b" x="40.99999999999999" y="44.44444444444444" width="7.000000000000014" height="55.55555555555556"></rect>
									    <rect data-value="9" fill="#3693FF" x="50.99999999999999" y="0" width="7.000000000000007" height="100"></rect>
									    <rect data-value="7" fill="#0d99ff" x="61" y="22.222222222222214" width="7" height="77.77777777777779"></rect>
									    <rect data-value="3" fill="#ffaa2b" x="71" y="66.66666666666667" width="7" height="33.33333333333333"></rect>
									    <rect data-value="5" fill="#3693FF" x="81" y="44.44444444444444" width="7" height="55.55555555555556"></rect>
									    <rect data-value="4" fill="#0d99ff" x="91" y="77.77777777777777" width="7" height="22.22222222222223"></rect>
									</svg>						
								</div> 
	                        </div>
	                        <div class="card-body">
	                       		<canvas class="myChart" height="145" id="myChart2"></canvas>
		                    </div>
	                    </div>
	                </div>
	                  <div class="col-lg-6 col-sm-6">
	                    <div class="card">
	                        <div class="card-header">
	                            <h3 class="card-title">취업현황</h3>
	                            <div class="icon-box icon-box-lg bg-primary-light rounded-circle" style="background-color: rgb(224, 224, 224); margin-top: -40px; margin-bottom: -40px;">
									<svg class="peity" height="60" width="60">
									    <rect data-value="0" fill="rgb(16, 0, 147)" x="1" y="0" width="7" height="25"></rect>
									    <rect data-value="-3" fill="rgb(16, 20, 147)" x="11.000000000000002" y="0" width="6.999999999999998" height="18.85714285714286"></rect>
									    <rect data-value="-6" fill="rgb(16, 40, 147)" x="21" y="0" width="7" height="85.71428571428572"></rect>
									    <rect data-value="-4" fill="rgb(16, 60, 147)" x="31" y="0" width="7" height="47.142857142857146"></rect>
									    <rect data-value="-5" fill="rgb(16, 80, 147)" x="40.99999999999999" y="0" width="7.000000000000014" height="71.42857142857143"></rect>
									    <rect data-value="-4" fill="rgb(16, 101, 147)" x="50.99999999999999" y="0" width="7.000000000000007" height="27.142857142857146"></rect>
									    <rect data-value="-7" fill="rgb(16, 121, 147)" x="61" y="0" width="7" height="200"></rect>
									</svg>
								</div> 
	                        </div>
	                        <div class="card-body">
	                       		<canvas class="myChart" height="145" id="myChart4"></canvas>
		                    </div>
	                    </div>
	                </div>     
	                      
	            </div>
			</div>
		</div>
	</div>
</div>
<script src="/vendor/apexchart/apexchart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<script>
    
    let myChart1 = document.getElementById('myChart1').getContext('2d');
    let myChart2 = document.getElementById('myChart2').getContext('2d');
    let myChart3 = document.getElementById('myChart3').getContext('2d');
    let myChart4 = document.getElementById('myChart4').getContext('2d');

    let barChart1 = new Chart(myChart1, {
        type: 'line',
        data: {
        labels: ['2017년','2018년', '2019년', '2020년', '2021년', '2022년','2023년'],
        datasets:[{
            label: '학생수',
            data: [
                400,600,720,580,730,780,930
            ],
            borderColor: '#800000',
            tension: 0.1
        }]
    }
    })


let barChart2 = new Chart(myChart2, {
    type: 'bar', 
    data: {
        labels: ['국어국문학과', '영어영문학과', '사학과', '문헌정보학과', '국어교육과', '영어교육과', '교육학과', '수학교육과', 
        	'정보통신공학과', '전기전자공학과', '건축학과', '기계공학과', '컴퓨터공학과', '산업경영공학과', '수학과', '경영학과',
        	'회계학과', '경제학과', '인문교양학부', '슈퍼울트라공학과'],
        datasets:[{
            label: '학과별 학생수',
            data: [
                42,30,32,21,22,28,41,18,52,36,46,38,53,68,19,43,31,23,30,18
            ],
            backgroundColor: '#8000006d',
            borderWidth: 0,
            borderColor: '#800000',
            hoverBorderWidth: 5
        }]
    }
})
    
let barChart3 = new Chart(myChart3, {
    type: 'doughnut', 
    data: {
        labels: ['재학생', '휴학생', '자퇴생'],
        datasets:[{
            label: '학적 상태현황',
            data: [
                1200,300,50
            ],
            backgroundColor:[
                'rgb(251, 203, 218)',
                '#adb17d',
                '#800000'
            ],
            hoverOffset: 10
        }]
    },
    options: {
        plugins: {
            datalabels: { 
                color: 'black', // 텍스트 색상 설정
                font: {
                    size: 10 // 텍스트 크기 설정
                },
                // 차트 바깥쪽에 데이터 값 표시
                formatter: (value, ctx) => {
                    let label = ctx.chart.data.labels[ctx.dataIndex];
                    
                    return label + ": " + value; // "라벨: 값" 형식으로 텍스트 반환
                },
                anchor: 'center', // 텍스트 위치 설정 (end는 섹션 끝에 배치)
                align: 'center' // 텍스트 정렬 설정 (end는 오른쪽 정렬)
            }
        },
        legend: {
            display: true, // 라벨 표시 여부 설정 (true: 표시, false: 숨김)
            position: 'bottom', // 라벨 위치 설정 (top, left, bottom, right 중 선택)
            labels: {
                font: {
                    size: 12 // 라벨 텍스트 크기 설정
                }
            }
        },formatter: (value, ctx) => {
            let label = ctx.chart.data.labels[ctx.dataIndex];
            let total = ctx.chart.data.datasets[0].data.reduce((acc, cur) => acc + cur, 0);
            let percentage = ((value / total) * 100).toFixed(1);
            return label + ": " + percentage + "%";
        },
    }
})

    let barChart4 = new Chart(myChart4, {
        type: 'bar', 
        data: {
            labels: ['국어국문학과', '영어영문학과', '사학과', '문헌정보학과', '국어교육과', '영어교육과', '교육학과', '수학교육과', 
            	'정보통신공학과', '전기전자공학과', '건축학과', '기계공학과', '컴퓨터공학과', '산업경영공학과', '수학과', '경영학과',
            	'회계학과', '경제학과', '인문교양학부', '슈퍼울트라공학과'],
            datasets:[{
                label: '학과',
                data: [
                	 42,30,32,21,22,28,41,18,52,36,46,38,53,68,19,43,31,23,30,18
                ],
                backgroundColor: '#8000006d',
                borderWidth: 0,
                borderColor: '#800000',
                hoverBorderWidth: 5
            },
            {
                label: '취업인원',
                data: [
                	 21,26,28,9,13,17,32,12,19,29,43,31,52,22,11,18,29,2,17,17
                ],
                backgroundColor: 'rgb(140, 140, 140)',
                borderWidth: 0,
                borderColor: 'rgb(80, 80, 80)',
                hoverBorderWidth: 5
            }
            
            ]
        }
    })
</script>