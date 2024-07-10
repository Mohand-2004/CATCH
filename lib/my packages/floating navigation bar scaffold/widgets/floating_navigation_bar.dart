import 'package:catch_world/cubits/core_controler.dart';
import 'package:catch_world/my%20packages/floating%20navigation%20bar%20scaffold/models/navigation_item_theme.dart';
import 'package:catch_world/my%20packages/floating%20navigation%20bar%20scaffold/navigation%20cubit/navigation_cubit.dart';
import 'package:catch_world/my%20packages/floating%20navigation%20bar%20scaffold/widgets/navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class FloatingNavigationBar extends StatefulWidget{
  final double? totalWidth;
  final double? totalHeight;
  final int barFlex;
  final int spaceFlex;
  final int defaultIndex;
  final List<NavigationItem> items;
  const FloatingNavigationBar({super.key,this.totalHeight,required this.barFlex,required this.spaceFlex,required this.items,required this.defaultIndex,this.totalWidth = double.infinity});
  @override
  State<FloatingNavigationBar> createState() => _FloatingNavigationBarState();
}
class _FloatingNavigationBarState extends State<FloatingNavigationBar>{
  late int currentIndex;
  @override
  void initState() {
    currentIndex = widget.defaultIndex;
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return SizedBox(
      child: Column(
        children: [
          // free top space
          const Spacer(),
      
          // navigation bar
          SizedBox(
            height: widget.totalHeight,
            width: widget.totalWidth,
            // bar and bottom space column
            child: Column(
              children: [
                // navigation bar widget
                Expanded(
                  flex: widget.barFlex,
                  child: Container(
                    decoration: BoxDecoration(
                      color: coreControler.currentTheme.navigationSelection,
                      borderRadius: BorderRadius.circular(50.r)
                    ),
                    padding: EdgeInsets.all(3.sp),
                    child: Container(
                      decoration: BoxDecoration(
                        color: coreControler.currentTheme.basic,
                        borderRadius: BorderRadius.circular(47.r)
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: widget.items.map((item) => 
                        Expanded(
                          child: NavigationCommandItem(
                            icon: item.icon,
                            text: item.text,
                            command: (){
                              if(currentIndex != item.index){
                                setState((){
                                  currentIndex = item.index;
                                  coreControler.currentScreenIndex = currentIndex;
                                  BlocProvider.of<NavigationCubit>(context).push(currentIndex);
                                });
                              }
                            },
                            theme: currentIndex == item.index ? NavigationItemTheme().activeTheme : NavigationItemTheme().defaultTheme,
                            )
                          )
                        ).toList()
                      ),
                    ),
                  ),
                ),
      
                // bottom space
                Expanded(
                  flex: widget.spaceFlex,
                  child: const SizedBox(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}