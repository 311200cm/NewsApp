import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:newsapp/Api/News_Model.dart';
import 'package:newsapp/Const/Constant.dart';
import 'package:newsapp/Cubit/news_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Screens/Shared_Card.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Breaking News",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if(state is GetTopHeadLineLoading){
            return Center(
                child: CircularProgressIndicator()
            );
          }
          else if(state is GetTopHeadLineError){
            return Center(
              child: Text(state.message!,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
              ),
            );
          }
          else{
            var cubit=NewsCubit.get(context);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CarouselSlider(
                      items:CardWidget(cubit.newsModel!.articles!),
                      options: CarouselOptions(
                        height: 200,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 4),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        onPageChanged: (index, reason) {},
                        scrollDirection: Axis.horizontal,
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text("Popular Now",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context,index){
                          return SharedCard(articles: cubit.newsModel!.articles![index]);
                        },
                        separatorBuilder: (context,index){
                          return SizedBox(
                            height: 20,
                          );
                        },
                        itemCount: cubit.newsModel!.articles!.length
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }

  List<Widget> CardWidget(List<Articles>articles) {
    List<Widget>news=[];
    if (articles.length<5){
      for(var element in articles){
        news.add(
           MyCard(element)
        );
      }
      return news;
    }
    
    else{
      for(int i=0 ; i< 5;i++){
        news.add(
           MyCard(articles[i])
        );
      }
      return news;
    }
  }
  Widget MyCard(Articles articles){
    return  ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Image.network(articles.urlToImage??templetImage,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:[
                    Colors.black.withOpacity(0.7),
                    //Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(articles.title??"Title",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(articles.description??"Description",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(articles.author??"UnKnown",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
