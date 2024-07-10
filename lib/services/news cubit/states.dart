import 'package:catch_world/models/article_model.dart';
abstract class NewsState{}
class ReasponseState extends NewsState{
  final List<Article> _reasponse;
  ReasponseState(this._reasponse);
  List<Article> get reasponse => _reasponse;
}
class LoadingState extends NewsState{}