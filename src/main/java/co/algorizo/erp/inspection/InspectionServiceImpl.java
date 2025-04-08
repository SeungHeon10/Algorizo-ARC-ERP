package co.algorizo.erp.inspection;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InspectionServiceImpl implements InspectionService{
	@Autowired
	private InspectionDAO inspectionDAO;

	@Override
	public List<InspectionDTO> list() {
		// TODO Auto-generated method stub
		return inspectionDAO.list();
	}

	@Override
	public InspectionDTO detail(int i_id) {
		// TODO Auto-generated method stub
		return inspectionDAO.detail(i_id);
	}

	@Override
	public void register(InspectionDTO inspectionDTO) {
		// TODO Auto-generated method stub
		inspectionDAO.register(inspectionDTO);
	}

	@Override
	public void update(InspectionDTO inspectionDTO) {
		// TODO Auto-generated method stub
		inspectionDAO.update(inspectionDTO);
	}

	@Override
	public void delete(int i_id) {
		// TODO Auto-generated method stub
		inspectionDAO.delete(i_id);
	}

	@Override
	public String registerCode(String prefix) {
		// TODO Auto-generated method stub
		return inspectionDAO.registerCode(prefix);
	}

}
