import 'package:catch_world/cubits/core_controler.dart';
import 'package:catch_world/my%20packages/floating%20navigation%20bar%20scaffold/models/floating_navigation_bar_style.dart';
import 'package:catch_world/my%20packages/floating%20navigation%20bar%20scaffold/navigation%20cubit/navigation_cubit.dart';
import 'package:catch_world/my%20packages/floating%20navigation%20bar%20scaffold/navigation%20cubit/states.dart';
import 'package:catch_world/my%20packages/floating%20navigation%20bar%20scaffold/widgets/floating_navigation_bar.dart';
import 'package:catch_world/my%20packages/floating%20navigation%20bar%20scaffold/widgets/navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloatingNavigationBarScaffold extends StatelessWidget {
  final List<Widget> tabs;
  final List<NavigationItem> navigationItems;
  final PreferredSizeWidget? appBar;
  final int defaultIndex;
  late final FloatingNavigationBarStyle floatingNavigationBarStyle;
  final List<bool> appbarStates = [];
  FloatingNavigationBarScaffold(
    {
      super.key,
      required this.navigationItems,
      required this.tabs,
      this.appBar,
      this.defaultIndex = 1,
      FloatingNavigationBarStyle? floatingNavigationBarStyle
    }){
    floatingNavigationBarStyle ??= FloatingNavigationBarStyle();
    // ignore: prefer_initializing_formals
    this.floatingNavigationBarStyle = floatingNavigationBarStyle;
    for(NavigationItem item in navigationItems){
      appbarStates.add(item.activeAppbar);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: coreControler.currentTheme.basic,
      body: BlocProvider(
        create: (context) => NavigationCubit(initIndex: defaultIndex),
        child: Stack(children: [
          // bloc builder listens to navigation cubit
          // to push the current screen by navigation bar
          BlocBuilder<NavigationCubit,NavigationState>(
            builder: (context, state){
              return Scaffold(
                appBar: appbarStates[state.screenIndex] ? appBar : null,

                // scaffold body which contain the current tab
                body: IndexedStack(
                  index: state.screenIndex,
                  children: tabs,
                )
              );
            },
          ),

          // floating navigation bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: FloatingNavigationBar(
              defaultIndex: defaultIndex,
              items: navigationItems,
              totalHeight: floatingNavigationBarStyle.totalHeight,
              barFlex: floatingNavigationBarStyle.barFlex,
              spaceFlex: floatingNavigationBarStyle.spaceFlex,
            ),
          ),
        ]),
      ),
    );
  }
}
