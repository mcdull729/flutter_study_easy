import 'package:flutter/material.dart';
import 'package:flutter_study3/common/ui_widget_utils.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _nameCtrl = TextEditingController();
  var _pwdCtrl = TextEditingController();
  bool _showPwd = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            pd(
                ClipOval(
                  child: Image.asset(
                    "assets/imgs/avatar.png",
                    width: 150,
                  ),
                ),
                l: 50,
                t: 50,
                r: 50,
                b: 20),
            pdlr(
                TextField(
                  controller: _nameCtrl,
                  style: hintTips,
                  decoration: InputDecoration(
                    hintText: "phone or email",
                    labelText: "username",
                    prefixIcon: Icon(Icons.phone_android),
                  ),
                ),
                ver: 10,
                hor: 30),
            pdlr(
                TextField(
                  controller: _pwdCtrl,
                  style: hintTips,
                  decoration: InputDecoration(
                      hintText: "password",
                      labelText: "pwd",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_showPwd ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _showPwd = !_showPwd;
                          });
                        },
                      )),
                  obscureText: !_showPwd,
                ),
                ver: 10,
                hor: 30),
            Container(
              width: 300,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              child: Card(
                color: Theme.of(context).primaryColor,
                child: FlatButton(
                  onPressed: () {
                    onLogin();
                    debugPrint("点击了登录");
                  },
                  child: Text(
                    "登录",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                elevation: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onLogin() {
    if (_nameCtrl.text != null && _pwdCtrl.text != null && _pwdCtrl.text.length >= 6) {
      debugPrint("去登录");
    } else {
      debugPrint("去登录 showToast");
      Toast.show(
        "请验证你的用户名或密码",
        context,
        duration: Toast.LENGTH_SHORT,
        gravity: Toast.BOTTOM,
      );
    }
  }
}
