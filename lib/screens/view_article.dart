import 'package:explore_app/constants/constants.dart';
import 'package:explore_app/styles/explore_app_theme.dart';
import 'package:explore_app/ui_views/landing_page_actionbar_view.dart';
import 'package:explore_app/widgets/circle_image.dart';
import 'package:explore_app/widgets/gradient_shadow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ViewArticleScreen extends StatefulWidget {
  final articleObj, index;

  ViewArticleScreen({this.articleObj, this.index});

  @override
  State<StatefulWidget> createState() => _ViewArticleScreen();
}

class _ViewArticleScreen extends State<ViewArticleScreen> {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: ExploreAppTheme.background,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[upperPart(), LandingPageActionBarView()],
          ),
          lowerPart()
        ],
      ),
    );
  }

  Widget headingPart() => Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: ExploreAppTheme.exploreYellow,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 2.0, bottom: 2.0, right: 6.0, left: 6.0),
                        child: Text(
                          "EXPLORE",
                          style: TextStyle(
                            backgroundColor: ExploreAppTheme.exploreYellow,
                            fontFamily: Constants.POPPINS,
                            fontWeight: FontWeight.w700,
                            fontSize: 11,
                            letterSpacing: 0.2,
                            color: ExploreAppTheme.background,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1.0,
                  ),
                  Container(
                    color: ExploreAppTheme.background,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 2.0, bottom: 2.0, right: 13.0, left: 13.0),
                        child: Text(
                          "NOV 5",
                          style: TextStyle(
                            backgroundColor: ExploreAppTheme.background,
                            fontFamily: Constants.POPPINS,
                            fontWeight: FontWeight.w700,
                            fontSize: 11,
                            letterSpacing: 0.2,
                            color: ExploreAppTheme.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 13.0,
              ),
              Text(widget.articleObj.articles[widget.index].title,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: Constants.POPPINS,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                    letterSpacing: 0.2,
                    height: 0.9,
                    color: ExploreAppTheme.white,
                  )),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      );

  Widget lowerPart() => Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Divider(
              height: 1.0,
              color: ExploreAppTheme.nearlyWhite,
            ),
            SizedBox(height: 30.0),
            Text(
              widget.articleObj.articles[widget.index].source.name,
              style: TextStyle(
                fontFamily: Constants.POPPINS,
                fontWeight: FontWeight.w700,
                fontSize: 14.5,
                color: ExploreAppTheme.white,
                letterSpacing: 0.7,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              "${widget.articleObj.articles[widget.index].description}\n\n${widget.articleObj.articles[widget.index].content}",
              style: TextStyle(
                fontFamily: Constants.OPEN_SANS,
                fontWeight: FontWeight.w500,
                fontSize: 12.5,
                color: ExploreAppTheme.nearlyWhite,
                letterSpacing: 0.8,
              ),
            )
          ],
        ),
      );

  Widget upperPart() => Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.60,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: new NetworkImage(
                      widget.articleObj.articles[widget.index].urlToImage,
                    ),
                    fit: BoxFit.cover,
                  )),
                ),
                gradientShadow(),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.4),
                  child: headingPart(),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 25.0, left: 20.0, right: 20.0, bottom: 35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CirlcleImage(
                  imageSize: 25.0,
                  imageUrl: widget.articleObj.articles[widget.index].urlToImage,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  widget.articleObj.articles[widget.index].source.name,
                  style: TextStyle(
                    fontFamily: Constants.OPEN_SANS,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.5,
                    color: ExploreAppTheme.nearlyWhite,
                    letterSpacing: 0.7,
                  ),
                )
              ],
            ),
          ),
        ],
      );

  Widget gradientShadow() => Container(
        decoration: BoxDecoration(
            color: ExploreAppTheme.background,
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [ExploreAppTheme.background, Colors.transparent])),
      );
}
