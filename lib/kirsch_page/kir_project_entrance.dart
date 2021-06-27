import 'package:flutter/material.dart';
import 'package:kirsch_app/kirsch_page/kir_login_page.dart';
import 'package:kirsch_app/kirsch_page/kir_main_navigation_page.dart';

class KirApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kirsch',
      theme: ThemeData(primarySwatch: Colors.blue, splashColor: Colors.transparent, highlightColor: Colors.transparent),
      home: KirLoginPage(),
      routes: {
        "/kirLoginPage": (context) => KirLoginPage(),
        "/kirMainNavigationPage": (context) => KirMainNavigationPage(),
      },
    );
  }
}
