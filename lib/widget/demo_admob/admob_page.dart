//import 'package:firebase_admob/firebase_admob.dart';
//import 'package:flutter/material.dart';
//
//class AdmobPage extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return new _AdmobPageState();
//  }
//}
//
//class _AdmobPageState extends State<AdmobPage> {
//  static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
//    testDevices: ["8C21509A809BAC1D40DCE688BE5E959A"],
//    keywords: ['flutterio', 'beautiful apps'],
//  );
//
//  BannerAd bannerAd;
//  InterstitialAd interstitialAd;
//
//  BannerAd buildBanner() {
//    return BannerAd(
//        adUnitId: BannerAd.testAdUnitId,
//        size: AdSize.banner,
//        listener: (MobileAdEvent event) {
//          print('BannerAd：$event');
//          bannerAd
//            ..load()
//            ..show();
//        });
//  }
//
//  InterstitialAd buildInterstitial() {
//    return InterstitialAd(
//        adUnitId: InterstitialAd.testAdUnitId,
//        targetingInfo: targetingInfo,
//        listener: (MobileAdEvent event) {
//          if (event == MobileAdEvent.failedToLoad) {
//            interstitialAd..load();
//          } else if (event == MobileAdEvent.closed) {
//            interstitialAd = buildInterstitial()..load();
//          }
//          print('InterstitialAd：$event');
//        });
//  }
//
//  @override
//  void initState() {
//    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
//    bannerAd = buildBanner()..load();
//    interstitialAd = buildInterstitial()..load();
//    super.initState();
//  }
//
//  @override
//  void dispose() {
//    bannerAd?.dispose();
//    interstitialAd?.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("Admob"),
//        centerTitle: true,
//      ),
//      floatingActionButton: new FloatingActionButton(
//          child: new Text("ad"),
//          onPressed: () {
//            interstitialAd
//              ..load()
//              ..show();
//          }),
//    );
//  }
//}
