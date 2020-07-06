package com.epbooks.www.common.exception.member;

import com.epbooks.www.common.error.ErrorCode;
import com.epbooks.www.common.exception.common.BusinessException;

public class WrongIdPasswordException extends BusinessException {

	public WrongIdPasswordException() {
		super(ErrorCode.INVALID_INPUT_VALUE);
	}
	
}
