import 'dart:async';

import 'package:explore_app/constants/constants.dart';
import 'package:explore_app/styles/explore_app_theme.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String testDevice = "Mobile_id";

class ReadMoreScreen extends StatefulWidget {
  final articleUrl;

  ReadMoreScreen({@required this.articleUrl});

  @override
  _ReadMoreScreenState createState() => _ReadMoreScreenState();
}

class _ReadMoreScreenState extends State<ReadMoreScreen> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  final Set<String> _favorites = Set<String>();

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    nonPersonalizedAds: true,
    keywords: <String>["Game", "Mario"],
  );

  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;

  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.banner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("BannerAd $event");
        });
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
        adUnitId: InterstitialAd.testAdUnitId,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("InterstitialAd $event");
        });
  }

  @override
  void initState() {
    FirebaseAdMob.instance.initialize(appId: BannerAd.testAdUnitId);
    _bannerAd = createBannerAd()..load()..show();
    _interstitialAd = createInterstitialAd()..load()..show();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    _interstitialAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ExploreAppTheme.background,
        title: Text(
          "Explore",
          style: new TextStyle(
            color: ExploreAppTheme.exploreYellow,
            fontFamily: Constants.POPPINS,
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          loadingText(),
          WebView(
            initialUrl: widget.articleUrl,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
          )
        ],
      ),
    );
  }

  Widget loadingText() => Center(
        child: Text(
          "Loading...",
          style: new TextStyle(
            color: ExploreAppTheme.background,
            fontFamily: Constants.POPPINS,
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
          ),
        ),
      );
}
