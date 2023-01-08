package main.sfm.common.chabun.service;

import main.sfm.community.vo.SfmCommunityVO;
import main.sfm.event.vo.SfmEventVO;
import main.sfm.match.vo.SfmMatchVO;
import main.sfm.member.vo.SfmMemVO;
import main.sfm.notice.vo.SfmNoticeVO;
import main.sfm.payment.vo.SfmPaymentVO;
import main.sfm.rcommunity.vo.SfmRcommunityVO;

public interface SfmChabunService {

	public SfmMemVO getSFMmemChabun();
	public SfmMatchVO getSFMmatchChabun();
	public SfmCommunityVO getSFMcommunityChabun();
	public SfmRcommunityVO getSFMrcommunityChabun();
	public SfmNoticeVO getSFMnoticeChabun();
	public SfmEventVO getSFMeventChabun();
	public SfmPaymentVO getSFMpaymentChabun();

}
