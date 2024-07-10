import 'package:catch_world/cubits/core_controler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TerndingContainer extends StatelessWidget{
  final int index;
  final ImageProvider image;
  final String? headline;
  final String? description;
  const TerndingContainer({required this.index,super.key,this.description,this.headline,required this.image});
  String getSuffex(int index){
    switch(index){
      case 1:
        return 'st';
      case 2:
        return 'nd';
      default:
        return 'th';
    }
  }
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Divider(
          color: Colors.grey,
          thickness: 3.sp,
          indent: 50.w,
          endIndent: 50.w,
          height: 1,
        ),
        Container(
          height: 190.w,
          margin: EdgeInsets.symmetric(vertical: 4.h,horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Text(
                  '# ${index+1}${getSuffex(index+1)}',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontFamily: 'impact',
                    color: coreControler.currentTheme.text,
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 32,
                        child: SizedBox(
                          child: Column(
                            children: [
                              const Spacer(flex: 20,),
                              Container(
                                height: 105.w,
                                decoration: BoxDecoration(
                                  color: coreControler.currentTheme.selected,
                                  borderRadius: BorderRadius.circular(15.r)
                                ),
                                padding: EdgeInsets.all(3.sp),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: coreControler.currentTheme.basic,
                                    borderRadius: BorderRadius.circular(12.r),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: image,
                                    ),
                                  ),
                                ),
                              ),
                  
                              const Spacer(flex: 80,),
                            ],
                          ),
                        )
                      ),
                  
                      Expanded(
                        flex: 68,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 12.w),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 40,
                                child: SizedBox(
                                  child: Text(
                                    '$headline',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: coreControler.currentTheme.text,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                )
                              ),
                  
                              Expanded(
                                flex: 60,
                                child: SizedBox(
                                  child: Text(
                                    '$description',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: coreControler.currentTheme.subText,
                                    ),
                                  ),
                                )
                              ),
                            ],
                          ),
                        )
                      ),
                    ],
                  ),
                )
              )
            ],
          ),
        ),
      ],
    );
  }
}