import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker {
  CustomImagePicker._();
  static final CustomImagePicker imagePicker = CustomImagePicker._();
  final ImagePicker _picker = ImagePicker();
  PickedFile? imageFile;

  Future<PickedFile?> retrieveLostData() async {
    final response = await _picker.getLostData();
    if (response.isEmpty) {
      return null;
    }
    if (response.file != null) {
      imageFile = response.file;
    } else {}

    return imageFile;
  }

  Future<String> selectMethod(ImageSource source, BuildContext context) async {
    try {
      final pickedFile = await _picker.getImage(
        source: source,
      );
      if (pickedFile == null) {
        throw 'File is null';
      }
      return pickedFile.path;
    } catch (e) {
      rethrow;
    }
  }
}
