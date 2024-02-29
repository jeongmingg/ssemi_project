package com.kh.gmail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("works.jhnam@gmail.com", "uvqy pvsc vddj ymkx");
	}

}
