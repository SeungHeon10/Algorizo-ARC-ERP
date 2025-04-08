package co.algorizo.erp.inspection;

import java.util.List;

public interface InspectionDAO {
//	검수 조회
	List<InspectionDTO> list();
//	검수 상세보기
	InspectionDTO detail(int i_id);
//	검수 등록
	void register(InspectionDTO inspectionDTO);
//	검수 수정
	void update(InspectionDTO inspectionDTO);
//	검수 삭제
	void delete(int i_id);
//	검수 코드 생성
	String registerCode(String prefix);
}
