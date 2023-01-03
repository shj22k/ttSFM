package main.sfm.community.service;

import java.util.List;

import main.sfm.community.vo.SfmCommunityVO;

public interface SfmCommunityService {

	public int sfmCommunityInsert(SfmCommunityVO cvo);
	public List<SfmCommunityVO> sfmCommunitySelectAll(SfmCommunityVO cvo);
	public List<SfmCommunityVO> sfmCommunitySelectCon(SfmCommunityVO cvo);
	public int sfmCommunityUpdate(SfmCommunityVO cvo);

}
