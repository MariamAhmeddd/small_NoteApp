
import 'package:flutter/material.dart';

import 'note.dart';

class NoteModule extends StatelessWidget {
  const NoteModule(
      {
        Key? key,
        required this.note,
      }) : super(key: key);
  final Note note;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          color: Color.fromRGBO(255, 219, 149, 1),
        ),
        child: Text(
         note.note,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
