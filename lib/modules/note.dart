
import 'package:flutter/material.dart';

class Note {
  final String note;
  Note(this.note);

  factory Note.fromJson(jsonData) {
    return Note(jsonData['note']);
  }
}

