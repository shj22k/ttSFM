package main.sfm.common;

public abstract class ChabunUtil {
	
	public static final String BIZ_GUBUN_M = "M"; // 멤버 
	public static final String BIZ_GUBUN_P = "P"; // 매치 

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

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String c = "1";
		System.out.println(">>> : " + ChabunUtil.getSFMmemChabun("D", c));		

	}

}
