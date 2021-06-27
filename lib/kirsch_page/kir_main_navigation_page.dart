import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kirsch_app/kirsch_page/address_list_page.dart';
import 'package:kirsch_app/kirsch_page/message_page.dart';
import 'package:kirsch_app/kirsch_page/mine_page.dart';
import 'package:kirsch_app/kirsch_page/work_bench_page.dart';

class KirMainNavigationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => KirMainNavigationPageState();
}

class KirMainNavigationPageState extends State<KirMainNavigationPage> {
  var _currentIndex = 0;
  List<Widget> _pageList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black54,
        fixedColor: Colors.lightBlue,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        selectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement_outlined),
            label: "消息",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree_outlined),
            label: "通讯录",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps_outlined),
            label: "工作台",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "我",
          ),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
      ),
    );
  }

  _bottomNavigationBarItem(String label) => BottomNavigationBarItem();

  @override
  void initState() {
    _pageList..add(MessagePage())..add(AddressListPage())..add(WorkBenchPage())..add(MinePage());
    super.initState();
  }
}

enum mainPageBottomItemTappedType { informationTapped, addressListTapped, workBranchTapped, minePageTapped }
