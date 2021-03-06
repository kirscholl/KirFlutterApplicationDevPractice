import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class AddressListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddressList'),
      ),
      body: InfiniteListView(),
    );
  }
}

class InfiniteListView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _InfiniteListViewState();
  }
}

class _InfiniteListViewState extends State<InfiniteListView>{
  static const loadingTag = "###loading###";//表尾标记
  var _words = <String>[loadingTag];


  @override
  void initState() {
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context,index){
        //如果到了表尾
        if(_words[index] == loadingTag){
          //不足100条,继续获取数据
          if(_words.length - 1 < 100){
            //获取数据
            _retrieveData();
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2.0),
              ),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16),
              child: Text('没有更多了',style: TextStyle(color: Colors.grey),),
            );
          }
        }
        //显示单词列表项
        return ListTile(title: Text(_words[index]),);
      },
      separatorBuilder: (context, index) => Divider(height: .0),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {
        //重新构建列表
      });
    });
  }
}
