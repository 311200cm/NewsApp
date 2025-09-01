import 'package:flutter/material.dart';
import 'package:newsapp/Api/News_Model.dart';
import 'package:newsapp/Const/Constant.dart';
import 'package:url_launcher/url_launcher.dart';

class SharedCard extends StatelessWidget {
  Articles articles;
   SharedCard({super.key,required this.articles});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        if (!await launchUrl(Uri.parse(articles.url!))) {
          throw Exception('Could not launch ${articles.url!}');
        }
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(articles.title??"No Title",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              
              Text(articles.description??"No Description",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(articles.urlToImage??templetImage,
                  fit: BoxFit.cover,
                ),
              ),
              Text(articles.author??"UnKnown",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
