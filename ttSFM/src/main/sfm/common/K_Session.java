package main.sfm.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class K_Session {

	private static final String K_SESSION_ID = "KID";
	
//	private static K_Session kSession = null;
//	public static K_Session getInstance() {
//		if(kSession == null) {
//			kSession = new K_Session();
//		}
//		return kSession;
//	}
	
	// 싱글톤 패턴 : Singleton pattern : 싱글톤으로 구현한 인스턴스는 '전역'이므로, 다른 클래스의 인스턴스들이 데이터를 공유하는 것이 가능한 장점이 있다.
	// 			최초 한번의 new연산자를 통해서 고정된 메모리 영역을 사용하기 때문에 추후 해당 객체에 접근할 때의 메모리 낭비를 방지한다.
	//			또한 전역으로 사용되는 인스턴스이기 때문에 다른 클래스와의 '데이터 공유'가 쉽다.
	private static class LazyHolder{
		public static final K_Session SESSIONLISTENER_INSTANCE = new K_Session();
	}	
	
	public static K_Session getInstance(){
		return LazyHolder.SESSIONLISTENER_INSTANCE;
	}

	// 생성자는 외부에서 호출못하게 private 으로 지정해야 한다.
	public K_Session(){
	}
	
	// 세션 종료 및 초기화
	public void killSession(final HttpServletRequest hReq){
			
		HttpSession hSession = hReq.getSession(false);			
		if (hSession !=null) {
			hSession.removeAttribute(K_SESSION_ID);
			// invalidate() : 화면전체를 재표시 하라(인스턴스한것들을 지워라)
			hSession.invalidate();
		}
	}
	
	// 세션 할당
	public boolean setSession(final HttpServletRequest hReq, final String userID) {
		
		HttpSession hSession = hReq.getSession();
		String k_session_val = (String)hSession.getAttribute(K_SESSION_ID);
		int nCnt = 0;
		
		if (k_session_val !=null) {
			boolean b1 = k_session_val.equals(userID);
			
			if (b1) { 
				nCnt++; 
			}else {
				System.out.println("세션 없음 >>> : ");
			}
		}else {
			System.out.println("세션 없음 >>> : ");
		}
		
		if (nCnt == 0) {
//			hSession.invalidate();
			hSession.setAttribute(K_SESSION_ID, userID);
			hSession.setMaxInactiveInterval(60*60*9); // 9시간 
			
			return false;
		}		
		return true;
	}
	
	// 세션 가져오기
	public String getSession(final HttpServletRequest hReq){
		
		String strSession = "";		
		// getSession(false) : HttpSession이 존재하면 현재 HttpSession을 반환하고 존재하지 않으면 새로이 생성하지 않고 그냥 null을 반환합니다.
		// getSession(), getSession(true) : HttpSession이 존재하면 현재 HttpSession을 반환하고 존재하지 않으면 새로이 생성합니다.
		HttpSession hSession = hReq.getSession(false);		
		if (hSession !=null) {
			strSession = (String)hSession.getAttribute(K_SESSION_ID);
		}	// getSession(false) 이기 때문에 else가 필요 없다.						
		return strSession;
	}	
}
