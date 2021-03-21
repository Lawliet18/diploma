import 'package:bloc/bloc.dart';
import 'package:diploma/models/notes.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  final Box notes;

  NotesCubit(this.notes) : super(NotesLoaded(notes));

  Future<void> addNote(Notes note) async {
    try {
      emit(NotesLoading());
      await Hive.box('notes').add(note);
      emit(NotesLoaded(notes));
    } catch (_) {
      emit(NotesError());
    }
  }

  Future<void> clearNotes() async {
    await Hive.box('notes').clear();
    emit(NotesInitial());
  }

  Future<void> deleteNote(int index) async {
    try {
      emit(NotesLoading());
      await Hive.box('notes').deleteAt(index);
      const message = 'Note deleted';
      emit(NoteDelete(message));
      emit(NotesLoaded(notes));
    } catch (_) {
      emit(NotesError());
    }
  }

  Future<void> updateNote(int index, Notes note) async {
    try {
      emit(NotesLoading());
      await Hive.box('notes').putAt(index, note);
      emit(NotesLoaded(notes));
    } catch (_) {
      emit(NotesError());
    }
  }
}
