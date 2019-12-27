import 'package:explore_app/styles/explore_app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingPageActionBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.0, left: 25.0),
      child: Stack(
        children: <Widget>[
         
          SizedBox(
            height: 35.0,
            width: 30.0,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 3.0, color: ExploreAppTheme.exploreYellow)),
            ),
          ),
          
          Padding(
            padding: EdgeInsets.only(top: 34.0, left: 45.0, right: 20.0),
            child: Divider(
              height: 0.1,
              color: ExploreAppTheme.nearlyWhite,
            ),
          )
          ,
        ],
      ),
    );
  }

}
