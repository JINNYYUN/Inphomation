package bit.com.inpho.postutile;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;
import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.ImageSource;
import com.google.protobuf.ByteString;

@Service
public class GoogleVisionApi {
	
	List<String> hashTaglist=new ArrayList<>();
	public List<String> detectLabels(String filePath) throws Exception {

		List<AnnotateImageRequest> requests = new ArrayList<>();

		Image image = getImage(filePath);

		Feature feature = Feature.newBuilder().setType(Feature.Type.LABEL_DETECTION).build();
		AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feature).setImage(image).build();
		requests.add(request);

		try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = response.getResponsesList();

			for (AnnotateImageResponse res : responses) {
				if (res.hasError()) {
					System.out.println("Error: " + res.getError().getMessage());
					
				}

				
				for (EntityAnnotation annotation : res.getLabelAnnotationsList()) {
					annotation.getAllFields().forEach((k, v) -> System.out.println(k + " : " + v.toString()));
					hashTaglist.add(annotation.getDescription());
					String[] hashTag = new String[hashTaglist.size()];
					hashTag=hashTaglist.toArray(hashTag);
					// 해쉬태그리스트를 출력합니다.
					for (String s : hashTag) {
						System.out.println("해쉬태그 정보들 : " +s);
					}
				}
			}
		}
			
		
		return hashTaglist;
	}

	private static Image getImage(String filePath) throws IOException {
		Image image;

		if (filePath.startsWith("gs://")) { // GCS에서 이미지를 가져올때 image 생성
			ImageSource imgSource = ImageSource.newBuilder().setGcsImageUri(filePath).build();
			image = Image.newBuilder().setSource(imgSource).build();
		} else { // 로컬에서 이미지를 가져올때 image 생성
			ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));
			image = Image.newBuilder().setContent(imgBytes).build();
		}

		return image;
	}


	}