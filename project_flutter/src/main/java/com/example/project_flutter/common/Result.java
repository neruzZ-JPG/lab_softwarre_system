package com.example.project_flutter.common;

import lombok.Data;

/**
 * @author 西云研究所
 * @date 2021/10/20
 */
@Data
public class Result<T> {
    //是否成功
    private Boolean success;
    //状态码
    private Integer code;
    //提示信息
    private String msg;
    //数据
    private T data;

    public Result() {

    }

    //自定义返回结果的构造方法
    public Result(Boolean success, Integer code, String msg, T data) {
        this.success = success;
        this.code = code;
        this.msg = msg;
        this.data = data;
    }
}
