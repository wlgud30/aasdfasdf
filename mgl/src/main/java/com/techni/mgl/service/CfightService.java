package com.techni.mgl.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techni.mgl.dao.CfightDAO;
import com.techni.mgl.domain.CfightVO;

@Service
public class CfightService {
	@Autowired
	public CfightDAO cfDAO;
	
	@Transactional
	public List<CfightVO> cFightList(String c_idx){
		return cfDAO.cFightList(c_idx);
	}
	@Transactional
	public CfightVO selectCidx(String c_nm){
		return cfDAO.selectCidx(c_nm);
	}
	@Transactional
	public int cFightYnInsert(Map<String,String> map){
		int res = 0;
		if(cfDAO.cFightYnInsert(map)>0&&cfDAO.cFightYnSeq()>0){
			res = 1;
		}
		return res;
	}
	@Transactional
	public int cFightInsert(Map<String,String> map,Map<String,String> map2,String[] c_idx,String[] no,String[] kind,String[] type){
		
		int res = 0;
		int r = 0;
		int e = 0;
		int e1 = 0;
		int s = 0;
		int s1 = 0;
		if(cfDAO.cFightInsert(map)>0 && cfDAO.cFightSeq()>0){
			r = 1;
		}
		map2.put("cf_idx", map.get("cf_idx"));
		for(int i = 0;i<c_idx.length;i++){
			map2.remove("c_idx");
			map2.put("c_idx",c_idx[i]);
			map2.put("yn", null);
			e = e+ cfDAO.cFightYnInsert(map2);
			e1 = e1+ cfDAO.cFightYnSeq();
		}
		for(int j = 0 ;j<no.length;j++ ){
			map2.remove("cf_t_nm");
			map2.remove("cf_t_kind");
			map2.remove("cf_t_num");
			map2.put("cf_t_nm",type[j]);
			map2.put("cf_t_kind",kind[j]);
			map2.put("cf_t_num",no[j]);
			s =s+ cfDAO.cFightTypeInsert(map2);
			s1 =s1+ cfDAO.cFightTypeSeq();
		}
		if(r==1&&e==(c_idx.length)&&s==(no.length)&&e1==(c_idx.length)&&s1==(no.length)){
			res = 1;
		}
		
		return res;
	}
	//대항전내용과 참여클럽 리스트
	@Transactional
	public List<CfightVO> cFightJoinClub(String cf_idx){
		return cfDAO.cFightJoinClub(cf_idx);
	}
	//주최클럽과 종목 리스트
	@Transactional
	public List<CfightVO> cFightTypeList(Map<String,String> map){
		return cfDAO.cFightTypeList(map);
	}
	//참석 불참 여부 업데이트
	@Transactional
	public int ynChk(Map<String,String> map){
		return cfDAO.ynChk(map);
	}
	//참석하지않은 유저 리스트
	@Transactional
	public List<CfightVO> cFightUserList(Map<String,String> map){
		return cfDAO.cFightUserList(map);
	}
	//참석한 유저 리스트
	@Transactional
	public List<CfightVO> cFightJoinUserList(Map<String,String> map){
		return cfDAO.cFightJoinUserList(map);
	}
	//참석
	@Transactional
	public int cFightUserInsert(Map<String,Object> map){
		return cfDAO.cFightUserInsert(map);
	}
	//참석취소
	@Transactional
	public int cFightUserDelete(Map<String,Object> map){
		return cfDAO.cFightUserDelete(map);
	}
	//팀 생성 유저 리스트
	@Transactional
	public List<CfightVO> teamUser(Map<String,String> map){
		return cfDAO.teamUser(map);
	}
	//종목별 팀 리스트
	@Transactional
	public List<CfightVO> typeTeam(Map<String,String> map){
		return cfDAO.typeTeam(map);
	}
	//팀 생성
	@Transactional
	public int teamInsert(Map<String,String> map){
		
		int res = 0;
		cfDAO.cFightTeamSeq();
		if(cfDAO.cFightTeamSeq() > 0 && cfDAO.teamInsert(map) > 0){
			res = 1;
		}
		return res;
	}
	//팀 삭제
	@Transactional
	public int teamDelete(String cf_team_idx){
		return cfDAO.teamDeleta(cf_team_idx);
		
	}
	//팀 리스트
	@Transactional
	public List<CfightVO> teamList(Map<String,String> map){
		return cfDAO.teamList(map);
	}
	//팀 유저 체크
	@Transactional
	public List<CfightVO> teamUserChk(Map<String,Object> map){
		return cfDAO.teamUserChk(map);
	}
	//그룹 설정화면
	@Transactional
	public List<CfightVO> typeList(String cf_idx){
		return cfDAO.typeList(cf_idx);
	}
	//팀리스트 클럽별로 번갈아 출력
	@Transactional
	public List<CfightVO> clubTeamList(Map<String,String> map){
		return cfDAO.clubTeamList(map);
	}
	//대항전에 참여한 클럽 인덱스 리스트
	@Transactional
	public List<CfightVO> clubList(String cf_idx){
		return cfDAO.clubList(cf_idx);
	}
	//그룹을 인서트하고 팀에 그룹인덱스를 업데이트한다
	@Transactional
	public int teamGroupUpdate(Map<String,Object> map,Map<String,Object> map2){
		int res = 0;
		
		if(cfDAO.groupInsert(map)>0&&cfDAO.teamGroupUpdate(map2)>0){
			res=1;
		}
		
		return res;
	}
	//그룹인ㄷ게스
	@Transactional
	public List<CfightVO> groupIdx(String cf_idx){
		return cfDAO.groupIdx(cf_idx);
	}
	//그룹올
	@Transactional
	public List<CfightVO> groupAll(Map<String,String> map){
		return cfDAO.groupAll(map);
	}
	//시작시간 코트수 
	@Transactional
	public CfightVO gameDetail(String cf_idx){
		return cfDAO.gameDetail(cf_idx);
	}
	//대진표 인서트
	@Transactional
	public int gameInsert(Map<String,Object>map,Map<String,Object> map2){
		
		int res = cfDAO.gameInsert(map);
		int res2 = 0;
		int res3 = 0;
		if(res >0){
			res2  = cfDAO.matchListYN((String)map.get("cf_idx"));
		}
		if(res2 >0){
			res3=cfDAO.endGameInsert(map2);
		}
		return res3;
	}
	//나의 대진표
	@Transactional
	public List<CfightVO> myMatchList(Map<String,String> map){
		return cfDAO.myMatchList(map);
	}
	//시간 리스트
	@Transactional
	public List<CfightVO> timeMatchList(String cf_idx){
		return cfDAO.timeMatchList(cf_idx);
	}
	//코트 리스트
	@Transactional
	public List<CfightVO> courtMatchList(String cf_idx){
		return cfDAO.courtMatchList(cf_idx);
	}
	//시간,코트별 대진표 리스트
	@Transactional
	public List<CfightVO> matchList(Map<String,String> map){
		return cfDAO.matchList(map);
	}
	//종목 리스트
	@Transactional
	public List<CfightVO> typeMatchList(String cf_idx){
		return cfDAO.typeMatchList(cf_idx);
	}
	//종목 디테일
	@Transactional
	public List<CfightVO> typeMatchDetail(String cf_g_idx){
		return cfDAO.typeMatchDetail(cf_g_idx);
	}
	//참가자보기(종목리스트)
	@Transactional
	public List<CfightVO> entryTypeList(String cf_idx){
		return cfDAO.entryTypeList(cf_idx);
	}
	//참가자보기(종목리스트)
	@Transactional
	public List<CfightVO> entryTypeDetail(String cf_idx){
		return cfDAO.entryTypeDetail(cf_idx);
	}
	//참가자보기(종목리스트)
	@Transactional
	public List<CfightVO> entryClubList(String cf_idx){
		return cfDAO.entryClubList(cf_idx);
	}
	//참가자보기(종목리스트)
	@Transactional
	public List<CfightVO> entryClubDetail(String cf_idx){
		return cfDAO.entryClubDetail(cf_idx);
	}
	//일정
	@Transactional
	public List<CfightVO> typeDetailList(Map<String,String> map){
		return cfDAO.typeDetailList(map);
	}
	//종목 디테일(랭킹)
	@Transactional
	public List<CfightVO> typeDetailRank(Map<String,String> map){
		return cfDAO.typeDetailRank(map);
	}
	//코트수
	@Transactional
	public int courtCount(String cf_idx){
		return cfDAO.courtCount(cf_idx);
	}
	//심판화면
	@Transactional
	public List<CfightVO> referee(Map<String,String> map){
		return cfDAO.referee(map);
	}
	//나의순위
	@Transactional
	public List<CfightVO> myRank(Map<String,String> map){
		return cfDAO.myRank(map);
	}
	//내종목리스트
	@Transactional
	public List<CfightVO> myTypeList(Map<String,String> map){
		return cfDAO.myTypeList(map);
	}
	//대항전 종목 리스트
	@Transactional
	public List<CfightVO> cfTypeList(String cf_idx){
		return cfDAO.cfTypeList(cf_idx);
	}
	//대항전 종목 순위
	@Transactional
	public List<CfightVO> cfTypeRank(String cf_idx){
		return cfDAO.cfTypeRank(cf_idx);
	}
	//점수 입력을위한 유저정보
	@Transactional
	public List<CfightVO> pointUser(Map<String,String> map){
		return cfDAO.pointUser(map);
	}
	//점수업데이트
	@Transactional
	public int pointUpdate(Map<String,Object>map, String cf_gidx){
		int res = cfDAO.pointUpdate(map);
		int res2 = 0;
		if(res>0){
			res2 = cfDAO.endUpdate(cf_gidx);
		}
		return res2;
	}
	//클럽별랭킹
	@Transactional
	public List<CfightVO> clubRank(String cf_idx){
		return cfDAO.clubRank(cf_idx);
	}
	//push
	@Transactional
	public List<CfightVO> push(Map<String,String> map){
		return cfDAO.push(map);
	}
	//allmatch
	@Transactional
	public List<CfightVO> all_court(String cf_idx){
		return cfDAO.all_court(cf_idx);
	}
	@Transactional
	public List<CfightVO> all_dat(String cf_idx){
		return cfDAO.all_dat(cf_idx);
	}
	@Transactional
	public List<CfightVO> all_match(String cf_idx){
		return cfDAO.all_match(cf_idx);
	}
	//대항전 이름
	@Transactional
	public List<CfightVO> cf_nm(String cf_idx){
		return cfDAO.cf_nm(cf_idx);
	}
}
