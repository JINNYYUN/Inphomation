package bit.com.inpho.postutile;

import java.util.Date;
import org.springframework.stereotype.Service;

@Service
public class FileUtil {

	public static String getNewFileName(String file) {
		String filename = "";
		String fpost = "";

		if (file.indexOf('.') >= 0) { // 확장자명이 있음
			fpost = file.substring(file.indexOf('.')); // .txt
			filename = new Date().getTime() + fpost; // 43325432243.txt
		} else {
			filename = new Date().getTime() + ".back";
		}

		return filename;
	}

}
