import 'package:flutter/cupertino.dart';

class MainProvider with ChangeNotifier {
  bool light = true;
isLight(state){
  light = state;
  notifyListeners();}
  int isChanged = 0;

  homePageBannerChanged(value){
    isChanged = value;
    notifyListeners();
  }

  List<String> mostPopularImageList = [
    "assets/8_ball_pool.jpg",
    "assets/basketrio_us_tile.jpg",
    "assets/ic_genshin_impact.jpg",
    "assets/ic_mobile_legends.png",
    "assets/lord_of_the_rings_tile.jpeg",
    "assets/tr_new_overlay_us.jpg",
  ];

  List<String> mostPopularTitleList = [
    "8 Ball Pool",
    "Basketrio",
    "Genshin Impact",
    "Mobile Legends",
    "The Lord of the Rings: Rise to War",
    "Time Raiders",
  ];

}

  /// Makes `Counter` readable inside the devtools by listing all of its properties

