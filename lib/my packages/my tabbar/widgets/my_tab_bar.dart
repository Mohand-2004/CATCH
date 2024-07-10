import 'package:catch_world/cubits/core_controler.dart';
import 'package:catch_world/my%20packages/my%20tabbar/models/tabbar_item.dart';
import 'package:catch_world/my%20packages/my%20tabbar/models/tabbar_item_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MyTabBar extends StatefulWidget{
  final double? height;
  final double? tabWidth;
  final TabbarItemTheme theme;
  final List<TabbarItem> items;
  final double? fontSize;
  const MyTabBar({super.key,this.height,this.tabWidth = 100,required this.theme,required this.items,this.fontSize = 20});
  @override
  State<MyTabBar> createState() => _MyTabBarState();
}
int currentIndex = -1;
class _MyTabBarState extends State<MyTabBar>{
  @override
  Widget build(BuildContext context){
    return Container(
      color: coreControler.currentTheme.basic,
      height: widget.height,
      child: ListView.builder(
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              if(currentIndex != index){
                setState((){
                  currentIndex = index;
                  widget.items[index].command();
                });
              }
              else{
                setState(() {
                  currentIndex = -1;
                  widget.items[index].defaultCommand();
                });
              }
            },
            child: Row(
              children: [
                Container(
                  width: widget.tabWidth,
                  decoration: BoxDecoration(
                    color: currentIndex == index ? widget.theme.selectedColor : widget.theme.unSelectedColor,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  padding: EdgeInsets.all(3.r),
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.theme.backgroundColor,
                      borderRadius: BorderRadius.circular(47)
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        widget.items[index].text,
                        style: TextStyle(
                          color: currentIndex == index ? widget.theme.selectedColor : widget.theme.unSelectedColor,
                          fontWeight: FontWeight.bold,
                          fontSize: widget.fontSize
                        ),
                      ),
                    ),
                  ),
                ),
    
                // space between the tabs
                const SizedBox(width: 8,)
              ],
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}