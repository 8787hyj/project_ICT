package com.epbooks.www.common.exception.common;

import com.epbooks.www.common.error.ErrorCode;
import com.epbooks.www.common.exception.common.BusinessException;

public class FailDeleteException extends BusinessException {

	public FailDeleteException() {
		super(ErrorCode.FAIL_DELETE_INFORMATION);
	}
	
}
