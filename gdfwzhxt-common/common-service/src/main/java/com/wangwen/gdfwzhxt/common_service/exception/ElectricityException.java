package com.wangwen.gdfwzhxt.common_service.exception;

import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import lombok.Data;

//自定义异常
@Data
public class ElectricityException extends RuntimeException{
    private Integer code;
    private String message;
    private ResultCodeEnum resultCodeEnum;

    public ElectricityException (ResultCodeEnum resultCodeEnum){
        this.resultCodeEnum = resultCodeEnum;
        this.code = resultCodeEnum.getCode();
        this.message = resultCodeEnum.getMessage();
    }
}
