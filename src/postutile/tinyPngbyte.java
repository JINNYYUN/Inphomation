package postutile;

import java.io.IOException;

import com.tinify.Options;
import com.tinify.Source;
import com.tinify.Tinify;

public class tinyPngbyte {
	static Source source;
// 티니 API 구글  클라우드 api  메타/압축/업로드 메서드 
	public void tinyUpload(String fromImagePath,String uploadImagePath){	
		Tinify.setKey("");// 티니PNG private api key 

		try {
			System.out.println("key scsses");
			source = Tinify.fromFile(fromImagePath); //업로드 하려는 파일 경로
			Source copyrighted = source.preserve("copyright","creation"); //메타데이터 보존
			
			Options options = new Options()
					.with("service", "gcs")// 사용하는 플렛폼 과 엑세스 토큰을 기입하고 실질 업로드 되는 경로를 작성한다.
					.with("gcp_access_token","")
					.with("path","boomkit/"+uploadImagePath);
			copyrighted.store(options);// 클라우드에 저장한다.
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("클리어");
		
		
		
		

	}
}
