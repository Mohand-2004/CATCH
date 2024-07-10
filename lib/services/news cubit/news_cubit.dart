import 'package:catch_world/services/news%20cubit/states.dart';
import 'package:catch_world/models/article_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class NewsServiceCubit extends Cubit<NewsState>{
  NewsServiceCubit() : super(LoadingState());
  void getgeneralnews() async {
    emit(LoadingState());
    var response = await Dio().get('https://newsdata.io/api/1/news?apikey=pub_30614db5097a49222e9d8b1c8ed3dcb7dcb64&language=ar,en&country=eg');
    List<Article> articles = [];
    for(var article in response.data['results']){
      if (Article.fromNewsdataJson(article).valid()){
        articles.add(Article.fromNewsdataJson(article));
      }
    }
    emit(ReasponseState(articles));
  }
  void searchnews(String q) async {
    if(q == ' '){
      q = 'a';
    }
    emit(LoadingState());
    List<Article> articles = [];
    var response = await Dio().get('https://newsapi.org/v2/everything?q=$q&apiKey=9f09c234896844a5bcf0c977de01014d&sortBy=relevancy');
    for (var element in response.data["articles"]) {
      if (Article.fromNewsapiJson(element).valid()){
                if (Article.fromNewsapiJson(element).valid()){
          articles.add(Article.fromNewsapiJson(element));
        }
      }
    }
    emit(ReasponseState(articles));
  }
  void gettrendingnews({String? country,String? category,String? language}) async {
    category ??= 'a';
    emit(LoadingState());
    List<Article> articles = [];
    if(category == 'a' && language == null && country == null){
      var response =  await Dio().get('https://newsapi.org/v2/top-headlines?apiKey=9f09c234896844a5bcf0c977de01014d&q=a');
      for (var element in response.data["articles"]){
        if (Article.fromNewsapiJson(element).valid()){
        if (Article.fromNewsapiJson(element).valid()){
          articles.add(Article.fromNewsapiJson(element));
        }
        }
      }

      var response2 =  await Dio().get('https://newsdata.io/api/1/latest?apikey=pub_30614db5097a49222e9d8b1c8ed3dcb7dcb64&q=a');
      for (var element in response2.data["results"]){
        if (Article.fromNewsdataJson(element).valid()){
        if (Article.fromNewsdataJson(element).valid()){
          articles.add(Article.fromNewsdataJson(element));
        }
        }
      }
    }
    else{
      if(country != null && category == 'a' && language == null){
        var response =  await Dio().get('https://newsapi.org/v2/top-headlines?apiKey=9f09c234896844a5bcf0c977de01014d&country=$country');
        for (var element in response.data["articles"]){
          if (Article.fromNewsapiJson(element).valid()){
            articles.add(Article.fromNewsapiJson(element));
          }
        }

        var response2 =  await Dio().get('https://newsdata.io/api/1/latest?apikey=pub_30614db5097a49222e9d8b1c8ed3dcb7dcb64&country=$country');
        for (var element in response2.data["results"]){
          if (Article.fromNewsdataJson(element).valid()){
            articles.add(Article.fromNewsdataJson(element));
          }
        }
      }
      else if(country == null && category != 'a' && language == null){
        var response =  await Dio().get('https://newsapi.org/v2/top-headlines?apiKey=9f09c234896844a5bcf0c977de01014d&category=$category');
        for (var element in response.data["articles"]){
          if (Article.fromNewsapiJson(element).valid()){
            articles.add(Article.fromNewsapiJson(element));
          }
        }

        var response2 =  await Dio().get('https://newsdata.io/api/1/latest?apikey=pub_30614db5097a49222e9d8b1c8ed3dcb7dcb64&category=$category');
        for (var element in response2.data["results"]){
          if (Article.fromNewsdataJson(element).valid()){
            articles.add(Article.fromNewsdataJson(element));
          }
        }
      }
      else if(country == null && category == 'a' && language != null){
        var response =  await Dio().get('https://newsapi.org/v2/top-headlines?apiKey=9f09c234896844a5bcf0c977de01014d&language=$language');
        for (var element in response.data["articles"]){
          if (Article.fromNewsapiJson(element).valid()){
            articles.add(Article.fromNewsapiJson(element));
          }
        }
        var response2 =  await Dio().get('https://newsdata.io/api/1/latest?apikey=pub_30614db5097a49222e9d8b1c8ed3dcb7dcb64&language=$language');
          for (var element in response2.data["results"]){
            if (Article.fromNewsdataJson(element).valid()){
              articles.add(Article.fromNewsdataJson(element));
            }
          }
      }
      else{
        if(country != null && category != 'a' && language == null){
          var response =  await Dio().get('https://newsapi.org/v2/top-headlines?apiKey=9f09c234896844a5bcf0c977de01014d&country=$country&category=$category');
          for (var element in response.data["articles"]){
            if (Article.fromNewsapiJson(element).valid()){
              articles.add(Article.fromNewsapiJson(element));
            }
          }

          var response2 =  await Dio().get('https://newsdata.io/api/1/latest?apikey=pub_30614db5097a49222e9d8b1c8ed3dcb7dcb64&country=$country&category=$category');
          for (var element in response2.data["results"]){
            if (Article.fromNewsdataJson(element).valid()){
              articles.add(Article.fromNewsdataJson(element));
            }
          }
        }
        else if(country != null && category == 'a' && language != null){
          var response =  await Dio().get('https://newsapi.org/v2/top-headlines?apiKey=9f09c234896844a5bcf0c977de01014d&country=$country&language=$language');
          for (var element in response.data["articles"]){
            if (Article.fromNewsapiJson(element).valid()){
              articles.add(Article.fromNewsapiJson(element));
            }
          }

          var response2 =  await Dio().get('https://newsdata.io/api/1/latest?apikey=pub_30614db5097a49222e9d8b1c8ed3dcb7dcb64&country=$country&language=$language');
          for (var element in response2.data["results"]){
            if (Article.fromNewsdataJson(element).valid()){
              articles.add(Article.fromNewsdataJson(element));
            }
          }
        }
        else if(country == null && category != 'a' && language != null){
          var response =  await Dio().get('https://newsapi.org/v2/top-headlines?apiKey=9f09c234896844a5bcf0c977de01014d&category=$category&language=$language');
          for (var element in response.data["articles"]){
            if (Article.fromNewsapiJson(element).valid()){
              articles.add(Article.fromNewsapiJson(element));
            }
          }

          var response2 =  await Dio().get('https://newsdata.io/api/1/latest?apikey=pub_30614db5097a49222e9d8b1c8ed3dcb7dcb64&category=$category&language=$language');
          for (var element in response2.data["results"]){
            if (Article.fromNewsdataJson(element).valid()){
              articles.add(Article.fromNewsdataJson(element));
            }
          }
        }
        else{
          var response =  await Dio().get('https://newsapi.org/v2/top-headlines?apiKey=9f09c234896844a5bcf0c977de01014d&category=$category&language=$language&country=$country');
          for (var element in response.data["articles"]){
            if (Article.fromNewsapiJson(element).valid()){
              articles.add(Article.fromNewsapiJson(element));
            }
          }

          var response2 =  await Dio().get('https://newsdata.io/api/1/latest?apikey=pub_30614db5097a49222e9d8b1c8ed3dcb7dcb64&category=$category&language=$language&country=$country');
          for (var element in response2.data["results"]){
            if (Article.fromNewsdataJson(element).valid()){
              articles.add(Article.fromNewsdataJson(element));
            }
          }
        }
      }
    }
    var response =  await Dio().get('https://newsapi.org/v2/everything?sortBy=popularity&apiKey=9f09c234896844a5bcf0c977de01014d&q=$category');
    for (var element in response.data["articles"]){
      if (Article.fromNewsapiJson(element).valid()){
        articles.add(Article.fromNewsapiJson(element));
      }
    }
    emit(ReasponseState(articles));
  }
  void getcategoriesnews([String category = "world"]) async {
    emit(LoadingState());
    dynamic response;
    if(category == 'Economic' || category == 'Arts'){
      response = await Dio().get('https://newsdata.io/api/1/news?apikey=pub_30614db5097a49222e9d8b1c8ed3dcb7dcb64&language=ar,en&q=$category');
    }
    else{
      response = await Dio().get('https://newsdata.io/api/1/news?apikey=pub_30614db5097a49222e9d8b1c8ed3dcb7dcb64&language=ar,en&category=$category');
    }
    List<Article> articles = [];
    for (var element in response.data['results']){
      articles.add(Article.fromNewsdataJson(element));
    }
    emit(ReasponseState(articles));
  }
}