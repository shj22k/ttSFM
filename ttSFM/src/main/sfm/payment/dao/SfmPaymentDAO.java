package main.sfm.payment.dao;

import java.util.List;

import main.sfm.payment.vo.SfmPaymentVO;

public interface SfmPaymentDAO {

	public int sfmPaymentInsert(SfmPaymentVO pvo);
	public List<SfmPaymentVO> sfmPaymentSelect(SfmPaymentVO pvo);
	public List<SfmPaymentVO> sfmPaymentComplete(SfmPaymentVO pvo);


}
