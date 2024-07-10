import 'package:catch_world/cubits/core_controler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DataFilterWidget extends StatefulWidget{
  final Function() applyCommand;
  const DataFilterWidget({super.key,required this.applyCommand});
  @override
  State<DataFilterWidget> createState() => _DataFilterWidgetState();
}
class _DataFilterWidgetState extends State<DataFilterWidget>{
  @override
  Widget build(BuildContext context){
    return Container(
      height: 300.r,
      width: 300.r,
      decoration: BoxDecoration(
        color: coreControler.currentTheme.selected,
        borderRadius: BorderRadius.circular(25.r),
      ),
      padding: EdgeInsets.all(3.sp),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        decoration: BoxDecoration(
          color: coreControler.currentTheme.basic,
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25.h,),
            Text(
              'country',
              style: TextStyle(
                fontSize: 12.sp,
                color: coreControler.currentTheme.text,
              ),
            ),
            Expanded(
              child: DropdownButton(
                dropdownColor: coreControler.currentTheme.basic,
                iconSize: 24.sp,
                isExpanded: true,
                value: coreControler.country,
                hint: SizedBox(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'all',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: coreControler.currentTheme.text,
                      ),
                    ),
                  ),
                ),
                onChanged:(newValue){
                  setState(() {
                    coreControler.country = newValue;
                  });
                },
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem(
                    value: null,
                    child: SizedBox(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          'all',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: coreControler.currentTheme.text,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]+coreControler.countries.map((e) =>
                  DropdownMenuItem(
                    value: e,
                    child: SizedBox(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          e,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: coreControler.currentTheme.text,
                          ),
                        ),
                      ),
                    )
                  )
                ).toList(),
              )
            ),
            SizedBox(height: 15.h,),
            Text(
              'category',
              style: TextStyle(
                fontSize: 12.sp,
                color: coreControler.currentTheme.text,
              ),
            ),
            Expanded(
              child: DropdownButton(
                dropdownColor: coreControler.currentTheme.basic,
                iconSize: 24.sp,
                isExpanded: true,
                value: coreControler.category,
                hint: SizedBox(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'all',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: coreControler.currentTheme.text,
                      ),
                    ),
                  ),
                ),
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem(
                    value: null,
                    child: SizedBox(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          'all',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: coreControler.currentTheme.text,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]+coreControler.tabs.map((e) =>
                  DropdownMenuItem(
                    value: e,
                    child: SizedBox(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          e,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: coreControler.currentTheme.text,
                          ),
                        ),
                      ),
                    )
                  )
                ).toList(),
                onChanged:(value){
                  setState(() {
                    coreControler.category = value;
                  });
                },
              )
            ),
            SizedBox(height: 15.h,),
            Text(
              'language',
              style: TextStyle(
                fontSize: 12.sp,
                color: coreControler.currentTheme.text,
              ),
            ),
            Expanded(
             child: DropdownButton(
              dropdownColor: coreControler.currentTheme.basic,
              iconSize: 24.sp,
              isExpanded: true,
                value: coreControler.language,
                hint: SizedBox(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'all',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: coreControler.currentTheme.text,
                      ),
                    ),
                  ),
                ),
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem(
                    value: null,
                    child: SizedBox(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          'all',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: coreControler.currentTheme.text,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]+coreControler.languages.map((e) =>
                  DropdownMenuItem(
                    value: e,
                    child: SizedBox(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          e,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: coreControler.currentTheme.text,
                          ),
                        ),
                      ),
                    )
                  )
                ).toList(),
                onChanged:(value){
                  setState(() {
                    coreControler.language = value;
                  });
                },
              )
            ),
            SizedBox(height: 12.h,),
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: widget.applyCommand,
                  child: Container(
                    width: 50.w,
                    height: 25.w,
                    decoration: BoxDecoration(
                      color: coreControler.currentTheme.selected,
                      borderRadius: BorderRadius.circular(30.r)
                    ),
                    alignment: Alignment.center,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        'apply',
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      )
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h,)
          ],
        ),
      ),
    );
  }
}