package kr.co.choongang.command;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


//httpsession
public class LoginCommandVaildator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		
		return LoginCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userid", "required");
		ValidationUtils.rejectIfEmpty(errors, "userpw", "required");
	}

}
