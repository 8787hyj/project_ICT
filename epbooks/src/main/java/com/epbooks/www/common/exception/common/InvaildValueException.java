package com.epbooks.www.common.exception.common;

import com.epbooks.www.common.error.ErrorCode;
import com.epbooks.www.common.exception.common.BusinessException;

public class InvaildValueException extends BusinessException{
	
	  public InvaildValueException(String message, ErrorCode errorCode) {
		super(message, errorCode);
	}

	public InvaildValueException() {
		super(ErrorCode.INVALID_INPUT_VALUE);
	}  
	  
		   
}
