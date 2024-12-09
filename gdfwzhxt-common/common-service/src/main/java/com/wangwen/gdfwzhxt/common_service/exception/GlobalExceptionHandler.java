package com.wangwen.gdfwzhxt.common_service.exception;

import com.wangwen.gdfwzhxt.model.vo.common.Result;
import com.wangwen.gdfwzhxt.model.vo.common.ResultCodeEnum;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class GlobalExceptionHandler {
    //全局异常处理
    @ExceptionHandler(Exception.class)
    @ResponseBody
    public Result error(){
        return Result.build(null, ResultCodeEnum.SYSTEM_ERROR);
    }

    //出现 MethodArgumentNotValidException 错误时调用这个方法
//    @ExceptionHandler(value = MethodArgumentNotValidException.class)
//    @ResponseBody
//    public Result validExceptionHandler(MethodArgumentNotValidException e){
//        return Result.build(null, 500, e.getBindingResult().getAllErrors().get(0).getDefaultMessage());
//    }

    //自定义异常
    @ExceptionHandler(ElectricityException.class)
    @ResponseBody
    public Result error(ElectricityException e){
        return Result.build(null, e.getResultCodeEnum());
    }
}
