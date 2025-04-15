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

	// 占쏙옙占� 占쏙옙체 占쏙옙회
	@Override
	public List<stockDTO> list() throws Exception {
		// TODO Auto-generated method stub
		List<stockDTO> s = sqlsession.selectList(namespace + ".list");
		System.out.println(s);
		return s;
	}

	// 占쏙옙占� 占쏙옙 占쏙옙占쏙옙
	@Override
	public stockDTO detail(int s_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + ".detail",s_id);
	}

	//占쏙옙占� 占쏙옙占쏙옙
	// 占쏙옙占� 占쏙옙占�
	@Override
	public void register(stockDTO dto) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.insert(namespace + ".register", dto);
	}

	// 占쏙옙占� 占쏙옙占쏙옙
	@Override
	public void update(stockDTO dto) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update(namespace + ".update", dto);
	}

	// 占쏙옙占� 占쏙옙占쏙옙
	@Override
	public int delete(int s_id) throws Exception {
		return sqlsession.delete(namespace + ".delete", s_id);
	}

	@Override
	public List<StockSummaryDTO> summary() throws Exception {
		// TODO Auto-generated method stub
		List<StockSummaryDTO> s = sqlsession.selectList(namespace + ".stocksummary");
		System.out.println("service"+s);
		return s;
	}


}
