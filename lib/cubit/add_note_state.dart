part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {
  final Map<String, bool> widgetList;

  AddNoteInitial(this.widgetList);
}

class AddNoteError extends AddNoteState {}

class AddCheckList extends AddNoteState {
  final List<CheckBox> checkBox;

  AddCheckList(this.checkBox);
}

class AddNoteImage extends AddNoteState {
  final List<String> list;

  AddNoteImage(this.list);
}
