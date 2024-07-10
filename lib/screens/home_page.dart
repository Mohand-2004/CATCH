import 'dart:io';
import 'package:catch_world/cubits/core_controler.dart';
import 'package:catch_world/cubits/mode%20cubit/mode_cubit.dart';
import 'package:catch_world/cubits/mode%20cubit/states.dart';
import 'package:catch_world/services/news%20cubit/news_cubit.dart';
import 'package:catch_world/services/news%20cubit/states.dart';
import 'package:catch_world/my%20packages/my%20tabbar/models/tabbar_item.dart';
import 'package:catch_world/my%20packages/my%20tabbar/models/tabbar_item_theme.dart';
import 'package:catch_world/my%20packages/my%20tabbar/widgets/my_tab_bar.dart';
import 'package:catch_world/widgets/mobile_list_veiw.dart';
import 'package:catch_world/widgets/tablet_grid_veiw.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModeCubit, ModeState>(
      builder: (context, state){
        return RefreshIndicator.adaptive(
          color: coreControler.currentTheme.selected,
          backgroundColor: coreControler.currentTheme.basic,
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1),(){
              coreControler.homeNewsCubit.getgeneralnews();
            });
            setState((){
              currentIndex = -1;
            });
          },
          child: Container(
            color: coreControler.currentTheme.basic,
            child: BlocProvider(
              create: (context) => coreControler.homeNewsCubit,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                    child: BlocBuilder<NewsServiceCubit, NewsState>(
                      builder: (context, state) {
                        return MyTabBar(
                            height: 40 + 4.h,
                            tabWidth: 110 + 20.w,
                            theme: TabbarItemTheme(
                              selectedColor:
                                  coreControler.currentTheme.selected,
                              unSelectedColor:
                                  const Color.fromARGB(255, 185, 186, 188),
                              backgroundColor: coreControler.currentTheme.basic,
                            ),
                            items: coreControler.tabs
                                .map((tab) => TabbarItem(
                                      text: tab,
                                      commad: () {
                                        coreControler.homeNewsCubit
                                            .getcategoriesnews(tab);
                                      },
                                      defaultCommand: () {
                                        coreControler.homeNewsCubit
                                            .getgeneralnews();
                                      },
                                    ))
                                .toList());
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: coreControler.currentTheme.basic,
                      child: BlocBuilder<NewsServiceCubit, NewsState>(
                        builder: (context, state) {
                          if (state is ReasponseState) {
                            if (MediaQuery.of(context).size.width >= 500) {
                              return TabletGridVeiw(articles: state.reasponse);
                            } else {
                              return MobileListVeiw(
                                articles: state.reasponse,
                              );
                            }
                          } else {
                            return Center(
                              child: Platform.isIOS
                                  ? CupertinoActivityIndicator(
                                      color:
                                          coreControler.currentTheme.selected,
                                      radius: 15.r,
                                    )
                                  : CircularProgressIndicator(
                                      color:
                                          coreControler.currentTheme.selected,
                                    ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
