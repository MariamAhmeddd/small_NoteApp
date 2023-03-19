
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/modules/note.dart';
import 'package:firebase_test/modules/note_module.dart';
import 'package:flutter/material.dart';

class MyNotes extends StatelessWidget {
   MyNotes({required this.notes,Key? key}) : super(key: key);

  List<Note>notes;
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
          body: Column(
              children: [
          Expanded(
          child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return NoteModule(note: notes[index],);
              }),
          ),
              ]
          ),
        );
      }
}
