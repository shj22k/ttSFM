package main.sfm.rcommunity.dao;

import java.util.List;

import main.sfm.rcommunity.vo.SfmRcommunityVO;

public interface SfmRcommunityDAO {

	public int sfmRcommunityInsert(SfmRcommunityVO rcvo);
	public List<SfmRcommunityVO> sfmRcommunitySelectAll(SfmRcommunityVO rcvo);
	public int sfmRcommunityDelete(SfmRcommunityVO rcvo);

}
