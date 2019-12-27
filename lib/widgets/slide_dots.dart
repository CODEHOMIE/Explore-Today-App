import 'package:explore_app/styles/explore_app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
  
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3.5),
      height: isActive ? 5 : 5,
      width: isActive ? 17 : 5,
      decoration: BoxDecoration(
        color: isActive ? ExploreAppTheme.exploreYellow : ExploreAppTheme.indicatorColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
