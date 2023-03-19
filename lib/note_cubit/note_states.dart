import '../modules/note.dart';

abstract class NoteStates{}

class NoteInitState extends NoteStates{}
class NoteViewState extends NoteStates{
  List<Note>notes=[];
  NoteViewState({required this.notes});
}