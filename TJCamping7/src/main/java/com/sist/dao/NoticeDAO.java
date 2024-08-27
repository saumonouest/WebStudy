package com.sist.dao;

import java.util.*;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.sist.vo.*;

public class NoticeDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	// 목록 
	public static List<NoticeVO> noticeListData(Map map){
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		// Connection => SqlSession
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("noticeListData",map);
		} catch (Exception ex) {
			System.out.println("noticeListData err");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close(); // DBCP => 반환 (재사용)
		}
		return list;
	}
	
	// 공지 추가
	public static void noticeInsert(NoticeVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.insert("noticeInsert",vo);
		} catch (Exception ex) {
			System.out.println("noticeInsert err");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close(); // DBCP => 반환 (재사용)
		}
	}
	
	public static int noticeRowCount() {
		int count=0;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			count=session.selectOne("noticeRowCount");
		} catch (Exception ex) {
			System.out.println("noticeRowCount err");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close(); // DBCP => 반환 (재사용)
		}
		return count;
	}
	
	public static List<NoticeVO> noticeTop5Data(){
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			list=session.selectList("noticeTop5Data");
		} catch (Exception ex) {
			System.out.println("noticeTop5Data err");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close(); // DBCP => 반환 (재사용)
		}
		return list;
	}
	
	//수정 / => 상세보기 : hit증가
	public static NoticeVO noticeUpdateData(int no) {
		NoticeVO vo = new NoticeVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			vo=session.selectOne("noticeUpdateData",no);
		} catch (Exception ex) {
			System.out.println("noticeUpdateData err");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close(); // DBCP => 반환 (재사용)
		}
		return vo;
	}
	
	/*
	 * <update id="noticeUpdate" parameterType="NoticeVO">
		UPDATE notice SET
		type=#{type} , subject=#{subject},content=#{content}
		WHERE no=#{no}
	</update>
	 */
	// 수정하기
	public static void noticeUpdate(NoticeVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.update("noticeUpdate",vo);
		} catch (Exception ex) {
			System.out.println("noticeUpdate err");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close(); // DBCP => 반환 (재사용)
		}
	}
	
	/*
	 * 	<delete id="noticeDelete" parameterType="int">
		DELETE FROM notice
		WHERE no=#{no}
	</delete>
	 */
	// 삭제
	public static void noticeDelete(int no) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.delete("noticeDelete",no);
		} catch (Exception ex) {
			System.out.println("noticeDelete err");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close(); // DBCP => 반환 (재사용)
		}
	}
	/*
	 * 	<update id="noticeHitIncrement" parameterType="int">
		UPDATE notice SET 
		hit = hit+1
		WHERE no=#{no}
	</update>
	 */
	// 조회수 증가
	public static NoticeVO noticeDetailData(int no) {
		NoticeVO vo = new NoticeVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.update("noticeHitIncrement",no);
			session.commit();
			vo=session.selectOne("noticeUpdateData",no);
		} catch (Exception ex) {
			System.out.println("noticeDetailData err");
			ex.printStackTrace();
		} finally {
			if(session!=null) session.close(); // DBCP => 반환 (재사용)
		}
		return vo;
	}
	
}
