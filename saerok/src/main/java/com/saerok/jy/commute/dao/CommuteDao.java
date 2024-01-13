package com.saerok.jy.commute.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;

import com.saerok.jy.commute.dto.Commute;


public interface CommuteDao {

   
ArrayList<Commute> selectCommuteList(SqlSession session, Commute commute);

int insertCommute(SqlSession sessoin, Map empNo);

Commute selectCommute(SqlSession session, String empNo);

int updateCommute(SqlSession session, int commuteNo);

int insertCommuteStatus(SqlSession session, Map status);

int updateCommuteEndTime(SqlSession session, Map status);

public ArrayList<Commute> selectCommuteStatusList(SqlSession session,int commuteNo);

}