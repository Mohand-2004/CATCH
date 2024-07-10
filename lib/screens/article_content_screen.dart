import 'dart:io';

import 'package:catch_world/cubits/core_controler.dart';
import 'package:catch_world/cubits/mode%20cubit/mode_cubit.dart';
import 'package:catch_world/cubits/mode%20cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleContentScreen extends StatefulWidget{
  final String url;
  const ArticleContentScreen({super.key,required this.url});

  @override
  State<ArticleContentScreen> createState() => _ArticleContentScreenState();
}

class _ArticleContentScreenState extends State<ArticleContentScreen> {
  final WebViewController controller = WebViewController();
  @override
  void initState() {
    controller.setJavaScriptMode(JavaScriptMode.disabled);
    controller.loadRequest(Uri.parse(widget.url));
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return BlocBuilder<ModeCubit,ModeState>(
      builder: (context, state){
        return Scaffold(
          backgroundColor: coreControler.currentTheme.basic,
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
                        // back arrow
                        Padding(
                          padding: EdgeInsets.only(top: 25,left: (Platform.isIOS ? 8.w : 5.w)),
                          child: IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                              color: Colors.grey,
                              size: 25.r,
                            )
                          ),
                        ),
                        // app logo image
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
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
                              onPressed: () {
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
            )
          ),
          body: WebViewWidget(controller: controller),
        );
      },
    );
  }
}
