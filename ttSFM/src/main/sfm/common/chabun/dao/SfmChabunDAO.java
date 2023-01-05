package main.sfm.common.chabun.dao;

import main.sfm.community.vo.SfmCommunityVO;
import main.sfm.match.vo.SfmMatchVO;
import main.sfm.member.vo.SfmMemVO;
import main.sfm.notice.vo.SfmNoticeVO;
import main.sfm.rcommunity.vo.SfmRcommunityVO;

public interface SfmChabunDAO {

	public SfmMemVO getSFMmemChabun();
	public SfmMatchVO getSFMmatchChabun();
	public SfmCommunityVO getSFMcommunityChabun();
	public SfmRcommunityVO getSFMrcommunityChabun();
	public SfmNoticeVO getSFMnoticeChabun();
}
