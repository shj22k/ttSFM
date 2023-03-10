package main.sfm.common;

public abstract class ChabunUtil {
	
	public static final String BIZ_GUBUN_M = "M"; // 멤버 
	public static final String BIZ_GUBUN_P = "P"; // 매치 
	public static final String BIZ_GUBUN_C = "C"; // 커뮤니티 
	public static final String BIZ_GUBUN_RC = "RC"; // 커뮤니티댓글 
	public static final String BIZ_GUBUN_N = "N"; // 공지
	public static final String BIZ_GUBUN_E = "E"; // 이벤트
	public static final String BIZ_GUBUN_PAY = "PA"; // 결제

	
	public static String numPad(String t, String c){
		
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	
	public static String getSFMmemChabun(String type, String memNum) {
		return BIZ_GUBUN_M.concat(ChabunUtil.numPad(type, memNum));
	}
	
	public static String getSFMmatchChabun(String type, String memNum) {
		return BIZ_GUBUN_P.concat(ChabunUtil.numPad(type, memNum));
	}
	
	public static String getSFMcommunityChabun(String type, String memNum) {
		return BIZ_GUBUN_C.concat(ChabunUtil.numPad(type, memNum));
	}
	
	public static String getSFMrcommunityChabun(String type, String memNum) {
		return BIZ_GUBUN_RC.concat(ChabunUtil.numPad(type, memNum));
	}

	public static String getSFMnoticeChabun(String type, String noticeNum) {
		return BIZ_GUBUN_N.concat(ChabunUtil.numPad(type, noticeNum));
    }
	
	public static String getSFMeventChabun(String type, String eventNum) {
		return BIZ_GUBUN_E.concat(ChabunUtil.numPad(type, eventNum));
    }
	
	public static String getSFMpaymentChabun(String type, String eventNum) {
		return BIZ_GUBUN_PAY.concat(ChabunUtil.numPad(type, eventNum));
    }


	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String c = "1";
		System.out.println(">>> : " + ChabunUtil.getSFMrcommunityChabun("N", c));		

	}

}
