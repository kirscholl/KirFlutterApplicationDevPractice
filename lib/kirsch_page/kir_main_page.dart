import 'package:flutter/material.dart';
import 'package:kirsch_app/kirsch_page/kir_login_page.dart';
import 'package:kirsch_app/kirsch_widget/kir_main_bottom_navigation_bar.dart';

class KirApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kirsch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: KirLoginPage(),
    );
  }
}
