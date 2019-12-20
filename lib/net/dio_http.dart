import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_study3/models/index.dart';

class HttpManager {
  static HttpManager _instance;

  static HttpManager getInstance() {
    if (_instance == null) {
      _instance = HttpManager();
    }
    return _instance;
  }

  Dio dio = Dio();

  HttpManager() {
//    dio.options.headers = {
//      "version": "1.0.0",
//      "Autiorization": "_token",
//    };
    dio.options.baseUrl = "http://app.interface.caiduoduo.com/App.php";
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 10000;
    dio.interceptors.add(LogInterceptor(request: true, responseBody: true));
  }

  get(String url, Map<String, dynamic> params, Function successCallBack,
      Function errorCallBack) async {
    _requestHttp(url, successCallBack, 'get', params, errorCallBack);
  }

  post(String url, Map<String, dynamic> params, Function suceessCallBack,
      Function errorCallBack) async {
    _requestHttp(url, suceessCallBack, "post", params, errorCallBack);
  }

  _requestHttp(String url, Function suceessCallBack,
      [String method, Map<String, dynamic> params, Function errorCallBack]) async {
    Response response;
    Map<String, dynamic> map = {
      "time": DateTime.now().millisecondsSinceEpoch ~/ 1000,
      "channel_id": "100005",
      "version_name": "1.0.1",
    };
    if (params != null && params.isNotEmpty) {
      params.addAll(map);
    }
    String sign = sortMap(params);
    print("sign == " + sign);
    params.putIfAbsent("sign", () => sign);
    print("params == ${params.toString()}");

    try {
      if (method == 'get') {
        if (params != null && params.isNotEmpty) {
          response = await dio.get(url, queryParameters: params);
        } else {
          response = await dio.get(url);
        }
      } else if (method == "post") {
        if (params != null && params.isNotEmpty) {
          response = await dio.post(url, data: params);
        } else {
          response = await dio.post(url);
        }
      }
    } on DioError catch (error) {
      //请求错误的处理
      if (error.response != null) {
        response = error.response;
      } else {
        response = new Response(statusCode: 999);
      }
      //请求超时
      if (error.type == DioErrorType.CONNECT_TIMEOUT) {
        response.statusCode = ResultCode.CONNECT_TIMEOUT;
      }
      //服务器错误
      if (error.type == DioErrorType.RECEIVE_TIMEOUT) {
        response.statusCode = ResultCode.SERVICE_ERROR;
      }
      _error(errorCallBack, error.message);
    }

//    String dataStr = json.encode(response.data);
//    print("data == " + dataStr);
    final res = json.decode(response.data);
//    print("decode == " + Base_response.fromJson(res).errMsg);
    Base_response base_response = Base_response.fromJson(res);
//    print("base_response == $base_response");

//    Map<String, dynamic> dataMap = json.decode(response.data);
    if (base_response == null || base_response.errCode != 0) {
      _error(errorCallBack, "错误码：" + base_response.errMsg.toString());
    } else if (suceessCallBack != null) {
      suceessCallBack(base_response);
    }
  }

  _error(Function errorCallBack, String message) {
    if (errorCallBack != null) {
      errorCallBack(message);
    }
  }

  String sortMap(Map<String, dynamic> params) {
    if (params != null && params.isNotEmpty) {
      List<String> keys = params.keys.toList();
      keys.sort();
      String res = "";
      for (String key in keys) {
        res = res + key + "=" + Uri.encodeComponent(params[key].toString());
      }
      res += "123456789";
      print("sign str = $res");
      return md5.convert(utf8.encode(res)).toString();
    }
    return "";
  }
}

class ResultCode {
  static const CONNECT_TIMEOUT = 1001;
  static const SERVICE_ERROR = 1002;
  static const SUCCESS = 200;
  static const ERROR = 999;
}
