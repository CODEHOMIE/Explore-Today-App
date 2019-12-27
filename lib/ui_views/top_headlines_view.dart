import 'package:explore_app/api/services.dart';
import 'package:explore_app/constants/constants.dart';
import 'package:explore_app/models/article.dart';
import 'package:explore_app/screens/view_article.dart';
import 'package:explore_app/styles/explore_app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class TopHeadlinesView extends StatefulWidget {
  @override
  _TopHeadlinesViewState createState() => _TopHeadlinesViewState();
}

class _TopHeadlinesViewState extends State<TopHeadlinesView>
    with
        TickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<TopHeadlinesView> {
  AnimationController animationController;

  Article _article;

  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    super.initState();
    Services.getArticles().then((ArticlesFromServer) {
      setState(() {
        _article = ArticlesFromServer;
      });
    });
  }

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250, // <------------------  card height
      width: double.infinity,
      child: categoryListView(),
    );
  }

  Widget categoryListView() => ListView.builder(
        addAutomaticKeepAlives: true,
        padding: const EdgeInsets.only(bottom: 0, right: 17, left: 17),
        itemCount: _article == null ? 0 : _article.articles.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var count =
              _article.articles == null ? 10 : _article.articles.length ?? 0;

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: Material(
            child: InkWell(
              splashColor: ExploreAppTheme.exploreYellow,
              child: SizedBox(
                width: 153, // <------------------  card widgth
                child: showAllUI(index),
              ),
            ),
          ));
        },
      );

  Widget gradientShadow() => Container(
        height: 250.0,
        decoration: BoxDecoration(
            color: ExploreAppTheme.background,
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [ExploreAppTheme.background, Colors.transparent])),
      );

  Widget showAllUI(int index) => Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0.0),
            child: InkWell(
              hoverColor: ExploreAppTheme.exploreYellow,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewArticleScreen()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: ExploreAppTheme.background,
                    borderRadius: BorderRadius.all(Radius.circular(0.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: ExploreAppTheme.background.withOpacity(0.2),
                          offset: Offset(1.1, 4.0),
                          blurRadius: 8.0),
                    ],
                    image: DecorationImage(
                      image: new NetworkImage(
                          _article.articles[index].urlToImage == null
                              ? ""
                              : _article.articles[index].urlToImage),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
          gradientShadow(),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 120.0, left: 10.0, right: 5.0, bottom: 4.0),
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
                                fontSize: 8,
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
                                fontSize: 8,
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
                  Text(_article.articles[index].description,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: Constants.POPPINS,
                        fontWeight: FontWeight.w600,
                        fontSize: 11.0,
                        letterSpacing: 0.2,
                        height: 0.9,
                        color: ExploreAppTheme.white,
                      )),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    _article.articles[index].source.name,
                    style: TextStyle(
                      fontFamily: Constants.OPEN_SANS,
                      fontWeight: FontWeight.w500,
                      fontSize: 9.5,
                      letterSpacing: 0.2,
                      color: ExploreAppTheme.nearlyWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  @override
  bool get wantKeepAlive => true;
}
