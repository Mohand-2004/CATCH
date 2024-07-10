import 'package:catch_world/cubits/core_controler.dart';
import 'package:catch_world/screens/root_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: BlocProvider(
        create: (context) => coreControler.modeCubit,
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: RootScreen()
        ),
      ),
    );
  }
}

void main() {
  runApp(const App());
  //runApp(DevicePreview(builder: (context) => const App()));
}
