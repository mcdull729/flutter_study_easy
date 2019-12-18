import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true, //移除抽屉菜单顶部默认留白
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/imgs/avatar.png",
                          width: 80,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Text(
                      "mcdull",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                padding: EdgeInsets.only(top: 38)),
            Expanded(
                child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text("message"),
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text("info"),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

pd(Widget w, {double l, double t, double r, double b}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(l, t, r, b),
    child: w,
  );
}
