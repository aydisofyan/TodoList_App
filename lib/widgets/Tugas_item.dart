import 'package:flutter/material.dart';
import 'package:todo_list/constants/color.dart';
import 'package:todo_list/model/Tugas.dart';

class TugasItem extends StatelessWidget {
  final Tugas tugas;
  final onTodoChange;
  final Function(String) onDeleteItem;
  const TugasItem({
    super.key,
    required this.tugas,
    required this.onDeleteItem,
    required this.onTodoChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: ListTile(
        onTap: () {
          // print('Menekan tombol 1');
          onTodoChange(tugas);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          tugas.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          tugas.tekstugas!,
          style: TextStyle(
            fontFamily: 'Poppins',
            color: tdBlack,
            fontSize: 16,
            decoration: tugas.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
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
            onPressed: () {
              onDeleteItem(tugas.id ?? '');
            },
          ),
        ),
      ),
    );
  }
}
