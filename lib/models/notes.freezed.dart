// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'notes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NotesTearOff {
  const _$NotesTearOff();

  _Notes call(
      {String? id = '0',
      String? title,
      String? description,
      List<String>? imageList,
      List<CheckBox>? checkBoxList,
      String? folderName,
      List<String>? linksName}) {
    return _Notes(
      id: id,
      title: title,
      description: description,
      imageList: imageList,
      checkBoxList: checkBoxList,
      folderName: folderName,
      linksName: linksName,
    );
  }
}

/// @nodoc
const $Notes = _$NotesTearOff();

/// @nodoc
mixin _$Notes {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String>? get imageList => throw _privateConstructorUsedError;
  List<CheckBox>? get checkBoxList => throw _privateConstructorUsedError;
  String? get folderName => throw _privateConstructorUsedError;
  List<String>? get linksName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotesCopyWith<Notes> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesCopyWith<$Res> {
  factory $NotesCopyWith(Notes value, $Res Function(Notes) then) =
      _$NotesCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? title,
      String? description,
      List<String>? imageList,
      List<CheckBox>? checkBoxList,
      String? folderName,
      List<String>? linksName});
}

/// @nodoc
class _$NotesCopyWithImpl<$Res> implements $NotesCopyWith<$Res> {
  _$NotesCopyWithImpl(this._value, this._then);

  final Notes _value;
  // ignore: unused_field
  final $Res Function(Notes) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? imageList = freezed,
    Object? checkBoxList = freezed,
    Object? folderName = freezed,
    Object? linksName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String?,
      title: title == freezed ? _value.title : title as String?,
      description:
          description == freezed ? _value.description : description as String?,
      imageList:
          imageList == freezed ? _value.imageList : imageList as List<String>?,
      checkBoxList: checkBoxList == freezed
          ? _value.checkBoxList
          : checkBoxList as List<CheckBox>?,
      folderName:
          folderName == freezed ? _value.folderName : folderName as String?,
      linksName:
          linksName == freezed ? _value.linksName : linksName as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$NotesCopyWith<$Res> implements $NotesCopyWith<$Res> {
  factory _$NotesCopyWith(_Notes value, $Res Function(_Notes) then) =
      __$NotesCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? title,
      String? description,
      List<String>? imageList,
      List<CheckBox>? checkBoxList,
      String? folderName,
      List<String>? linksName});
}

/// @nodoc
class __$NotesCopyWithImpl<$Res> extends _$NotesCopyWithImpl<$Res>
    implements _$NotesCopyWith<$Res> {
  __$NotesCopyWithImpl(_Notes _value, $Res Function(_Notes) _then)
      : super(_value, (v) => _then(v as _Notes));

  @override
  _Notes get _value => super._value as _Notes;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? imageList = freezed,
    Object? checkBoxList = freezed,
    Object? folderName = freezed,
    Object? linksName = freezed,
  }) {
    return _then(_Notes(
      id: id == freezed ? _value.id : id as String?,
      title: title == freezed ? _value.title : title as String?,
      description:
          description == freezed ? _value.description : description as String?,
      imageList:
          imageList == freezed ? _value.imageList : imageList as List<String>?,
      checkBoxList: checkBoxList == freezed
          ? _value.checkBoxList
          : checkBoxList as List<CheckBox>?,
      folderName:
          folderName == freezed ? _value.folderName : folderName as String?,
      linksName:
          linksName == freezed ? _value.linksName : linksName as List<String>?,
    ));
  }
}

/// @nodoc
class _$_Notes implements _Notes {
  const _$_Notes(
      {this.id = '0',
      this.title,
      this.description,
      this.imageList,
      this.checkBoxList,
      this.folderName,
      this.linksName});

  @JsonKey(defaultValue: '0')
  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final List<String>? imageList;
  @override
  final List<CheckBox>? checkBoxList;
  @override
  final String? folderName;
  @override
  final List<String>? linksName;

