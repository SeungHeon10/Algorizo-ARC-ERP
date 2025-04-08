package co.algorizo.erp.outbound;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class outboundDAOlmpl implements outboundDAO{
	
	private static final String namespace="co.algorizo.erp.outboundmapper";
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<outboundDTO> list() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace+".list");
	}

	@Override
	public List<outboundDTO> detail(int out_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".detail",out_id);
	}

	@Override
	public void register(outboundDTO dto) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.insert(namespace + ".register",dto);
	}

	@Override
	public void update(outboundDTO dto) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update(namespace + ".update",dto);
	}

	@Override
	public int delete(int out_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace + ".delete",out_id);
	}
}
