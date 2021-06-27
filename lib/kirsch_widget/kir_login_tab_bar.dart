import 'package:flutter/material.dart';
import 'package:kirsch_app/kirsch_page/address_list_page.dart';

class LoginWay {
  const LoginWay({this.way, this.loginPrompt, this.iconData});
  final String way;
  final String loginPrompt;
  final IconData iconData;
}

const List<LoginWay> loginWays = const <LoginWay>[
  const LoginWay(way: "手机号", loginPrompt: "请输入你的手机号", iconData: Icons.phone),
  const LoginWay(way: "邮箱", loginPrompt: "请输入你的邮箱", iconData: Icons.email)
];

class KirLoginTabBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return KirLoginTabBarState();
  }
}

class KirLoginTabBarState extends State<KirLoginTabBar> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);                 //todo SingleTickerProviderStateMixin => vsync ???
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_loginTabBar(), _loginTabBarView()],
      ),
    );
  }

  Widget _loginTabBar() {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: TabBar(
          controller: _tabController,
          labelColor: Colors.lightBlue,
          labelStyle: TextStyle(fontSize: 15),
          isScrollable: true,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.lightBlue,
          tabs: loginWays.map((LoginWay loginWay) {                             //todo trial list.map toList() ???
            return Tab(
              text: loginWay.way,
            );
          }).toList()),
    );
  }

  Widget _loginTabBarView() {
    return Container(
      padding: EdgeInsets.only(top:10),
      height: 40,
      child: TabBarView(
          controller: _tabController,
          children: loginWays.map((LoginWay loginWay) {
            return Row(
              children: [
                Icon(loginWay.iconData),
                TextField(

                )
              ],
            );
          }).toList()),
    );
  }
}
