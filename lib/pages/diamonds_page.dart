import 'package:flutter/material.dart';
import 'package:payment_app_example/pages/home.dart';

class DiamondsPage extends StatefulWidget {
  const DiamondsPage({Key? key}) : super(key: key);

  @override
  State<DiamondsPage> createState() => _DiamondsPageState();
}

class _DiamondsPageState extends State<DiamondsPage> {
  @override
  Widget build(BuildContext context) {
    List<String> listImage = [
      "assets/50ormore_MLBB_Diamonds.png",
      "assets/150orMore_MLBB_Diamonds.png",
      "assets/500orMore_MLBB_Diamonds.png",
      "assets/1000orMore_MLBB_Diamonds.png",
    ];
    List<String> listTitle = [
      "55 Diamonds",
      "275 Diamonds",
      "565 Diamonds",
      "1160 Diamonds",
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Diamonds"),
      ),
      body: CustomScrollView(
        slivers: [
          KategoriyaItemContainer(listImage: listImage,listTitle: listTitle, isTitleShow: false)
        ],
      )
    );
  }
}
