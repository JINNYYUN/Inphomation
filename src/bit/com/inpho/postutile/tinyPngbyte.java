package bit.com.inpho.postutile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;

//import javax.xml.bind.DatatypeConverter;

import org.springframework.stereotype.Service;

import com.tinify.Options;
import com.tinify.Source;
import com.tinify.Tinify;
@Service
public class tinyPngbyte {
	static Source source;
// 티니 API 구글  클라우드 api  메타/압축/업로드 메서드 
	public void tinyUpload(String beforeImagePath,String afterFileName){	
		Tinify.setKey("QgD5BSLRkhWgS6d03MpZcvVRwWdRd48g");// 티니PNG private api key 
			StringBuffer origin = new StringBuffer(beforeImagePath);
			origin.insert(10,"/");
			System.out.println(origin);
			
		System.out.println("key scsses");
		source = Tinify.fromUrl(beforeImagePath); //업로드 하려는 파일 경로
		Source copyrighted = source.preserve("copyright","creation"); //메타데이터 보존
		
		Options options = new Options()
				.with("service", "gcs")// 사용하는 플렛폼 과 엑세스 토큰을 기입하고 실질 업로드 되는 경로를 작성한다.
				.with("gcp_access_token","4/5AF-HeT0XzvxXtFvuLRBYp15eTb9WVUtMdU3TxTQuwK8kEykMlRFgryPXwzjupR7MjI_bdTcQr4pzOTa_c47fI4")
				.with("path","boomkit/"+afterFileName);
		copyrighted.store(options);// 클라우드에 저장한다.
		System.out.println("클리어");

	}
	public static String getNewFileName(String file) {
		String filename = "";
		String fpost = "";
		
		if(file.indexOf('.') >= 0) {	// 확장자명이 있음
			fpost = file.substring( file.indexOf('.') );	// .txt
			filename = new Date().getTime() + fpost;	// 43325432243.txt
		}
		else {
			filename = new Date().getTime() + ".back";
		}
		
		return filename;
	}
	public void getBaseDecode(String images) {
	 String base64String = images;
     String[] strings = base64String.split(",");
     String extension;
     switch (strings[0]) {//check image's extension
         case "data:image/jpeg;base64":
             extension = "jpeg";
             break;
         case "data:image/png;base64":
             extension = "png";
             break;
         default://should write cases for more images types
             extension = "jpg";
             break;
     }
     //convert base64 string to binary data
//     byte[] data = DatatypeConverter.parseBase64Binary(strings[1]);
     
//     String blobString = new String(data);
//     System.out.println(blobString);
     
     
     
 }
	
	
	
}
