package membership;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class MemberDTO { //빈클래스를 이용
	private String id;
	private String pass;
	private String name;
	private String regidate;
}
