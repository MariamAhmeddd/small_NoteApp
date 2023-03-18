
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/modules/note.dart';
import 'package:firebase_test/modules/note_module.dart';
import 'package:flutter/material.dart';

class MyNotes extends StatelessWidget {
  const MyNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference note = FirebaseFirestore.instance.collection('Note');

    return StreamBuilder<QuerySnapshot>(
      stream: note.snapshots(),
      builder: (context,snapshot){
        List<Note> notes =[];
        if(snapshot.hasData)
          {
            for(int i = 0; i < snapshot.data!.docs.length;i++)
              {
                notes.add(Note.fromJson(snapshot.data!.docs[i]));
              }
          }
        return Scaffold(
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
      },
    );
  }
}
