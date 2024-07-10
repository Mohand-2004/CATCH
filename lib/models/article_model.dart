import 'package:flutter/widgets.dart';
class Article{
  String? title;
  String? description;
  ImageProvider? image;
  String? url;
  Article({this.title,imageurl,this.description,this.url}){
    if(imageurl == null){
      image = const AssetImage('assets/images/no image.png');
    }
    else{
      try{
        image = NetworkImage(imageurl);
      }
      catch(e){
        image = const AssetImage('assets/images/no image.png');
      }
    }
  }
  bool valid() => !(title == '[Removed]');
  factory Article.fromNewsapiJson(Map json){
    return Article(title: json["title"],description: json["description"],imageurl: json["urlToImage"],url: json["url"]);
  }
  factory Article.fromNewsdataJson(Map json){
    return Article(title: json["title"],description: json["description"],imageurl: json["image_url"],url: json["link"]);
  }
}