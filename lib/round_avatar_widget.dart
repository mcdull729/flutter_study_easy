import 'package:flutter/material.dart';

class RectAvatarWidget extends StatelessWidget {
  final Image avatar;

  const RectAvatarWidget({Key key, @required this.avatar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: avatar,
      clipper: MyCliper(avatar),
    );
  }
}

class MyCliper extends CustomClipper<Rect> {
  final Image _image;

  MyCliper(this._image);

  @override
  Rect getClip(Size size) {
    double w = _image.width;
    double h = _image.height;
    debugPrint("w = " + w.toString() + ",h = " + h.toString());
    double left = w > h ? (w - h) / 2 : 0;
    double top = w > h ? 0 : (h - w) / 2;
    debugPrint("left = " + left.toString() + ",top = " + top.toString());
    return Rect.fromLTWH(left, top, w, h);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}
