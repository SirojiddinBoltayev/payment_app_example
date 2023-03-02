import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:payment_app_example/view_model/main_provider.dart';
import 'package:provider/provider.dart';

class CarouselBannerHomePage extends StatefulWidget {
  const CarouselBannerHomePage({Key? key}) : super(key: key);

  @override
  State<CarouselBannerHomePage> createState() => _CarouselBannerHomePageState();
}

class _CarouselBannerHomePageState extends State<CarouselBannerHomePage> {
  List<String> _listCarouselImage = [
    "assets/time_raiders.jpg",
    "assets/genshin_impact.jpg",
    "assets/mobile_legends.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    final bannerCarouselView = Provider.of<MainProvider>(context);
    final size = MediaQuery.of(context).size;
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Stack(
            children: [
              Container(
                height: 160,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10.0),
                child: CarouselSlider(
                  items: [
                    ...List.generate(
                      _listCarouselImage.length,
                      (index) => Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: colorsList[index],
                            borderRadius: BorderRadius.circular(35),
                            image: DecorationImage(
                              image: AssetImage(_listCarouselImage[index]),
                            fit: BoxFit.cover),),
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    onPageChanged: (item, reason) {
                      bannerCarouselView.homePageBannerChanged(item);
                    },
                    autoPlay: true,
                    enableInfiniteScroll: false,
                  ),
                ),
              ),
              Container(
                height: 160,
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ...List.generate(
                        _listCarouselImage.length,
                        (index) => Indicator(
                              bannerCarouselView.isChanged == index
                                  ? true
                                  : false,
                              true,
                            ))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Color> colorsList = const [
    Color(0xffF21313),
    Color(0xffFFE582),
    Color(0xff37A8D9),
    Color(0xffFFE582),
    Color(0xffF21313),
    Color(0xff37A8D9),
    Color(0xffFFE582),
  ];
}

class Indicator extends StatelessWidget {
  final bool isActive;
  final bool isLoading;

  const Indicator(
    this.isActive,
    this.isLoading, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutQuad,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: isActive ? 25.0 : 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        color: isActive
            ? isLoading
                ? Theme.of(context).cardColor
                : const Color(0xFFE602)
            : isLoading
                ? Theme.of(context).cardColor
                : Colors.grey,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            offset: Offset(0, 0), // Shadow position
          ),
        ],
      ),
    );
  }
}
