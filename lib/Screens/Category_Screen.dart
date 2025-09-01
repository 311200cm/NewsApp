import 'package:flutter/material.dart';
import 'package:newsapp/Cubit/news_cubit.dart';
import 'package:newsapp/Screens/Result_Screen.dart';

class CategoryScreen extends StatelessWidget {
   CategoryScreen({super.key});
  List<String>category=[
    "Technology",
    "Sport",
    "Business",
    "Health",
    "Science",
    "Entertinmate"
  ];
  List<IconData>icons=[
    Icons.biotech_outlined,
    Icons.sports_baseball_outlined,
    Icons.business_center_outlined,
    Icons.health_and_safety_outlined,
    Icons.science_outlined,
    Icons.tab_outlined,
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0,),
      child: GridView.builder(
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 45,
          ),
          itemBuilder:(context,index){
            return GestureDetector(
              onTap:() {
                var cubit=NewsCubit.get(context).GetResultData(category[index].toLowerCase());
                Navigator.push(context,
                  MaterialPageRoute(builder: (_)=>ResultScreen(title: category[index],))
                );
              },
              child:MyCategory(title: category[index], icon: icons[index]) ,
            );
          },
         itemCount: 6,
      ),
    );
  }
 Widget MyCategory({
    required String title,
   required IconData icon,
}){
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          Icon(icon,size: 50,color: Colors.black,),
          Text(title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
          )
        ],
      ),
    );
 }
}
