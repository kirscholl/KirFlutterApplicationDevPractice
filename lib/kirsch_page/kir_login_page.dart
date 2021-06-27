import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kirsch_app/kirsch_widget/kir_login_tab_bar.dart';

//todo 实现通用登陆界面

class KirLoginPage extends StatelessWidget {
  final loginTitle = "Login Kir";

  //todo 抽离分割各个部分的widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.fromLTRB(10, 100, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _loginTitle(loginTitle),
          _loginWarningText(),
          KirLoginTabBar(),
          _toNextButton(),
          _registrationPrompt()
        ],
      ),
    ));
  }

  Widget _loginTitle(String title) {
    return Container(
      child: Text(
        loginTitle,
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _loginWarningText() {
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: Text.rich(TextSpan(children: [
          _loginWarningTextFragment("点击登陆代表你同意", Colors.black54),
          _loginWarningTextFragment("服务协议", Colors.blue),
          _loginWarningTextFragment("和", Colors.black54),
          _loginWarningTextFragment("隐私政策", Colors.blue),
        ])));
  }

  _loginWarningTextFragment(String text, Color color, [GestureRecognizer gestureRecognizer]) {
    return TextSpan(
        text: text,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: color,
        ),
        recognizer: gestureRecognizer);
  }

  Widget _toNextButton() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 40,
      width: double.infinity,
      child: FlatButton(
        color: Colors.lightBlue,
        child: Text(
          "下一步",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 17),
        ),
        onPressed: () {
          //...
        },
      ),
    );
  }

  Widget _registrationPrompt() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Text.rich(
        TextSpan(children: [
          TextSpan(
            text: "还没有账号?",
            style: TextStyle(fontSize: 15, color: Colors.black54),
          ),
          TextSpan(
            text: "立即注册",
            style: TextStyle(fontSize: 15, color: Colors.lightBlue),
          )
        ]),
      ),
    );
  }
}
