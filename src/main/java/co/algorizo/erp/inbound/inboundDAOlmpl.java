package co.algorizo.erp.inbound;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class inboundDAOlmpl implements inboundDAO{

	
	@Autowired
	private SqlSession sqlsession;
	private static final String namespace = "co.algorizo.erp.inboundmapper";
	private static final String name = "co.algorizo.erp";
	
	@Override
	public List<inboundDTO> list() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".list");
	}

	@Override
	public List<inboundDTO> detail(int in_id) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(in_id);
		List<inboundDTO> S = sqlsession.selectList(namespace + ".detail",in_id); 
		System.out.println("dao"+S); 
		return S;
	}
	
	@Override
	public void register(inboundDTO dto) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.insert(namespace + ".register",dto);
		sqlsession.selectList(name+".productMapper.productlist",dto);
		sqlsession.selectList(name+".memberMapper.memberList",dto);
		sqlsession.selectList(name+".companyMapper.companylist",dto);
		
	}
	
	@Override
	public void update(inboundDTO dto) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update(namespace + ".update",dto);
	}

	@Override
	public int delete(int in_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace + ".delete",in_id);
	}

}
