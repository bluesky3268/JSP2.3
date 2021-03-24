package util;

import java.text.DecimalFormat;
// EL에서 호출할 메서드
public class FormatUtil {
	// 정수 1100을 1,100과 같은 형식으로 변환하는 기능
	public static String number(long number, String pattern) {
		DecimalFormat format = new DecimalFormat(pattern);
		return format.format(number);
	}
}
