import 'package:catch_world/my%20packages/floating%20navigation%20bar%20scaffold/navigation%20cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class NavigationCubit extends Cubit<NavigationState>{
  int initIndex;
  NavigationCubit({required this.initIndex}) : super(NavigationState(screenIndex: initIndex));
  void push(int screenIndex){
    emit(NavigationState(screenIndex: screenIndex));
  }
}