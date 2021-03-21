import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import 'package:diploma/image_picker.dart';
import 'package:diploma/models/notes.dart';
import 'package:uuid/uuid.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  final List<String> list = [];
  final List<CheckBox> checkBox = [];
  final Map<String, bool> listOfAddedWidget = {
    'images': false,
    'checkBox': false
  };
  AddNoteCubit()
      : super(AddNoteInitial(const {'images': false, 'checkBox': false}));

  Future<void> addImage(ImageSource source, BuildContext context) async {
    try {
      final String image =
          await CustomImagePicker.imagePicker.selectMethod(source, context);
      list.add(image);
      emit(AddNoteImage(list));
      listOfAddedWidget.update('images', (value) => true);
      emit(AddNoteInitial(listOfAddedWidget));
    } catch (_) {
      emit(AddNoteError());
    }
  }

  void addCheckBox() {
    const uuid = Uuid();
    if (listOfAddedWidget['checkBox']!) {
      checkBox.add(CheckBox(id: uuid.v4()));
      emit(AddCheckList(checkBox));
      emit(AddNoteInitial(listOfAddedWidget));
    } else {
      listOfAddedWidget.update('checkBox', (value) => true);
      checkBox.add(CheckBox(id: uuid.v4()));
      emit(AddCheckList(checkBox));
      emit(AddNoteInitial(listOfAddedWidget));
    }
  }

  void deleteCheckBox(CheckBox checkBoxToRemove) {
    if (checkBox.length == 1) {
      listOfAddedWidget.update('checkBox', (value) => false);
    } else {
      checkBox.remove(checkBoxToRemove);
    }

    emit(AddNoteInitial(listOfAddedWidget));
  }

  void changeValue(CheckBox checkBoxToUpdate, {required bool isCheck}) {
    final index = checkBox.indexOf(checkBoxToUpdate);
    checkBox[index] = checkBox[index].copyWith(isCheck: isCheck);
    emit(AddNoteInitial(listOfAddedWidget));
  }

  void clearAll() {
    list.clear();
    checkBox.clear();
    listOfAddedWidget.updateAll((key, value) => value = false);
    //emit(AddNoteInitial(listOfAddedWidget));
  }
}
