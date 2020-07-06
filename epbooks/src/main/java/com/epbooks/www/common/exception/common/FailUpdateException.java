package com.epbooks.www.common.exception.common;

import com.epbooks.www.common.error.ErrorCode;
import com.epbooks.www.common.exception.common.BusinessException;

public class FailUpdateException  extends BusinessException{
	
	public FailUpdateException() {
		super(ErrorCode.FAIL_UPDATE_INFORMATION);
	}
}
