package bit.com.inpho.dto;

import java.io.Serializable;

import lombok.*;

@Getter
@ToString
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HelloDto implements Serializable {
	String email;
}
