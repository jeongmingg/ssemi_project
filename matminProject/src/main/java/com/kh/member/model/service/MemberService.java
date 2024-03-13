package com.kh.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.location.model.vo.Location;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {
	
	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		close(conn);
		
		return m;
	}
	
	public Member kakaoLoginMember(String userId) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().kakaoLoginMember(conn, userId);
		
		close(conn);
		
		return m;
	}
	
	public int idCheck(String checkId) {
		Connection conn = getConnection();
		
		int count = new MemberDao().idCheck(conn, checkId);
		
		close(conn);
		
		return count;
	}
	
	public int nickCheck(String checkNick) {
		Connection conn = getConnection();
		
		int count = new MemberDao().nickCheck(conn, checkNick);
		
		close(conn);
		
		return count;
	}
	
	public int emailCheck(String checkEmail) {
		Connection conn = getConnection();
		
		int count = new MemberDao().emailCheck(conn, checkEmail);
		
		close(conn);
		
		return count;
	}
	
	public Member selectMemberId(String userName, String email) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().selectMemberId(conn, userName, email);
		
		close(conn);
		
		return m;
	}
	
	public int insertMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int insertKakaoMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertKakaoMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int updateMemberAuth(String email) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMemberAuth(conn, email);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public ArrayList<Member> selectMemberList(){
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().selectMemberList(conn);
		
		close(conn);
		return list;
	}
	
	public Member updateMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn, m);
		
		Member updateMem = null;
		if(result > 0) {
			commit(conn);
			
			//갱신된 회원 객체 다시 조회해오기
			updateMem = new MemberDao().selectMember(conn, m.getMemId());
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return updateMem;
	}
	
	public ArrayList<Location> selectLocationList() {
		Connection conn = getConnection();
		
		ArrayList<Location> list = new MemberDao().selectLocationList(conn);
		
		close(conn);
		
		return list;
	}
	
	public int updateMemberPwd(String memNo, String currentPwd, String newPwd) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMemberPwd(conn, memNo, currentPwd, newPwd);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
}
