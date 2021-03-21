import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import 'cubit/add_note_cubit.dart';
import 'cubit/notes_cubit.dart';
import 'models/notes.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _focusNodeTitle = FocusNode();
  final _focusNodeDesc = FocusNode();
  List<String> imageList = [];
  List<CheckBox> checkBoxList = [];
  late TextTheme textTheme;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _focusNodeTitle.dispose();
    _focusNodeDesc.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    textTheme = Theme.of(context).textTheme;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                icon: const Icon(Icons.arrow_back_ios),
                                onPressed: () => Navigator.of(context).pop()),
                            IconButton(
                                icon: const Icon(Icons.done),
                                onPressed: _submit),
                          ],
                        ),
                      ),
                      BlocConsumer<AddNoteCubit, AddNoteState>(
                          listener: (context, state) {
                        if (state is AddNoteImage) {
                          imageList = state.list;
                        }
                        if (state is AddCheckList) {
                          checkBoxList = state.checkBox;
                        }
                      }, builder: (context, state) {
                        if (state is AddNoteInitial) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (state.widgetList['images']!)
                                CustomSlider(imageList: imageList)
                              else
                                Container(),
                              buildTitleTextField(context),
                              if (state.widgetList['checkBox']!)
                                buildCheckBox(context)
                              else
                                Container(),
                              buildDescriptionTextField(context),
                            ],
                          );
                        }
                        return Container();
                      }),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        IconButton(
                            icon: const Icon(Icons.notes),
                            onPressed: () => _showModalBottomSheet(context))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    ));
  }

  Padding buildDescriptionTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        focusNode: _focusNodeDesc,
        maxLines: 5,
        style: textTheme.headline6,
        controller: _descriptionController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: 'Description',
          hintStyle: textTheme.headline6!
              .copyWith(color: textTheme.headline6!.color?.withOpacity(0.7)),
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
        ),
        onFieldSubmitted: (term) {
          _focusNodeDesc.unfocus();
        },
      ),
    );
  }

  Padding buildTitleTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        focusNode: _focusNodeTitle,
        autofocus: true,
        style: textTheme.headline5,
        controller: _titleController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: 'Title',
          hintStyle: textTheme.headline5!
              .copyWith(color: textTheme.headline5!.color?.withOpacity(0.7)),
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
        ),
        onFieldSubmitted: (term) {
          _focusNodeTitle.unfocus();
          FocusScope.of(context).requestFocus(_focusNodeDesc);
        },
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    final tiles = <ListTile>[
      ListTile(
        leading: const Icon(Icons.camera_alt_outlined),
        title: const Text('Camera'),
        onTap: () {
          context.read<AddNoteCubit>().addImage(ImageSource.camera, context);
          Navigator.pop(context);
        },
      ),
      ListTile(
          leading: const Icon(Icons.camera_alt_outlined),
          title: const Text('Gallery'),
          onTap: () {
            context.read<AddNoteCubit>().addImage(ImageSource.gallery, context);
            Navigator.pop(context);
          }),
      ListTile(
        leading: const Icon(Icons.check_circle_outline_outlined),
        title: const Text('CheckBox'),
        onTap: () {
          Navigator.pop(context);
          context.read<AddNoteCubit>().addCheckBox();
        },
      ),
    ];
    showModalBottomSheet(
        context: context, builder: (context) => Wrap(children: tiles));
  }

  void _submit() {
    const uuid = Uuid();
    context.read<NotesCubit>().addNote(Notes(
        id: uuid.v4(),
        title: _titleController.text,
        description: _descriptionController.text,
        imageList: imageList,
        checkBoxList: checkBoxList));
    context.read<AddNoteCubit>().clearAll();
    Navigator.pushReplacementNamed(context, '/notes');
  }

  Column buildCheckBox(BuildContext context) {
    print(checkBoxList.last);
    return Column(
        children: checkBoxList
            .map((checkBox) => CheckboxListTile(
                  key: UniqueKey(),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkBox.isCheck,
                  onChanged: (value) {
                    context
                        .read<AddNoteCubit>()
                        .changeValue(checkBox, isCheck: value ?? false);
                  },
                  secondary: checkBoxList.last == checkBox
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () =>
                                    context.read<AddNoteCubit>().addCheckBox()),
                            buildIconButton(context, checkBox)
                          ],
                        )
                      : buildIconButton(context, checkBox),
                  title: Text(
                    checkBox.description ?? 'Print Something',
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        decoration: checkBox.isCheck
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                ))
            .toList());
  }

  IconButton buildIconButton(BuildContext context, CheckBox checkBox) {
    return IconButton(
      icon: const Icon(Icons.cancel),
      onPressed: () => context.read<AddNoteCubit>().deleteCheckBox(checkBox),
    );
  }
}

class CustomSlider extends StatefulWidget {
  const CustomSlider({
    Key? key,
    required this.imageList,
  }) : super(key: key);

  final List<String> imageList;

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                viewportFraction: 0.5,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            items: widget.imageList
                .map((path) => Center(
                        child: Image.file(
                      File(path),
                      fit: BoxFit.cover,
                      height: 200,
                    )))
                .toList(),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.imageList.map((e) {
                  final index = widget.imageList.indexOf(e);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? const Color.fromRGBO(0, 0, 0, 0.9)
                          : const Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  );
                }).toList(),
              ))
        ],
      ),
    );
  }
}
