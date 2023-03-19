import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/note_cubit/note_states.dart';

import '../modules/note.dart';

class NoteCubit extends Cubit<NoteStates>
{
  NoteCubit():super(NoteInitState());

  CollectionReference note = FirebaseFirestore.instance.collection('Note');


  Future <void> AddNote(String data)
  {
    return note.add(
        {
          'note' : data,
        }
    );
  }

  void GetNotes()
  {
    note.snapshots().listen((event) {
      List<Note> notes =[];
      for(var doc in event.docs)
        {
          notes.add(Note.fromJson(doc));
        }
      emit(NoteViewState(notes: notes));
    });
  }
}