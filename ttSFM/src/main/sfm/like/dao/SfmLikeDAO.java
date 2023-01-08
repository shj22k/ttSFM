package main.sfm.like.dao;

import java.util.List;

import main.sfm.like.vo.SfmLikeVO;

public interface SfmLikeDAO {
	
	public List<SfmLikeVO> sfmLikeSelect(SfmLikeVO slvo);
	public List<SfmLikeVO> sfmLikeSelectAll(SfmLikeVO slvo);
	
	public int sfmLikeInsert(SfmLikeVO slvo);
	
	public int sfmLikeUpdate_1(SfmLikeVO slvo);
	public int sfmLikeUpdate_2(SfmLikeVO slvo);

}
