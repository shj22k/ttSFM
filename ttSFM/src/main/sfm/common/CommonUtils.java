package main.sfm.common;

public abstract class CommonUtils {

	public static String upload_path = "C:\\00.KOSMO120\\30.web\\el_ttSFM_work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ttSFM\\fileupload";
	
	// 사진 파일 저장
	public static final String SFM_IMG_UPLOAD_PATH = upload_path+"\\mem_photo";
	public static final String SFM_IMG_UPLOAD_MATCH_PATH = upload_path+"\\match_photo";
	public static final String SFM_IMG_UPLOAD_COMMUNITY_PATH = upload_path+"\\community_photo";
	public static final String SFM_IMG_UPLOAD_EVENT_PATH = upload_path+"\\event_photo";
	
	public static final int SFM_IMG_FILE_SIZE = 10*1024*1024;
	public static final String SFM_EN_CODE = "UTF-8";
	
	// 페이지 이동
	public static final int SFM_PAGE_SIZE = 5;
	public static final int SFM_GROUP_SIZE = 5;
	public static final int SFM_CUR_PAGE = 1;
	public static final int SFM_TOTAL_COUNT = 0;

}
