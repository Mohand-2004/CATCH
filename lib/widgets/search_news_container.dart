import 'package:catch_world/cubits/core_controler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
class SearchNewsContainer extends StatelessWidget{
  final String headline;
  final String subtitle;
  final ImageProvider image;
  const SearchNewsContainer({required this.headline,required this.subtitle,required this.image,super.key});
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
      child: Column(
        children:[
          Row(
            children:[
              Container(
                padding: const EdgeInsets.all(3),
                width: 95.r,
                height: 95.r,
                decoration: BoxDecoration(
                  color: coreControler.currentTheme.selected,
                  borderRadius:BorderRadius.circular(20.r)
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: coreControler.currentTheme.basic,
                    borderRadius: BorderRadius.circular(17.r),
                    image: DecorationImage(image: image,fit: BoxFit.fill)
                  )
                )
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text(
                      headline,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: coreControler.currentTheme.text,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      subtitle,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: coreControler.currentTheme.subText,
                      ),
                    )
                  ]
                ),
              )
            ]
          ),
          SizedBox(
            width: double.infinity,
              child: Divider(
                height: 20,
                thickness: 3.sp,
                indent: 50,
                endIndent: 50,
                color: Colors.grey,
              ),
          )
        ]
      ),
    );
  }
}