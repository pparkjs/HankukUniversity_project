package kr.or.hku.common.controller.file;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class MediaUtils {

	private static Map<String, MediaType> mediaMap;
	
	static {
		mediaMap = new HashMap<String, MediaType>();
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	
	/** 확장자를 매개변수로 받아 mediaType을 return 해줌 */
	public static MediaType getMediaType(String type) {
		return mediaMap.get(type.toUpperCase());
	}
}
