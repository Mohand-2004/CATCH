import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
class TabbarItemTheme{
  late Color _selectedColor;
  late Color _unSelectedColor;
  late Color _backgroundColor;
  TabbarItemTheme({required Color selectedColor,required Color unSelectedColor,required Color backgroundColor}){
    _selectedColor = selectedColor;
    _unSelectedColor = unSelectedColor;
    _backgroundColor = backgroundColor;
  }
  Color get selectedColor => _selectedColor;
  Color get unSelectedColor => _unSelectedColor;
  Color get backgroundColor => _backgroundColor;
}