package co.algorizo.erp.outbound;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class outboundDAOlmpl implements outboundDAO {

	private static final String namespace = "co.algorizo.erp.outboundmapper";

	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<outboundDTO> list() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".list");
	}

	@Override
	public List<outboundDTO> detail(int out_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".detail", out_id);
	}

	@Override
	public void register(outboundDTO dto) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.insert(namespace + ".register", dto);
	}

	@Override
	public void update(outboundDTO dto) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update(namespace + ".update", dto);
	}

	@Override
	public int delete(int out_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace + ".delete", out_id);
	}

	/*
	 * @Override public int getStockQuantity(int product_p_id) throws Exception { //
	 * TODO Auto-generated method stub return sqlsession.selectOne(namespace +
	 * ".getStockQuantity", product_p_id); }
	 */
	@Override
	public void updateOutboundStatus(String out_id, String out_status) throws Exception {
		// TODO Auto-generated method stub
		Map<String, String> params = new HashMap<>();
		params.put("out_id", out_id);
		params.put("out_status", out_status);

		sqlsession.update(namespace + ".updateOutboundStatus", params);

	}

	@Override
	public void stockupdate(int s_quantity,int s_id) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("dao i_id" + s_quantity);
		System.out.println("dao s_id" + s_id);
		Map<String,Object> param = new HashMap<>();
		param.put("s_quantity", s_quantity);
		param.put("s_id", s_id);
		sqlsession.update(namespace + ".stockupdate",param);
	}

	@Override
	public int exceed(int product_p_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".exceeds",product_p_id);
	}
}