  @override
  String toString() {
    return 'Notes(id: $id, title: $title, description: $description, imageList: $imageList, checkBoxList: $checkBoxList, folderName: $folderName, linksName: $linksName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Notes &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.imageList, imageList) ||
                const DeepCollectionEquality()
                    .equals(other.imageList, imageList)) &&
            (identical(other.checkBoxList, checkBoxList) ||
                const DeepCollectionEquality()
                    .equals(other.checkBoxList, checkBoxList)) &&
            (identical(other.folderName, folderName) ||
                const DeepCollectionEquality()
                    .equals(other.folderName, folderName)) &&
            (identical(other.linksName, linksName) ||
                const DeepCollectionEquality()
                    .equals(other.linksName, linksName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(imageList) ^
      const DeepCollectionEquality().hash(checkBoxList) ^
      const DeepCollectionEquality().hash(folderName) ^
      const DeepCollectionEquality().hash(linksName);

  @JsonKey(ignore: true)
  @override
  _$NotesCopyWith<_Notes> get copyWith =>
      __$NotesCopyWithImpl<_Notes>(this, _$identity);
}

abstract class _Notes implements Notes {
  const factory _Notes(
      {String? id,
      String? title,
      String? description,
      List<String>? imageList,
      List<CheckBox>? checkBoxList,
      String? folderName,
      List<String>? linksName}) = _$_Notes;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  List<String>? get imageList => throw _privateConstructorUsedError;
  @override
  List<CheckBox>? get checkBoxList => throw _privateConstructorUsedError;
  @override
  String? get folderName => throw _privateConstructorUsedError;
  @override
  List<String>? get linksName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NotesCopyWith<_Notes> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$CheckBoxTearOff {
  const _$CheckBoxTearOff();

  _CheckBox call(
      {String? id = '0', String? description, bool isCheck = false}) {
    return _CheckBox(
      id: id,
      description: description,
      isCheck: isCheck,
    );
  }
}

/// @nodoc
const $CheckBox = _$CheckBoxTearOff();

/// @nodoc
mixin _$CheckBox {
  String? get id => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get isCheck => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckBoxCopyWith<CheckBox> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckBoxCopyWith<$Res> {
  factory $CheckBoxCopyWith(CheckBox value, $Res Function(CheckBox) then) =
      _$CheckBoxCopyWithImpl<$Res>;
  $Res call({String? id, String? description, bool isCheck});
}

/// @nodoc
class _$CheckBoxCopyWithImpl<$Res> implements $CheckBoxCopyWith<$Res> {
  _$CheckBoxCopyWithImpl(this._value, this._then);

  final CheckBox _value;
  // ignore: unused_field
  final $Res Function(CheckBox) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? isCheck = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String?,
      description:
          description == freezed ? _value.description : description as String?,
      isCheck: isCheck == freezed ? _value.isCheck : isCheck as bool,
    ));
  }
}

/// @nodoc
abstract class _$CheckBoxCopyWith<$Res> implements $CheckBoxCopyWith<$Res> {
  factory _$CheckBoxCopyWith(_CheckBox value, $Res Function(_CheckBox) then) =
      __$CheckBoxCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String? description, bool isCheck});
}

/// @nodoc
class __$CheckBoxCopyWithImpl<$Res> extends _$CheckBoxCopyWithImpl<$Res>
    implements _$CheckBoxCopyWith<$Res> {
  __$CheckBoxCopyWithImpl(_CheckBox _value, $Res Function(_CheckBox) _then)
      : super(_value, (v) => _then(v as _CheckBox));

  @override
  _CheckBox get _value => super._value as _CheckBox;

  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? isCheck = freezed,
  }) {
    return _then(_CheckBox(
      id: id == freezed ? _value.id : id as String?,
      description:
          description == freezed ? _value.description : description as String?,
      isCheck: isCheck == freezed ? _value.isCheck : isCheck as bool,
    ));
  }
}

/// @nodoc
class _$_CheckBox implements _CheckBox {
  const _$_CheckBox({this.id = '0', this.description, this.isCheck = false});

  @JsonKey(defaultValue: '0')
  @override
  final String? id;
  @override
  final String? description;
  @JsonKey(defaultValue: false)
  @override
  final bool isCheck;

  @override
  String toString() {
    return 'CheckBox(id: $id, description: $description, isCheck: $isCheck)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CheckBox &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.isCheck, isCheck) ||
                const DeepCollectionEquality().equals(other.isCheck, isCheck)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(isCheck);

  @JsonKey(ignore: true)
  @override
  _$CheckBoxCopyWith<_CheckBox> get copyWith =>
      __$CheckBoxCopyWithImpl<_CheckBox>(this, _$identity);
}

abstract class _CheckBox implements CheckBox {
  const factory _CheckBox({String? id, String? description, bool isCheck}) =
      _$_CheckBox;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  bool get isCheck => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CheckBoxCopyWith<_CheckBox> get copyWith =>
      throw _privateConstructorUsedError;
}
