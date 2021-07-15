import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kirsch_app/kirsch_widget/kir_cupertino_button.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: CupertinoButton(
            child: Icon(Icons.list_outlined, color: Colors.white),
            onPressed: () {
              //todo 实现左侧滑出的选项卡,点击滑出,手势向右滑动滑出,同时禁用回退手势
            },
          ),
        ),
        title: Text(
          'Message',
          style: TextStyle(),
        ),
        actions: [
          _messagePageCloudPhoneCallButton(),
          _messagePageAddButton(),
        ],
      ),
      body: SingleChildScrollViewTestRoute(),
    );
  }

  _messagePageCloudPhoneCallButton() => CupertinoButton(
      child: Icon(Icons.backup_outlined, color: Colors.white),
      onPressed: () {
        //...
      });

  _messagePageAddButton() => CupertinoButton(
        child: Icon(Icons.add_circle_outline, color: Colors.white),
        onPressed: () {
          //todo messagePageAdd
        },
      );
}

class SingleChildScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scrollbar(
        child: SingleChildScrollView(
          //初始滚动位置 false从尾部开始
          // reverse: true,
          //默认的PrimaryScrollController
          // primary: true,
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              //动态创建一个List<Widget>
              children:
                //每个字母都用一个Text显示,字体为原来的两倍
                str.split("").map((e) => Text(e, textScaleFactor: 2.0,)).toList(),
            ),
          ),
        )
    );
  }
}

class ListViewTestRoute extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Widget divider1 = Divider(color: Colors.lightBlue);
    Widget divider2 = Divider(color: Colors.lightGreen);
    return ListView.separated(
      itemCount: 100,
      //列表构造器
      itemBuilder: (BuildContext context, int index){
        return ListTile(title: Text("$index"),);
      },
      separatorBuilder: (BuildContext context, int index){
        return index % 2 == 0? divider1: divider2;
      }
    );
  }
}


