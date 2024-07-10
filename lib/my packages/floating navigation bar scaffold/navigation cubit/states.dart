class NavigationState{
  late int _screenIndex;
  NavigationState({required int screenIndex}){
    _screenIndex = screenIndex;
  }
  int get screenIndex => _screenIndex;
}