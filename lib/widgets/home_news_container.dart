import 'package:catch_world/cubits/core_controler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
class HomeNewsContainer extends StatelessWidget{
  final String headline;
  final String subtitle;
  final ImageProvider image;
  final int fontSize;
  const HomeNewsContainer({required this.headline,required this.subtitle,required this.image,this.fontSize = 20,super.key});
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.h,vertical: 8.h),
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).width*0.88,
      color: coreControler.currentTheme.basic,
      padding: const EdgeInsets.all(6),
      child: Center(
        child: Column(
          children:[
            Expanded(
              flex: 70,
              child: Container(
                padding: EdgeInsets.all(3.sp),
                decoration: BoxDecoration(
                  color: coreControler.currentTheme.navigationSelection,
                  borderRadius: BorderRadius.circular(30.r)
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: coreControler.currentTheme.basic,
                    borderRadius: BorderRadius.circular(27.r),
                    image: DecorationImage(
                      image: image,
                      fit: BoxFit.fill
                    )
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 30,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(top: 8.h,left: 10.w,right: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text(
                        headline,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: fontSize.sp,
                          fontWeight: FontWeight.bold,
                          color: coreControler.currentTheme.text
                        ),
                      ),
                    const SizedBox(height: 2),
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            subtitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: (fontSize-4).sp,
                              color: coreControler.currentTheme.subText
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}