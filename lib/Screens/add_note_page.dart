import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/Screens/my_notes.dart';
import 'package:flutter/material.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {

    CollectionReference note = FirebaseFirestore.instance.collection('Note');

    late String data;

    Future <void> addNote()
    {
      return note.add(
          {
            'note' : data,
          }
      );
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onSubmitted: (val) {
              data = val;
              },
            decoration: InputDecoration(
              prefixIconColor: Colors.black,
              hintText: 'note',
              prefixIcon: Icon(Icons.event_note_outlined),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: () async {
              addNote();
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              height: 60,
              width: double.infinity,
              child: Center(
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyNotes()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              height: 60,
              width: double.infinity,
              child: Center(
                  child: Text(
                    'Show My Notes',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
