package util;

import java.math.BigInteger;
import java.security.MessageDigest;

public class MemberUtil {
	
	public static String getSHA512(String input){ // 비밀번호 암호화
		String toReturn = null;
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-512");
			digest.reset();
			digest.update(input.getBytes("utf8"));
			toReturn = String.format("%064x", new BigInteger(1, digest.digest()));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return toReturn;
	}

}
