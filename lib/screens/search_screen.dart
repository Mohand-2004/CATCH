import 'package:catch_world/cubits/core_controler.dart';
import 'package:catch_world/cubits/mode%20cubit/mode_cubit.dart';
import 'package:catch_world/cubits/mode%20cubit/states.dart';
import 'package:catch_world/services/news%20cubit/news_cubit.dart';
import 'package:catch_world/services/news%20cubit/states.dart';
import 'package:catch_world/widgets/search_news_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'article_content_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textcontroller = TextEditingController();
  int? currentindex = -1;
  String imagepath = 'assets/images/default.png';
  List<String> images = [
    'assets/images/istockphoto-1129575516-612x612.jpg',
    'assets/images/desk-3139127_1920-1200x773-1.jpg',
    'assets/images/images.jpeg',
    'assets/images/How-to-think-about-social-media-in-a-down-economy-Final.png',
    'assets/images/FoodGroupsLP_804x482.jpg',
    'assets/images/technology-and-us-scaled.jpg'
  ];
  List<Color?> colors(currentindex, index) {
    if (currentindex == index) {
      return [
        coreControler.currentTheme.text,
        coreControler.currentTheme.navigationSelection
      ];
    } else {
      return const [Color.fromARGB(255, 98, 98, 98), Colors.transparent];
    }
  }

  Color color(currentindex) {
    if (currentindex == 0 || currentindex == 4) {
      return Colors.white;
    } else if (currentindex == null || currentindex == 3) {
      return const Color.fromARGB(255, 53, 53, 53);
    } else {
      return Colors.black;
    }
  }

  double? size(String name) {
    if (name == 'Technology') {
      return 26;
    } else {
      return 28;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      color: coreControler.currentTheme.selected,
      backgroundColor: coreControler.currentTheme.basic,
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1), () {
          coreControler.searchNewsCubit.searchnews('a');
        });
        setState((){
          textcontroller.text = '';
          currentindex = -1;
          imagepath = 'assets/images/default.png';
        });
      },
      child: BlocBuilder<ModeCubit,ModeState>(
        builder: (context, state) {
          return Container(
            color: coreControler.currentTheme.basic,
            child: CustomScrollView(
              slivers: [
                // discover and search container
                SliverToBoxAdapter(
                  child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.615,
                      decoration: BoxDecoration(
                        color: coreControler.currentTheme.selected,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60.r),
                          bottomRight: Radius.circular(60.r),
                        ),
                      ),
                      padding: EdgeInsets.only(bottom: 3.sp, left: 3.sp, right: 3.sp),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(57.r),
                              bottomRight: Radius.circular(57.r),
                            ),
                            image: DecorationImage(
                              image: AssetImage(imagepath),
                              fit: BoxFit.fill,
                            ),
                          ),
                          padding: EdgeInsets.only(top: 40.h, left: 8.w, right: 8.w, bottom: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Discover",
                                style: TextStyle(
                                  fontSize: 50.sp,
                                  fontFamily: 'Impact',
                                  color: Colors.black,
                                ),
                              ),
                              const Spacer(flex: 1),
                              Text(
                                "Be Uptodate with the latest news",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: color(currentindex),
                                ),
                              ),
                              const Spacer(flex: 79),
                              SizedBox(
                                width: double.infinity,
                                child: Padding(padding: const EdgeInsets.symmetric(horizontal: 30),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(80.r),
                                    child: TextFormField(
                                      controller: textcontroller,
                                      onFieldSubmitted: (value) {
                                        coreControler.searchNewsCubit.searchnews(textcontroller.text);
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Search",
                                        filled: true,
                                        fillColor: const Color.fromARGB(255, 240, 239, 239),
                                        prefixIcon: IconButton(
                                          onPressed: () {
                                            coreControler.searchNewsCubit.searchnews(textcontroller.text);
                                          },
                                          icon: const Icon(Icons.search_rounded),
                                        ),
                                        hintStyle: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      onTapOutside: (event) {
                                        // pop the keyboard when foucus outside
                                        // as in iOS the keboard won't pop automaticly
                                        if(Platform.isIOS){
                                          FocusManager.instance.primaryFocus!.unfocus();
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(flex: 1)
                            ],
                          ))),
                ),
            
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 5,
                  ),
                ),
            
                // tabBar
                SliverToBoxAdapter(
                  child: Container(
                      height: 65,
                      width: double.infinity,
                      color: Colors.transparent,
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.all(5),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            color: coreControler.currentTheme.basic,
                            child: Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (currentindex == index) {
                                      coreControler.searchNewsCubit.searchnews('a');
                                      setState(() {
                                        currentindex = -1;
                                        imagepath = 'assets/images/default.png';
                                      });
                                    } else {
                                      coreControler.searchNewsCubit
                                          .searchnews(coreControler.tabs[index]);
                                      setState(() {
                                        currentindex = index;
                                        imagepath = images[index];
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    elevation: 0,
                                  ),
                                  child: Text(
                                    coreControler.tabs[index],
                                    style: TextStyle(
                                        fontSize: size(coreControler.tabs[index]),
                                        fontWeight: FontWeight.bold,
                                        color: colors(currentindex, index)[0]),
                                  ),
                                ),
                                Container(
                                  color: colors(currentindex, index)[1],
                                  width: 120,
                                  height: 5,
                                  child: const FittedBox(
                                    fit: BoxFit.contain,
                                    child: Divider(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        physics: const BouncingScrollPhysics(),
                        itemCount: coreControler.tabs.length,
                        scrollDirection: Axis.horizontal,
                      )),
                ),
            
                // search results listVeiw
                SliverToBoxAdapter(
                  child: BlocProvider(
                  create: (context) => coreControler.searchNewsCubit,
                  child: SizedBox(
                    child: BlocBuilder<NewsServiceCubit, NewsState>(
                      builder: (context, state) {
                        if (state is ReasponseState) {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) {
                                  return ArticleContentScreen(url: state.reasponse[index].url??'');
                                },));
                              },
                              child: SearchNewsContainer(
                                headline: state.reasponse[index].title ?? '',
                                subtitle:state.reasponse[index].description ?? '',
                                image: state.reasponse[index].image!),
                              );
                            },
                            itemCount: state.reasponse.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                          );
                        } else {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: Center(
                              child: Platform.isIOS ? CupertinoActivityIndicator(
                                color: coreControler.currentTheme.selected,
                                radius: 15.r,
                              ) : CircularProgressIndicator(
                                color: coreControler.currentTheme.selected,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                )),
              ],
            ),
          );
        },
      ),
    );
  }
}
