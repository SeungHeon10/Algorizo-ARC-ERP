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

	// 재고 등록
	@Override
	public void register(stockDTO dto) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.insert(namespace + ".register", dto);
	}

	// 재고 수정
	@Override
	public void update(stockDTO dto) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update(namespace + ".update", dto);
	}

	// 재고 삭제
	@Override
	public int delete(int s_id) throws Exception {
		return sqlsession.delete(namespace + ".delete", s_id);
	}

	@Override
	public List<StockSummaryDTO> summary() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".stocksummary");
	}

}
