part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesError extends NotesState {}

class NotesLoading extends NotesState {}

class NotesInitial extends NotesState {}

class NotesLoaded extends NotesState {
  final Box notes;
  NotesLoaded(this.notes);
}

class NoteDelete extends NotesState {
  final String message;
  NoteDelete(this.message);
}
