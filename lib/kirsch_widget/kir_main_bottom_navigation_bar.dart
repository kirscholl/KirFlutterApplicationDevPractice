import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kirsch_app/kirsch_page/address_list_page.dart';
import 'package:kirsch_app/kirsch_page/message_page.dart';
import 'package:kirsch_app/kirsch_page/mine_page.dart';
import 'package:kirsch_app/kirsch_page/work_bench_page.dart';

class KirBottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => KirBottomNavigationWidgetState();
}

class KirBottomNavigationWidgetState extends State<KirBottomNavigationWidget> {
  final _unSelectedBottomNavigationColor = Colors.blueGrey;
  int _currentIndex = 0;
  List<Widget> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlue,
        type: BottomNavigationBarType.shifting,
        // selectedLabelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.lightBlue),
        // unselectedLabelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.grey),
        fixedColor: Colors.lightBlue,
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
      ),
    );
  }

  @override
  void initState() {
    list..add(MessagePage())..add(AddressListPage())..add(WorkBenchPage())..add(MinePage());
    super.initState();
  }
}

enum mainPageBottomItemTappedType { informationTapped, addressListTapped, workBranchTapped, minePageTapped }
