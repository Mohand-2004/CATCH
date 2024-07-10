import 'package:catch_world/my%20packages/floating%20navigation%20bar%20scaffold/models/navigation_item_theme.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class NavigationCommandItem extends StatelessWidget{
  String text;
  IconData icon;
  NavigationTheme theme;
  Function() command;
  NavigationCommandItem({super.key,required this.icon,required this.text,required this.theme,required this.command,});
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Expanded(
          flex: 60,
          child: IconButton(
            onPressed: command,
            icon: Icon(
              icon,
            ),
            iconSize: theme.iconSize,
            color: theme.iconColor,
          ),
        ),
        const SizedBox(height: 2,),
        Expanded(
          flex: 40,
          child: Text(
            text,
            style: TextStyle(
              fontSize: theme.textSize,
              color: theme.textColor
            ),
          ),
        ),
      ],
    );
  }
}

class NavigationItem{
  String text;
  IconData icon; 
  int index;
  bool activeAppbar;
  NavigationItem({required this.icon,required this.text,required this.index,this.activeAppbar = true});
}