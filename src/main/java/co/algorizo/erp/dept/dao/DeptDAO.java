package co.algorizo.erp.dept.dao;

import java.util.List;

import co.algorizo.erp.dept.dto.DeptDTO;

public interface DeptDAO {
	public List<DeptDTO> getDeptList();
	public DeptDTO selectDept(int d_id);
}
