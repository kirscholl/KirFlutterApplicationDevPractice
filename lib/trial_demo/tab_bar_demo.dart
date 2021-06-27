import 'package:flutter/material.dart';

class AppBarBottomSample extends StatefulWidget {
  @override
  _AppBarBottomSampleState createState() => new _AppBarBottomSampleState();
}

class _AppBarBottomSampleState extends State<AppBarBottomSample> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: choices.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

// 小圆点进行到下一个
  void _nextPage(int delta) {
    final int newIndex = _tabController.index + delta;
    if (newIndex < 0 || newIndex >= _tabController.length) return;
    _tabController.animateTo(newIndex);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          // appBar里的标题写法
          title: const Text('AppBar Bottom Widget'),
          // appBar里标题前的图标，可自定义更改图标
          leading: new IconButton(
            // 长按提示信息，其他地方也能添加，具体效果见图3
            tooltip: 'Previous choice',
            icon: const Icon(Icons.arrow_back),
            // 点击事件监听方法，由于本代码既是首页，故栈中没有上一级。正常会返回上一级，这个方法是本代码中自定义的，也可以采用路由pop的方式
            onPressed: () {
              _nextPage(-1);
            },
          ),
          //
          actions: <Widget>[
            // 非隐藏菜单（隐藏是三个点，点击之后有弹出框）的写法，位置是标题之后的右箭头，icon与点击事件onPressed都可自定义
            new IconButton(
              icon: const Icon(Icons.arrow_forward),
              tooltip: 'Next choice',
              onPressed: () {
                _nextPage(1);
              },
            ),
          ],
          bottom: new PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: new Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.white),
              child: new Container(
                height: 48.0,
                alignment: Alignment.center,
                // AppBar底部的小圆点
                // child: new TabPageSelector(controller: _tabController),
                // 另一种效果，见图4
                child: new TabBar(
                  controller: _tabController,
                  // 未选中时颜色
                  unselectedLabelColor: Colors.white,
                  // 选中时颜色
                  indicatorColor: Colors.white,
                  // 选中时标签长度
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  tabs: choices.map((Choice choice) {
                    return new Tab(
                      text: choice.title,
                      //icon: new Icon(choice.icon),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
        // TabBarView是TabBar的第二部分，体里面展示的部分
        body: new TabBarView(
          controller: _tabController,
          // 通过map改格式
          children: choices.map((Choice choice) {
            return new Padding(
              padding: const EdgeInsets.all(16.0),
              //ChoiceCard里是具体体里面的card部分
              child: new ChoiceCard(choice: choice),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// 声明choice的数据格式，内部存在title和icon两个字段
class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

// 与上面这一部分一起用
// 这部分是body里显示的内容，平时写循环也能作为参考
const List<Choice> choices = const <Choice>[
// 一个Choice是一页的显示数据
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALK', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    // body图标文字效果
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // 我自己设定的文字效果，需要删除上面的TextStyle，效果见下图二
            //new Icon(choice.icon, size: 128.0, color: Colors.grey),
            //new Text(choice.title, style: TextStyle(color: Colors.blueGrey)),
            new Icon(choice.icon, size: 128.0, color: textStyle.color),
            new Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}

// main函数，一个App的起始部分
void main() {
  runApp(new AppBarBottomSample());
}
