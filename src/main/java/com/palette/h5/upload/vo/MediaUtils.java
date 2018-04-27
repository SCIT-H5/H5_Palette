package com.palette.h5.upload.vo;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class MediaUtils {
    
	private static Map<String, MediaType> mediaMap;
    // 자동로딩
    static {
        mediaMap = new HashMap<String, MediaType>();
        mediaMap.put("JPG", MediaType.IMAGE_JPEG);
        mediaMap.put("GIF", MediaType.IMAGE_GIF);
        mediaMap.put("PNG", MediaType.IMAGE_PNG);
    }
    public static MediaType getMediaType(String type) {
        return mediaMap.get(type.toUpperCase());
    }
    
    // UploadFileUtils 클래스에서 추출한 파일의 확장자명을 대문자로 변환하고, mediaMap에 담긴 값을 호출한 뒤 리턴
    // 3가지(jpg, gif, png) 이미지 파일일 경우에는 값이 복사되어 리턴되지만, 아닐 경우에는 null상태로 리턴된다.
}
