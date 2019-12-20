import 'package:banner/banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study3/net/dio_http.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List listData = List();
  var physics;
  ScrollController controller;

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> map = {
      "actionCode": "A00069",
      "placeCode": "APPSTART",
    };
    HttpManager.getInstance().post("", map, (data) {
      debugPrint("res--- $data");
    }, (error) {
      debugPrint("error--- $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('消息中心'),
        centerTitle: true,
      ),
      body: Container(
//        child: ListView.builder(
//          itemBuilder: (BuildContext context, int index) => renderRow(index),
//          itemCount: listData.length * 2 + 1,
//          physics: physics,
//          controller: controller,
//        ),
        child: Text("asddds"),
      ),
    );
  }

  Widget renderRow(int index) {
    if (index == 0) {
      return bannerWidget();
    }
    //index 大于 0 时
    index -= 1;
    //为基数，渲染分割线
    if (index.isOdd) {
      return Divider(
        height: 1.0,
      );
    }

    index = index ~/ 2;

    var itemData = listData[index];
    return Text("item data = $itemData");
  }

  //banner
  Widget bannerWidget() {
    return Container(
      height: 180,
      /**
       * ###属性
          data 传入list<*>
          onBannerClickListener(index,itemData) 点击事件
          delayTime 秒 延迟多少秒进入下一页
          scrollTime 毫秒 滑动至下页需要秒数
          height 高度
          buildShowView(index,itemData) 返回一个用于展示的widget
       */
      child: BannerView(
          data: listData[0],
          onBannerClickListener: (index, data) {
            debugPrint("click $index");
          },
          delayTime: 3,
          scrollTime: 100,
          buildShowView: (index, data) {
            return Image.network(
              data.url,
              fit: BoxFit.cover,
            );
          }),
    );
  }
}
