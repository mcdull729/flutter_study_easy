import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('首页的内容'),
      ),
    );
  }

  Widget renderItem(int index) {
    var line = Row(
      children: <Widget>[
        Image.asset(
          "assets/imgs/avatar.png",
          width: 30,
          height: 30,
        ),
        Expanded(child: pd(Text("mcdull\'s daddy"), l: 5)),
        Text(
          "flutter / dart",
          style: infoStyle,
        ),
      ],
    );
    var center_right = Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'flutter 4th day',
          style: littleStyle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        pd(
            Text(
              '1.2:优雅地查看，图片的适应模式',
              style: infoStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            t: 5)
      ],
    );
    return Row(
      children: <Widget>[line, center_right],
    );
  }
}

var littleStyle = TextStyle(fontSize: 10, color: Colors.black26);
var infoStyle = TextStyle(fontSize: 15, color: Colors.black26);

pd(Widget w, {double l, double t, double r, double b}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(l, t, r, b),
    child: w,
  );
}
