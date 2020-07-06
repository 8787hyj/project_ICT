package com.epbooks.www.common.exception.member;

import com.epbooks.www.common.error.ErrorCode;
import com.epbooks.www.common.exception.common.BusinessException;

public class WrongEamilNameException extends BusinessException {

	public WrongEamilNameException() {
		super(ErrorCode.INVALID_INPUT_VALUE);
	}

}
