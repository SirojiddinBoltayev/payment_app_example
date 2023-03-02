import 'package:flutter/cupertino.dart';
import 'package:payment_app_example/pages/widget/banner_view.dart';
import 'package:payment_app_example/view_model/main_provider.dart';
import 'package:provider/provider.dart';

import 'home.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MainProvider>(context);
    return  CustomScrollView(
    slivers: [
    const CarouselBannerHomePage(),
TitleList(title: "MOST POPULAR"),
KategoriyaItemContainer(listImage: viewModel.mostPopularImageList, listTitle: viewModel.mostPopularTitleList,),
TitleList(title: "TOP-UPS"),
KategoriyaItemContainer(listImage: viewModel.mostPopularImageList, listTitle: viewModel.mostPopularTitleList,),
],
);
  }
}
