import 'package:flutter/material.dart';
import 'package:flutter_study3/models/user_info.dart';

///创建数据model
///这里的model实际上就是我们的状态，它不仅存储了我们的数据模型，而且还包含了更改数据的方法
///并暴露出想要暴露出的数据
class UserModel with ChangeNotifier {
  User_info _userInfo = null;
  bool _isLogin = false;
  bool get isLogin => _isLogin;
  User_info get userInfo => _userInfo;
  void changeUserInfo(User_info info) {
    _isLogin = info == null ? false : info.token == null ? false : true;
    _userInfo = info;
    notifyListeners(); //通知所有的观察者去刷新
  }
}
