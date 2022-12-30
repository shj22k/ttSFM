package main.sfm.common.chabun.service;

import main.sfm.community.vo.SfmCommunityVO;
import main.sfm.match.vo.SfmMatchVO;
import main.sfm.member.vo.SfmMemVO;
import main.sfm.notice.vo.SfmNoticeVO;

public interface SfmChabunService {

	public SfmMemVO getSFMmemChabun();
	public SfmMatchVO getSFMmatchChabun();
	public SfmCommunityVO getSFMcommunityChabun();
	public SfmNoticeVO getSFMnoticeChabun();

}
