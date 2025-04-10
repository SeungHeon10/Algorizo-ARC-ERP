package co.algorizo.erp.stock;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class stockDAOlmpl implements stockDAO {

	@Autowired
	private SqlSession sqlsession;
	private static final String namespace = "co.algorizo.erp.stockmapper";

	// ��� ��ü ��ȸ
	@Override
	public List<stockDTO> list() throws Exception {
		// TODO Auto-generated method stub
		List<stockDTO> s = sqlsession.selectList(namespace + ".list");
		System.out.println(s);
		return s;
	}

	// ��� �� ����
	@Override
	public List<stockDTO> detail(int s_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".detail", s_id);
	}

	//��� ����
	@Override
	public List<StockSummaryDTO> summary() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".stocksummary");
	}

}
