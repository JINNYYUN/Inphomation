package bit.com.inpho.dao.impl;
import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import bit.com.inpho.dao.PostDao;
import bit.com.inpho.dto.MemberDto;
import bit.com.inpho.dto.MyPageCameraDto;
import bit.com.inpho.dto.PostDto;
import bit.com.inpho.dto.PostHashTagInfoDto;
import bit.com.inpho.dto.PostLocationDto;

//addPost
//setHashTagNam
//addHashTagName
//getHashTagName
//getCamera

@Repository
public class PostDaoImpl implements PostDao{
	@Autowired
	SqlSession sqlSession;
	String ns = "postwrite.";
	@Override
	public List<PostDto> getCseq(MemberDto userseq) {
		System.out.println("gogo");
		return sqlSession.selectList(ns+"addcam",userseq);
	}
	@Override
	public List<PostHashTagInfoDto> getHashTag(int postseq, int hashtagseq) {
		
		return sqlSession.selectList(ns+"getHashTagName" , postseq);
		
	}
	@Override
	public List<PostDto>getCamera(MemberDto dto){
		
		return sqlSession.selectList(ns+"getCamera",dto);
		
	}
	@Override
	public void setmap(PostLocationDto map) {
		sqlSession.insert(ns+"setmap",map);
	}
	@Override
	public void setHashTag(int postseq, int hashtagseq) {
		sqlSession.insert(ns+"sethashtag",hashtagseq);
	}
	@Override
	public void addPost(PostDto dto) {
		System.out.println("데이터확인");
		try {
			sqlSession.insert(ns+"insertPost",dto);
	        
	    } catch (Exception e) {
	    	e.printStackTrace();
	    
	    }
	}
	@Override
	public void addhashtag(List<String> tag) {
		sqlSession.insert(ns+"setHashTagName",tag);
		
	}
	@Override
	public int addCamera(PostDto dto) {
		return sqlSession.insert(ns+"addcam",dto);
	}
	@Override
	public void addcam(HashMap<String, String> map) {
		 sqlSession.insert(ns+"setcam",map);
		 
		
	}
	@Override
	public void addCamSeq(HashMap<String, String> map) {
		sqlSession.insert(ns+"setcamseq",map);
	
	
		
	}
	@Override
	public int getcamseq(PostDto dto) {
		return sqlSession.selectOne(ns+"getcamseq",dto);
		
	}
	@Override
	public void setingPost(PostDto dto) {
		sqlSession.insert(ns+"insertPost",dto);
		
	}
	
	
	
	
	
}
