import 'package:flutter/material.dart';
class ColorCollection{
  late Color _basic;
  late Color _selected;
  late Color _navigationSelection;
  late Color _text;
  late Color _subText;
  ColorCollection({required Color basic,required Color selected,required Color navigationSelection,required Color text,required Color subText}){
    _basic = basic;
    _selected = selected;
    _navigationSelection = navigationSelection;
    _text = text;
    _subText = subText;
  }
  Color get basic => _basic;
  Color get selected => _selected;
  Color get navigationSelection => _navigationSelection;
  Color get text => _text;
  Color get subText => _subText;
}
class AppThemes{
  static ColorCollection hellTheme = ColorCollection(basic: Colors.white, selected: const Color(0xff24b372),navigationSelection: const Color.fromARGB(255, 31, 156, 100),text: Colors.black,subText: const Color.fromARGB(255, 68, 68, 68));
  static ColorCollection darkTheme = ColorCollection(basic: const Color(0xff404040), selected: Colors.white,navigationSelection: Colors.white,text: Colors.white,subText: const Color.fromARGB(255, 173, 173, 173));
}