package com.epbooks.www.common.exception.common;

import com.epbooks.www.common.error.ErrorCode;
import com.epbooks.www.common.exception.common.BusinessException;

public class EntityNotFoundException extends BusinessException{

	 public EntityNotFoundException() {
	        super(ErrorCode.ENTITY_NOT_FOUND);
	}

}
