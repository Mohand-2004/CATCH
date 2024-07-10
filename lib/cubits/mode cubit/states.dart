import 'package:catch_world/models/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class ModeState{
  late final Icon _icon;
  late final ColorCollection _theme;
  ModeState({required IconData icon,required ColorCollection theme}){
    _icon = Icon(icon);
    _theme = theme;
  }
  Icon get icon => _icon;
  ColorCollection get theme => _theme;
}
