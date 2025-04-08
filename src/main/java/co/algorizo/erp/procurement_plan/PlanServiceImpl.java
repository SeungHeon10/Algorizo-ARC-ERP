package co.algorizo.erp.procurement_plan;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.algorizo.erp.procurement_plan.DTO.PlanDTO;
import co.algorizo.erp.procurement_plan.DTO.PlanDetailDTO;
import co.algorizo.erp.procurement_plan.DTO.PlanProductDTO;

@Service
public class PlanServiceImpl implements PlanService {
	
	@Autowired
	private PlanDAO planDAO;
//	조달 계획 조회
	@Override
	public List<PlanDTO> list() {
		// TODO Auto-generated method stub
		return planDAO.list();
	}
//	조달 계획 상세보기
	@Override
	public List<PlanDetailDTO> detail(int plan_id) {
		// TODO Auto-generated method stub
		return planDAO.detail(plan_id);
	}
//	조달 계획 등록
	@Override
	public void plan_Register(PlanDTO planDTO) {
		// TODO Auto-generated method stub
		planDAO.plan_Register(planDTO);
		
	}
//	조달 계획 품목 등록
	@Override
	public void product_Register(PlanProductDTO planProductDTO) {
		// TODO Auto-generated method stub
		planDAO.product_Register(planProductDTO);
		
	}
//	조달 계획 수정
	@Override
	public void update(PlanDTO planDTO) {
		// TODO Auto-generated method stub
		planDAO.update(planDTO);
		
	}
//	조달 계획 삭제
	@Override
	public void plan_Delete(int plan_id) {
		// TODO Auto-generated method stub
		planDAO.plan_Delete(plan_id);
		
	}
	@Override
	public void product_Delete(int plan_id) {
		// TODO Auto-generated method stub
		planDAO.product_Delete(plan_id);
	}
//	코드 가져오기
	@Override
	public String registerCode(String prefix) {
		// TODO Auto-generated method stub
		return planDAO.registerCode(prefix);
	}
//	품목 리스트
	@Override
	public List<PlanDetailDTO> product_list() {
		// TODO Auto-generated method stub
		return planDAO.product_list();
	}
}
