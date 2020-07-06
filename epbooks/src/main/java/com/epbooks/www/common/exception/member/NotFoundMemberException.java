package com.epbooks.www.common.exception.member;

import com.epbooks.www.common.error.ErrorCode;
import com.epbooks.www.common.exception.common.BusinessException;

public class NotFoundMemberException extends BusinessException {
	public NotFoundMemberException() {
		super(ErrorCode.ENTITY_NOT_FOUND);
	}
}
