import 'package:flutter/cupertino.dart';

class CirlcleImage extends StatefulWidget {
  final imageSize, imageUrl;

  CirlcleImage({@required this.imageSize, @required this.imageUrl});

  @override
  State<StatefulWidget> createState() => _CircularImage();
}

class _CircularImage extends State<CirlcleImage> {
  @override
  Widget build(BuildContext context) {
    double _size = widget.imageSize;

    return Center(
      child: new Container(
          width: _size,
          height: _size,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: new NetworkImage(widget.imageUrl)))),
    );
  }
}
