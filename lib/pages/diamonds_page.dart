import 'package:flutter/material.dart';
import 'package:payment_app_example/pages/home.dart';

import 'details_page.dart';

class DiamondsPage extends StatefulWidget {
  const DiamondsPage({Key? key}) : super(key: key);

  @override
  State<DiamondsPage> createState() => _DiamondsPageState();
}

class _DiamondsPageState extends State<DiamondsPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isValid = false;
  int count = 0;

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
            SliverList(
                delegate: SliverChildListDelegate([
                  Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: formKey,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 24.0, top: 27),
                            child: TextFormField(
                              onTap: () {
                                setState(() {
                                  count++;
                                  count < 1 ? isValid = true : isValid = false;
                                  count < 1
                                      ? formKey.currentState!.validate()
                                      : null;
                                });
                              },
                              style: const TextStyle(fontSize: 14),

                              decoration: InputDecoration(
                                label: Text("Enter User ID"),
                                enabled: true,
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 1.0),
                                ),
                                // contentPadding: EdgeInsets.all(5),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 1.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 24, top: 27),
                            child: TextFormField(
                              validator: (val) {
                                isValid = true;
                              },

                              onTap: () {
                                setState(() {
                                  count++;
                                  count < 1 ? isValid = true : isValid = false;
                                  count < 1
                                      ? formKey.currentState!.validate()
                                      : null;
                                });
                              },
                              style: const TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                label: const Text("Zone ID"),
                                enabled: true,
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 1.0),
                                ),
                                // contentPadding: EdgeInsets.all(5),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 1.0),
                                ),
                              ),

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ])),

            SliverPadding(
              padding: const EdgeInsets.all(25),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio:  0.9,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                            isValid
                                ? Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    DetailsPage()))
                                : null;

                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme
                                  .of(context)
                                  .cardColor,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.1),
                                  width: 3),
                              image: DecorationImage(
                                  image: AssetImage(
                                    listImage[index],
                                  ),
                                  fit:  BoxFit
                                      .contain)),
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
                    childCount:
                    4 /*KategoriyaHomePageList.kategoriyaData.length,*/
                ),
              ),
            )
          ],
        ));
  }
}
