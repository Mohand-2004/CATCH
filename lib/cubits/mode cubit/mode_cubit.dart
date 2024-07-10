import 'package:catch_world/cubits/mode%20cubit/states.dart';
import 'package:catch_world/models/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ModeCubit extends Cubit<ModeState>{
  bool indicator = true;
  ModeCubit() : super(ModeState(icon: Icons.dark_mode_rounded,theme: AppThemes.hellTheme));
  @override
  void emit(ModeState state) {
    if(!isClosed){
      super.emit(state);
    }
  }
  void switchMode(){
    indicator ? emit(ModeState(icon: Icons.dark_mode_rounded,theme: AppThemes.hellTheme)) : emit(ModeState(icon: Icons.sunny, theme: AppThemes.darkTheme));
    indicator = !indicator;
  }
}