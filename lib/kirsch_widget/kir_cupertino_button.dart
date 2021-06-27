import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//todo 实现自定义的通用CupertinoButton Icon onPressed color size

Widget kirCupertinoButton(Widget child) {
  return Theme(
    data: ThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    ),
    child: child,
  );
}

//todo 可参照demo
class GradientButton extends StatelessWidget {
  GradientButton({
    this.colors, //渐变颜色数组
    this.width, //按钮宽度
    this.height, //按钮高度
    this.onTap, // 按钮点击事件
    this.begin, //渐变开始的方向
    this.end, //渐变结束
    this.radius, //按钮圆角
    @required this.child,
  });

  // 渐变色数组
  final List<Color> colors;
  // 按钮宽高
  final double width;
  final double height;
  final Widget child;
  //添加颜色渐变方向
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  //添加按钮圆角
  final double radius;
  //点击回调
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Color> _colors = colors ?? [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];
    AlignmentGeometry _begin = begin ?? Alignment.centerLeft;
    AlignmentGeometry _end = end ?? Alignment.centerRight;
    print(radius);

    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: _colors, begin: _begin, end: _end),
          borderRadius: BorderRadius.circular(radius)),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: colors.last,
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(0.0),
                child: DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.bold), child: child),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
