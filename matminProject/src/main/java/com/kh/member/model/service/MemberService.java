package com.kh.member.model.service;

import java.sql.Connection;

import static com.kh.common.JDBCTemplate.*;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {
	
	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
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

}
