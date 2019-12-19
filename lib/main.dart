import 'package:flutter/material.dart';
import 'package:flutter_study3/page/home_page.dart';
import 'package:flutter_study3/page/message_page.dart';

import 'page/personal_page.dart';
import 'widget/my_drawer.dart';

void main() => runApp(MyApp());

///我们要实现一个基础的APP，它包含
/// 1、导航栏、导航栏右边有个分享按钮，分享按钮可点击
/// 2、有一个抽屉菜单
/// 3、有一个底部导航
/// 4、右下角有个悬浮按钮
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScaffoldRoute(),
    );
  }
}

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  int _selectedIndex = 0; //默认选中的页面
  List<Widget> pageData;

  var appBar = AppBar(
    title: Text(
      "mcdull's daddy",
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
    centerTitle: true, //将title居中显示
    actions: <Widget>[
      //导航栏右侧菜单
      IconButton(
          icon: Icon(Icons.share),
          onPressed: () {
            debugPrint('分享被点击了');
          })
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: appBar,
      drawer: MyDrawer(), //抽屉
      body: pageData[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(icon: Icon(Icons.message), title: Text("消息中心")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("个人中心")),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {},
//        child: Icon(Icons.add),
//        tooltip: "点击加号", //长按Icon时在Icon附近弹出的显示文字
//      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    pageData = new List();
    pageData..add(HomePage())..add(MessagePage())..add(PersonalPage());
  }
}
