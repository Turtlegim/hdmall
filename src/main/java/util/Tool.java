package util;

/*배지현 : 콤보 입력값 null 변환 함수*/
public abstract class Tool {
	public static String checknull(String value) {
		if(value == null) {
			value = "";
		}else {
			return value;
		}
		return value;
	}
}