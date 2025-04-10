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

	// 재고 전체 조회
	@Override
	public List<stockDTO> list() throws Exception {
		// TODO Auto-generated method stub
		List<stockDTO> s = sqlsession.selectList(namespace + ".list");
		System.out.println(s);
		return s;
	}

	// 재고 상세 정보
	@Override
	public List<stockDTO> detail(int s_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".detail", s_id);
	}

	//재고 수량
	@Override
	public List<StockSummaryDTO> summary() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".stocksummary");
	}

}
