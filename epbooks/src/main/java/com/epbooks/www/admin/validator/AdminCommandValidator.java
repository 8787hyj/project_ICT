package com.epbooks.www.admin.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.epbooks.www.admin.command.AdminCommand;


public class AdminCommandValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return AdminCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "adminId", "required");
		ValidationUtils.rejectIfEmpty(errors, "adminPassword", "required");
	}
}
