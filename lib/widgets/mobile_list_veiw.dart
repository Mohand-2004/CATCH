import 'package:catch_world/models/article_model.dart';
import 'package:catch_world/screens/article_content_screen.dart';
import 'package:catch_world/widgets/home_news_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MobileListVeiw extends StatelessWidget{
  final List<Article> articles;
  const MobileListVeiw({super.key,required this.articles});
  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemBuilder: (context,index){
        if(index < articles.length){
          return GestureDetector(
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) {
                return ArticleContentScreen(url: articles[index].url??'');
              },));
            },
            child: HomeNewsContainer(
              headline: articles[index].title ?? '',
              subtitle: articles[index].description ?? '',
              image: articles[index].image!,
            ),
          );
        }
        else{
          return SizedBox(height: 70.h,);
        }
      },
      itemCount: articles.length+1,
      physics: const BouncingScrollPhysics(),
    );
  }
}
