import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'notes.g.dart';

part 'notes.freezed.dart';

// @HiveType(typeId: 0)
// class Notes extends HiveObject {
//   @HiveField(0)
//   String? title;
//   @HiveField(1)
//   String? description;
//   @HiveField(2)
//   List<String>? imageList;
//   @HiveField(3)
//   List<CheckBox>? checkBoxList;
//   @HiveField(4)
//   String? id = '0';
//   @HiveField(5)
//   String? folderName;
//   @HiveField(6)
//   List<String>? linksName;

//   Notes(
//       {this.id,
//       this.title,
//       this.description,
//       this.imageList,
//       this.checkBoxList,
//       this.folderName,
//       this.linksName});
// }

// @HiveType(typeId: 1)
// class CheckBox extends HiveObject {
//   @HiveField(0)
//   String? description;
//   @HiveField(1)
//   bool isCheck;
//   @HiveField(2)
//   String? id = '0';

//   CheckBox({
//     this.id,
//     this.description,
//     this.isCheck = false,
//   });
// }

@freezed
abstract class Notes with _$Notes {
  const factory Notes(
      {@Default('0') String? id,
      String? title,
      String? description,
      List<String>? imageList,
      List<CheckBox>? checkBoxList,
      String? folderName,
      List<String>? linksName}) = _Notes;
}

@freezed
abstract class CheckBox with _$CheckBox {
  const factory CheckBox({
    @Default('0') String? id,
    String? description,
    @Default(false) bool isCheck,
  }) = _CheckBox;
}
