import 'package:catch_world/cubits/core_controler.dart';
import 'package:catch_world/models/article_model.dart';
import 'package:catch_world/screens/article_content_screen.dart';
import 'package:catch_world/widgets/home_news_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TabletGridVeiw extends StatelessWidget{
  final List<Article> articles;
  const TabletGridVeiw({super.key, required this.articles});
  @override
  Widget build(BuildContext context){
    return CustomScrollView(
      slivers: [
        // articls gridVeiw
        SliverToBoxAdapter(
          child: Container(
            color: coreControler.currentTheme.basic,
            child: SizedBox(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context,index){
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
                      fontSize: 12,
                    ),
                  );
                },
                itemCount: articles.length,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
              ),
            ),
          ),
        ),

        // bottom space to avoid last article disappearing
        SliverToBoxAdapter(
          child: SizedBox(height: 80.h,),
        )
      ],
    );
  }
}