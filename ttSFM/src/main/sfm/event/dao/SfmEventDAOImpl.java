package main.sfm.event.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.sfm.event.vo.SfmEventVO;
import main.sfm.member.vo.SfmMemVO;
import main.sfm.notice.dao.SfmNoticeDAOImpl;

@Repository
public class SfmEventDAOImpl implements SfmEventDAO {

	Logger logger = LogManager.getLogger(SfmEventDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	//이베ㅐㄴ트 아ㅣㅂ력
	@Override
	public int sfmEventInsert(SfmEventVO sevo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.insert("sfmEventInsert", sevo);
	}
	//전체조회
	@Override
	public List<SfmEventVO> sfmEventSelectAll(SfmEventVO sevo) {
		// TODO Auto-generated method stub
		logger.info("DAO-sfmEventSelectAll >>> ");
		return sqlSession.selectList("sfmEventSelectAll", sevo);
	}
	//수정버튼
	@Override
	public List<SfmEventVO> sfmEventUpdate(SfmEventVO sevo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sfmEventUpdate", sevo);
	}
	@Override
	public int sfmEventUpdate2(SfmEventVO sevo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.update("sfmEventUpdate2", sevo);
	}
	@Override
	public List<SfmEventVO> sfmEventSelectCon(SfmEventVO sevo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sfmEventSelectCon", sevo);
	}
	//전체조회 사용자
	@Override
	public List<SfmEventVO> sfmEventSelectAllUser(SfmEventVO sevo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sfmEventSelectAllUser", sevo);
	}
	//조건조회-사용자
	@Override
	public List<SfmEventVO> sfmEventSelectUser(SfmEventVO sevo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sfmEventSelectUser", sevo);
	}
	@Override
	public int sfmEventDelete(SfmEventVO sevo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.delete("sfmEventDelete", sevo);
	}
	
}
