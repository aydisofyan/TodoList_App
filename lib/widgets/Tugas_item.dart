import 'package:flutter/material.dart';
import 'package:todo_list/constants/color.dart';

class TugasItem extends StatelessWidget {
  const TugasItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: (){},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(
          Icons.check_box,
          color: tdBlue,
          ),
        title: Text(
          'Tugas 1',
          style: TextStyle(
            color: tdBlack, 
            fontSize: 16,
            decoration: TextDecoration.lineThrough,
            ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            iconSize: 18,
            color: Colors.white,
            icon: Icon(Icons.delete),
            onPressed: (){},
            ),
        ),
      ),
    );
  }
}