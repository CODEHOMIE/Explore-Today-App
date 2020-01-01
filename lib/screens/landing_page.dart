import 'package:explore_app/constants/constants.dart';
import 'package:explore_app/styles/explore_app_theme.dart';
import 'package:explore_app/ui_views/landing_page_actionbar_view.dart';
import 'package:explore_app/ui_views/top_headlines_view.dart';
import 'package:explore_app/widgets/gradient_shadow.dart';
import 'package:explore_app/widgets/slide_dots.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ExploreAppTheme.background,
      child: Scaffold(
        backgroundColor: ExploreAppTheme.background,
        body: Stack(
          children: <Widget>[
            backgroundImage(),
            GradientShadow(),
            landingPageBody()
            
          ],
        ),
      ),
    );
  }

  Widget backgroundImage() => Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.4,   
            left: MediaQuery.of(context).size.width * 0.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: new AssetImage("assets/images/bg_photo.png"),
            fit: BoxFit.cover,
          )),
        ),
      );

  Widget landingPageBody() => ListView(
        children: <Widget>[
          LandingPageActionBarView(),
          exploreHomeTitle(),
          TopHeadlinesView(),
          sliderIndicators()
        ],
      );

      Widget sliderIndicators() => Container(              
                  margin: EdgeInsets.only(
                      bottom: 20.0,
                      top: 50.0,
                      left: 20.0),
                  child:Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            for (int i = 0; i < 4; i++)
                              if (i == _currentPage)
                                SlideDots(true)
                              else
                                SlideDots(false)
                          ],
                        ),
                );

  Widget exploreHomeTitle() => Padding(
      padding: EdgeInsets.only(left: 25.0, top: 60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            Constants.EXPLORE_HEADING,
            style: TextStyle(
              fontFamily: Constants.POPPINS,
              fontWeight: FontWeight.w600,
              height: 0.8,
              fontSize: 30.0,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            Constants.EXPLORE_SUBHEADING,
            style: TextStyle(
              fontFamily: Constants.OPEN_SANS,
              fontWeight: FontWeight.w400,
              fontSize: 11.5,
              color: Colors.white,
              letterSpacing: 0.7,
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
        ],
      ));
}
