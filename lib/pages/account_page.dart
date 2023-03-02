import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image.asset("assets/profilecircle_drawer.png"),

                ],
              ),

            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("User name",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(width: 8,),
                Icon(Icons.edit,size: 20,),
              ],
            ),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email: ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  SizedBox(height: 12,),
                  Divider(),
                  Text("Number: ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  SizedBox(height: 12,),                  Divider(),



                  Text("Adress: ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.2,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Version application v0.0.1",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey),),
                  ],
                ),
              ],
            ),


          ],
      ),
    );
  }
}
