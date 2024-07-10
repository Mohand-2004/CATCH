import 'dart:io';

import 'package:catch_world/cubits/core_controler.dart';
import 'package:catch_world/cubits/mode%20cubit/mode_cubit.dart';
import 'package:catch_world/cubits/mode%20cubit/states.dart';
import 'package:catch_world/screens/article_content_screen.dart';
import 'package:catch_world/services/news%20cubit/news_cubit.dart';
import 'package:catch_world/services/news%20cubit/states.dart';
import 'package:catch_world/widgets/data_filter_widget.dart';
import 'package:catch_world/widgets/trending_countainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
it's prefered to use alert dialog instead of the stack and statefullWidget
but the showdialoge method dosen't work with small devices 
like old android phones and iPhone SE serius
so we use this method by wrapping the customscroll veiw with
a stack to contain the alert and the screen
*/

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});
  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen>{
  bool filterOn = false;
  @override
  Widget build(BuildContext context){
    return BlocBuilder<ModeCubit,ModeState>(
      builder: (context, state){
        // GestureDetector to pop the filter widget
        // when click outside it
        return GestureDetector(
          onTap: () {
            setState(() {
              filterOn = false;
            });
          },
          // main stack which contain the CustomScrollView (screen)
          // and the filterWidget
          child: RefreshIndicator.adaptive(
            color: coreControler.currentTheme.selected,
            backgroundColor: coreControler.currentTheme.basic,
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 1),(){
                coreControler.trendingNewsCubit.gettrendingnews();
              });
              setState((){
                coreControler.resetFilters();
                filterOn = false;
              });
            },
            child: Container(
              color: coreControler.currentTheme.basic,
              child: Stack(
                children: [
                  // this CustomScrollView is cosideard as the main screen
                  CustomScrollView(
                    slivers: [
                      // trending and filters row
                      SliverToBoxAdapter(
                        child: Container(
                          color: coreControler.currentTheme.basic,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 13.w),
                            child: Row(
                              children: [
                                // trending and most popular column
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Trending',
                                      style: TextStyle(
                                        color: coreControler.currentTheme.text,
                                        fontSize: 32.r,
                                        fontFamily: 'impact',
                                      ),
                                    ),
                                    Text(
                                      'most popular news on the world',
                                      style: TextStyle(
                                        color:coreControler.currentTheme.subText,
                                        fontSize: 16.r,
                                      ),
                                    )
                                  ],
                                ),
            
                                // space between
                                const Spacer(),
            
                                // filters button
                                Container(
                                  width: 47.r,
                                  height: 47.r,
                                  padding: EdgeInsets.all(3.sp),
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(13.r)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: coreControler.currentTheme.basic,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: IconButton(
                                        onPressed: (){
                                          setState((){
                                            filterOn = !filterOn;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.tune,
                                          size: 30.sp,
                                          color: coreControler.currentTheme.text,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
            
                      // space between the filters section and the listVeiw
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 20.h,
                        ),
                      ),
            
                      // articls listVeiw
                      SliverToBoxAdapter(
                        child: Container(
                          color: coreControler.currentTheme.basic,
                          child: BlocProvider(
                            create: (context) => coreControler.trendingNewsCubit,
                            child: SizedBox(
                              child: BlocBuilder<NewsServiceCubit, NewsState>(
                                builder: (context, state){
                                  if (state is ReasponseState){
                                    return ListView.builder(
                                      itemBuilder: (context, index){
                                        if (index < state.reasponse.length){
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) {
                                                return ArticleContentScreen(url: state.reasponse[index].url??'');
                                              },));
                                            },
                                            child: TerndingContainer(
                                              index: index,
                                              image: state.reasponse[index].image!,
                                              headline:state.reasponse[index].title ??'',
                                              description: state.reasponse[index].description ??'',
                                            ),
                                          );
                                        }
                                        else{
                                          return SizedBox(
                                            height: 80.h,
                                          );
                                        }
                                      },
                                      itemCount: state.reasponse.length + 1,
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                    );
                                  }
                                  else{
                                    // this sizedBox is used to center the loading indicator
                                    return SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.68,
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
                          ),
                        ),
                      ),
                    ],
                  ),
            
                  // filters widget
                  // if filterOn put it else put a SizedBox()
                  filterOn ? Positioned(
                    left: 50.w,
                    right: 50.w,
                    top: 90.h,
                    bottom: 200.h,
                    child: DataFilterWidget(
                      applyCommand: (){
                        coreControler.trendingNewsCubit.gettrendingnews(category: coreControler.category,country: coreControler.getCountryCode(coreControler.country),language: coreControler.getLanguageCode(coreControler.language));
                        setState((){
                          filterOn = false;
                        });
                      },
                    ),
                  ) : const SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
