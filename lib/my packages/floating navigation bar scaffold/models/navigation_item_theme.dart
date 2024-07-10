import 'package:catch_world/cubits/core_controler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class NavigationTheme{
  double? _iconSize;
  double? _textSize;
  late Color _iconColor;
  late Color _textColor;
  NavigationTheme({required double iconSize,required double textSize,required Color iconColor,required Color textColor}){
    _textSize = textSize;
    _iconSize = iconSize;
    _iconColor = iconColor;
    _textColor = textColor;
  }
  double? get iconSize => _iconSize;
  double? get textSize => _textSize;
  Color get iconColor => _iconColor;
  Color get textColor => _textColor;
}
class NavigationItemTheme{
  NavigationTheme activeTheme = NavigationTheme(
    iconSize: 32.r,
    textSize: 10.sp,
    iconColor: coreControler.currentTheme.navigationSelection,
    textColor: coreControler.currentTheme.navigationSelection,
  );
  NavigationTheme defaultTheme = NavigationTheme(
    iconSize: 22.r,
    textSize: 8.sp,
    iconColor: Colors.grey,
    textColor: Colors.grey,
  );
}