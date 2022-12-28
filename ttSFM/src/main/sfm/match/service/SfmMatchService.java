package main.sfm.match.service;

import java.util.List;

import main.sfm.match.vo.SfmMatchVO;

public interface SfmMatchService {

	public int sfmMatchInsert(SfmMatchVO mtvo);
	public List<SfmMatchVO> sfmMatchSelectAll(SfmMatchVO mtvo);
	public List<SfmMatchVO> sfmMatchSelect(SfmMatchVO mtvo);
	public int sfmMatchUpdate(SfmMatchVO mtvo);
	public int sfmMatchDelete(SfmMatchVO mtvo);
	
}
