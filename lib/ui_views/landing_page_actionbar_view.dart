import 'package:explore_app/styles/explore_app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingPageActionBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, left: 25.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 35.0,
            width: 30.0,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 3.0, color: ExploreAppTheme.exploreYellow)),
            ),
          ),
        
          // Expanded(
          //   child: Divider(
          //     height: 1.0,
          //     color: ExploreAppTheme.nearlyWhite,
          //   ),
          // )
        ],
      ),
    );
  }
}
