package main.sfm.payment.service;

import java.util.List;

import main.sfm.payment.vo.SfmPaymentVO;

public interface SfmPaymentService {

	public int sfmPaymentInsert(SfmPaymentVO pvo);
	public List<SfmPaymentVO> sfmPaymentSelect(SfmPaymentVO pvo);
	public List<SfmPaymentVO> sfmPaymentComplete(SfmPaymentVO pvo);

}
