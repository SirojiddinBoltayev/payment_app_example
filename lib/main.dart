import 'package:flutter/material.dart';
import 'package:payment_app_example/pages/home.dart';
import 'package:payment_app_example/pages/home_page.dart';
import 'package:payment_app_example/view_model/main_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, x});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final setTheme = Provider.of<MainProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: setTheme.light
          ? ThemeData(
              accentColor: Colors.blue,
              brightness: Brightness.light,
              primaryColor: Colors.blue,
            )
          : ThemeData(
              accentColor: Colors.indigo.withOpacity(0.00),
              brightness: Brightness.dark,
              primaryColor: Colors.indigo.shade900,
            ),
      title: 'Payment app',
      home: MyHomePage(title: 'Payment App',)
    );
  }
}
