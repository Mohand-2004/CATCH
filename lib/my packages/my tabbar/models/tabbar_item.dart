class TabbarItem{
  late String _text;
  late Function() _command;
  late Function() _defaultCommand;
  TabbarItem({required String text,Function()? commad,Function()? defaultCommand}){
    _text = text;
    _command = commad ?? (){};
    _defaultCommand = defaultCommand ?? (){};
  }
  String get text => _text;
  Function() get command => _command;
  Function() get defaultCommand => _defaultCommand;
}