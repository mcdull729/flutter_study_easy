import 'package:flutter/material.dart';

import 'login_page.dart';

class PersonalPage extends StatefulWidget {
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  var userInfo;
  var listTitles = ["我的消息", "我的博客", "阅读记录"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('个人中心'),
//        centerTitle: true,
//      ),

      ///CustomScrollView的子组件必须都是Sliver的，即，使用SliverList、SliverGrid等，
      ///Sliver版的可滚动组件和非Sliver版的可滚动组件最大的区别是：
      ///Sliver版的可滚动组件不包含滚动模型（自身不可再滚动），而非Sliver版的可滚动组件包含滚动模型
      body: CustomScrollView(
        slivers: <Widget>[
          ///SliverAppBar可以集成到CustomScrollView中，结合FlexibleSpaceBar实现Material Design中的头部伸缩模型
          SliverAppBar(
            floating: false,
            title: Text("个人中心"),
            pinned: true,
            //收缩时titlebar是否固定在头部
            expandedHeight: 200.0,
            backgroundColor: Theme.of(context).primaryColor,
            flexibleSpace: InkWell(
              //inkwell 可以实现触摸水波纹效果
              onTap: () {
                if (userInfo == null) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                  debugPrint("去登录");
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  userInfo == null
                      ? ClipOval(
                          child: Image.asset(
                            "assets/imgs/avatar.png",
                            width: 80,
                          ),
                        )
                      : Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                                  fit: BoxFit.cover),
                              border: Border.all(color: Colors.white, width: 1.0)),
                        ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    child: Text(
                      userInfo == null ? "点击头像登录" : userInfo.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
//demo，注释掉
//          SliverPadding(
//            padding: EdgeInsets.all(8.0),
//            sliver: SliverGrid(
//              delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
//                ///创建子widget
//                return Container(
//                  alignment: Alignment.center,
//                  color: Colors.cyan[100 * (index % 9)],
//                  child: Text("grid item $index"),
//                );
//              }, childCount: 50),
//              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                crossAxisCount: 2, //grid 按照两列显示
//                mainAxisSpacing: 10.0,
//                crossAxisSpacing: 10.0,
//                childAspectRatio: 4.0,
//              ),
//            ),
//          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text(listTitles[index]),
                );
              },
              childCount: listTitles.length,
            ),
            itemExtent: 50, //item条目的高度
          ),
        ],
      ), //      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text("个人中心页面"),
//            Container(
//              margin: EdgeInsets.all(10),
//              child: FlatButton(
//                onPressed: () {
//                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//                    return LoginPage();
//                  }));
//                },
//                child: Text('去登录'),
//                color: Colors.red,
//              ),
//            ),
//          ],
//        ),
//      ),
    );
  }
}
