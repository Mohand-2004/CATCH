import 'package:catch_world/cubits/core_controler.dart';
import 'package:catch_world/cubits/mode%20cubit/mode_cubit.dart';
import 'package:catch_world/cubits/mode%20cubit/states.dart';
import 'package:catch_world/my%20packages/floating%20navigation%20bar%20scaffold/widgets/floating_navigation_bar_scaffold.dart';
import 'package:catch_world/my%20packages/floating%20navigation%20bar%20scaffold/models/floating_navigation_bar_style.dart';
import 'package:catch_world/my%20packages/floating%20navigation%20bar%20scaffold/widgets/navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io' show Platform;
class RootScreen extends StatelessWidget {
  const RootScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModeCubit,ModeState>(
      builder: (context, state){
        coreControler.currentTheme = state.theme;
        return FloatingNavigationBarScaffold(
          appBar: PreferredSize(
              preferredSize: Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * 0.1,
              ),
              child: Container(
                color: coreControler.currentTheme.basic,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // app logo and mode button row
                    Expanded(
                      child: Row(
                        children: [
                          // app logo image
                          Padding(
                            padding: EdgeInsets.only(top: 30, left: 15.w),
                            child: Image(
                              image: const AssetImage('assets/images/app bar icon.png'),
                              height: 45.h,
                            ),
                          ),

                          // space between
                          const Spacer(),

                          // hell mode and dark mode button
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Padding(
                              padding: EdgeInsets.only(top: 25, right: 5.w),
                              child: IconButton(
                                onPressed: (){
                                  coreControler.modeCubit.switchMode();
                                },
                                icon: state.icon,
                                iconSize: 38.r,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          navigationItems: [
            NavigationItem(
              text: 'Trending',
              icon: Icons.trending_up_rounded,
              index: 0,
            ),
            NavigationItem(
              text: 'Home',
              icon: Icons.home_rounded,
              index: 1,
            ),
            NavigationItem(
              text: 'Search',
              icon: Icons.search_rounded,
              index: 2,
              activeAppbar: false,
            ),
          ],
          tabs: [
            coreControler.appScreens.trending,
            coreControler.appScreens.home,
            coreControler.appScreens.search,
          ],
          defaultIndex: 1,
          floatingNavigationBarStyle: FloatingNavigationBarStyle(
            totalHeight: Platform.isIOS ? 90.h : 80.h,
            barFlex: Platform.isIOS ? 70 : 80,
            spaceFlex: Platform.isIOS ? 30 : 20,
          ),
        );
      },
    );
  }
}
