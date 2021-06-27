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
