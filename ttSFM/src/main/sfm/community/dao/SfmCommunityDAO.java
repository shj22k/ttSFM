package main.sfm.community.dao;

import java.util.List;

import main.sfm.community.vo.SfmCommunityVO;

public interface SfmCommunityDAO {

	public int sfmCommunityInsert(SfmCommunityVO cvo);
	public List<SfmCommunityVO> sfmCommunitySelectAll(SfmCommunityVO cvo);
	public List<SfmCommunityVO> sfmCommunitySelectCon(SfmCommunityVO cvo);

}
