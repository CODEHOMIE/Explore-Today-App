import 'package:explore_app/constants/constants.dart';
import 'package:explore_app/styles/explore_app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionTextWidget extends StatefulWidget{
  final String text;

  DescriptionTextWidget({@required this.text});
  @override
  State<StatefulWidget> createState() => _DescriptionTextWidgetState();

}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Text(widget.text,
            style: TextStyle(
                fontFamily: Constants.OPEN_SANS,
                fontWeight: FontWeight.w500,
                fontSize: 12.5,
                color: ExploreAppTheme.nearlyWhite,
                letterSpacing: 0.8,
              ),
          ),
          SizedBox(height: 10.0,),
          new InkWell(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Text(
                  "Read more",
                  style: new TextStyle(
                    color: ExploreAppTheme.exploreYellow,
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.w700,
                    fontSize: 13.0,
                  ),
                ),
                SizedBox(width: 10.0,),
              ],
            ),
            onTap: () {
              setState(() {
              });
            },
          ),
          SizedBox(height: 20.0,)
        ],
      ),
    );
  }

}