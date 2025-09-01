import 'package:flutter/material.dart';
import 'package:newsapp/Screens/Category_Screen.dart';
import 'package:newsapp/Screens/Home_Screen.dart';
import 'package:newsapp/Screens/Search_Screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {

  List<Widget>Screen=[
  HomeScreen(),
  CategoryScreen(),
  SearchScreen(),
  ];
  PageController pageController=PageController();
  int currentPage=0;
  @override
  void dispose(){
    super.dispose();
    pageController.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:PageView(
        controller: pageController,
        onPageChanged: (index){
          setState(() {
          });
          currentPage = index;
          //print(index);
        },
        scrollDirection: Axis.horizontal,
          children:Screen
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap:(index){
          setState(() {
          });
          currentPage=index;
          pageController.animateToPage(/*الثلث سطور دول علشان اربط بين التغير بين الصفحات عن طريق
          scroll او عن طريق bottom nvegation bar والتغير اللى يحصل فى واحد فيهم يسمع فى التانى */
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          //print(index);
        },
        selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                icon:Icon(Icons.home,size: 25,),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon:Icon(Icons.category_outlined,size: 25,),
              label: "Category"
            ),
            BottomNavigationBarItem(
                icon:Icon(Icons.search,size: 25,),
              label:"Search"
            ),
          ]
      ),
    );
  }
}
