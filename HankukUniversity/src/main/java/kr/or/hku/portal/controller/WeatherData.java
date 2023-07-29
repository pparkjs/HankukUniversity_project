package kr.or.hku.portal.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


public class WeatherData {
	Date d = new Date();
	SimpleDateFormat f1 = new SimpleDateFormat("yyyyMMdd");
	SimpleDateFormat f2 = new SimpleDateFormat("HH");
	String date = f1.format(d);
	String time = Integer.parseInt(f2.format(d))-1+"00";
	private String nx = "68";	//위도
    private String ny = "100";	//경도
    private String baseDate = date ;	//조회하고싶은 날짜
    private String baseTime = time;	//조회하고싶은 시간
    private String type = "json";	//조회하고 싶은 type(json, xml 중 고름)

    public String lookUpWeather() throws IOException,ParseException {

//		참고문서에 있는 url주소
        String apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst";
//         홈페이지에서 받은 키
        String serviceKey = "JMS3kJYKgXNh4tHmq2kxdO3CaAn6I08EGNgkjN6NS4BHGn4Te%2BISvHCoslWO3kfFS5ChbcexvZjVMROTkysHQQ%3D%3D";

        StringBuilder urlBuilder = new StringBuilder(apiUrl);
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "="+serviceKey);
        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8")); //경도
        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8")); //위도
        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(baseDate, "UTF-8")); /* 조회하고싶은 날짜*/
        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode(baseTime, "UTF-8")); /* 조회하고싶은 시간 AM 02시부터 3시간 단위 */
        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode(type, "UTF-8"));	/* 타입 */

        /*
         * GET방식으로 전송해서 파라미터 받아오기
         */
        URL url = new URL(urlBuilder.toString());

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        
        rd.close();
        conn.disconnect();
        String result= sb.toString();
        
        System.out.println(result);

	//=======이 밑에 부터는 json에서 데이터 파싱해 오는 부분이다 우하하하=====//
        
        JSONParser parser = new JSONParser(); 
		JSONObject obj = (JSONObject) parser.parse(result); 
		// response 키를 가지고 데이터를 파싱 
		JSONObject parse_response = (JSONObject) obj.get("response"); 
		// response 로 부터 body 찾기
		JSONObject parse_body = (JSONObject) parse_response.get("body"); 
		// body 로 부터 items 찾기 
		JSONObject parse_items = (JSONObject) parse_body.get("items");

		// items로 부터 itemlist 를 받기 
		JSONArray parse_item = (JSONArray) parse_items.get("item");
			
			
			
		JSONObject weather = new JSONObject();
		Object fcstTime;
		Object category;
		Object value;
			
		/**
		 * parse_item.size()/10 : 몇 개의 시간 데이터를 받아 왔는지
		 * 받아온 데이터의 갯수 / 시간당 데이터 갯수 = 
		 */
		int dataSize = parse_item.size()/10;
		String res = "";
		
		for(int i=0;i<dataSize;i++) {
			for(int k=0;k<10;k++) {
				weather = (JSONObject) parse_item.get((i*dataSize)+k);
				fcstTime = weather.get("fcstTime");
				category = weather.get("category");
				value = weather.get("fcstValue");
				res +=fcstTime+" : " +category+"  "+value;
			}
		}
		
		return res;
    }
}
