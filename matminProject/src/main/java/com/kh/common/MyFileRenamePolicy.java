package com.kh.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{
		
	// 원본파일명을 전달받아 수정 후 수정명이 된 파일을 반환해주는 메소드
	public File rename(File originFile) {
		
		// 파일 원본명
		String originName = originFile.getName();
		
		// 파일 수정명을 위한 파일 업로드시간
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 파일 수정명 시간뒤 랜덤번호 (10000~99999)
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		// 원폰파일확장자
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		// 파일 수정명 변수 만들기
		String changeName = currentTime + ranNum + ext;
		
		return new File(originFile.getParent(), changeName);
		
	}
}
