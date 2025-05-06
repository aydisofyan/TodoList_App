import 'package:flutter/material.dart';
import 'package:todo_list/constants/color.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tdBGColor,
        title: Row(children: [
          Icon(
            Icons.menu,
            color: Colors.black,
            size: 30,
          ),
          Container(
            height: 40 ,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              // child: ,
            ),
          )
        ],),
      ),
      body: Container(child: Text('HELLO vdf WOLRD')),
    );
  }
}
