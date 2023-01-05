package main.sfm.rcommunity.service;

import java.util.List;

import main.sfm.rcommunity.vo.SfmRcommunityVO;

public interface SfmRcommunityService {

	public int sfmRcommunityInsert(SfmRcommunityVO rcvo);
	public List<SfmRcommunityVO> sfmRcommunitySelectAll(SfmRcommunityVO rcvo);
	public int sfmRcommunityDelete(SfmRcommunityVO rcvo);

}
