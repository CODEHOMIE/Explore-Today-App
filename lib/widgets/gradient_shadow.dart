import 'package:explore_app/styles/explore_app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: ExploreAppTheme.background,
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topRight,
                colors: [Colors.black, ExploreAppTheme.nearlyTransparent])),
      );
  }

}