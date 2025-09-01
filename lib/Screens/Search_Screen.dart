import 'package:flutter/material.dart';
import 'package:newsapp/Cubit/news_cubit.dart';
import 'package:newsapp/Screens/Result_Screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  TextEditingController controller=TextEditingController();
  void dispose(){

    super.dispose();
    controller.dispose();
  }
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          child: Column(
           // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("News App",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
                textAlign: TextAlign.center,
              ),
              Text("Search for special topic",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500
              ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.none,
            decoration: InputDecoration(
              border:OutlineInputBorder(borderRadius:BorderRadius.circular(12),),
              hintText: "Quary",
              hintStyle: TextStyle(
                fontSize: 15,
              )
            ),
          ),
        ),
        GestureDetector(
          onTap:() {
            var cubit =NewsCubit.get(context);
            cubit.GetResultToSearch(controller.text);
            Navigator.push(context,
            MaterialPageRoute(builder: (_)=>ResultScreen(title: "General",))
            );
            controller.clear();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0,right:8,top: 20),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text("Search",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        )

      ],
    );
  }
}
