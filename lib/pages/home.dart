import 'package:flutter/material.dart';
import 'package:payment_app_example/pages/account_page.dart';
import 'package:payment_app_example/pages/diamonds_page.dart';
import 'package:payment_app_example/pages/home_page.dart';
import 'package:provider/provider.dart';

import '../view_model/main_provider.dart';

import 'details_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController pageController = PageController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> listPage = <Widget>[
    HomePage(),
    AccountPage(),
  ];

  static const List<BottomNavigationBarItem> menuItemList =
      <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
  ];

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MainProvider>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  viewModel.light
                      ? viewModel.isLight(false)
                      : viewModel.isLight(true);
                });
              },
              icon: const Icon(Icons.dark_mode)),
        ],
      ),
      body: Center(
        child: listPage.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: menuItemList,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.shifting,
        elevation: 16,
        showSelectedLabels: true,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).primaryColorLight,
      ),
      drawer: Drawer(
        child: Container(
          color: Theme.of(context).accentColor,
          child: SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 8),
                  child: Text(
                    "Sign up to Paymen App today!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.percent),
                  title: Text(
                    "Be first to know about exclusive promos and deals",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.bookmark_border),
                  title: Text(
                    "Easy access to your order history ",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.safety_check),
                  title: Text(
                    "Faster and more secure ",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Sign up, it's free"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class KategoriyaItemContainer extends StatelessWidget {
  final List listImage;
  final List? listTitle;
  bool isTitleShow;
  String? isHome;
  bool isValidate;

  KategoriyaItemContainer(
      {Key? key,
      required this.listImage,
      this.listTitle,
      required this.isTitleShow,
      this.isHome,
      required this.isValidate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return SliverPadding(
      padding: const EdgeInsets.all(25),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isTitleShow ? 3 : 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: isTitleShow ? 0.6 : 0.9,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  if (isTitleShow) {
                    isValidate
                        ? Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => DetailsPage()))
                        : Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => DiamondsPage()));

                  }

                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors.black.withOpacity(0.1), width: 3),
                      image: DecorationImage(
                          image: AssetImage(
                            listImage[index],
                          ),
                          fit: isTitleShow ? BoxFit.cover : BoxFit.contain)),
                  alignment: Alignment.center,
                  child: const SizedBox(
                    height: 100,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                listTitle![index],
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          );
        },
            childCount: isTitleShow
                ? 6
                : 4 /*KategoriyaHomePageList.kategoriyaData.length,*/
            ),
      ),
    );
  }
}

class TitleList extends StatelessWidget {
  String title;

  TitleList({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.05, top: size.height * 0.015),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(
                    right: size.width * 0.05, top: size.height * 0.015),
                child: const Text(
                  "More...",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
