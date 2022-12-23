package main.sfm.common;

import java.io.File;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class FileRename implements FileRenamePolicy {
	Logger logger = LogManager.getLogger(FileRenamePolicy.class);
	
	public FileRename() {
		
	}
	
	@Override
	public File rename(File sf) {
		logger.info("rename 함수 시작---");
		String f = sf.getName();
		System.out.println("fileName >>> : " + f);
		
		try {
			String s = f;
			// 파일이 존재할경우 1씩 증가하는 함수
			for(int i=1; sf.exists(); i++) {
				int lt=3;
				String s1 = s.substring(0, lt);
				String s2 = s.substring(lt);
				String st = "_" + i;
				f = s1.concat(st).concat(s2);
				sf = new File(sf.getParent(), f);
				logger.info("sf >>> : " + sf);
			}
			
		}catch(Exception e) {
			System.out.println("FileRename.reName() >>> : " + e.getMessage());
		}
		
		return sf;
	}
	
	public static void main(String[] args) {
		File f = new File("C:\\msdia80.dll");
		File ss = new FileRename().rename(f);
		System.out.println("ss >>> : " + ss.getName());
	}
}
