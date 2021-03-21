import 'package:diploma/add_note.dart';
import 'package:diploma/cubit/notes_cubit.dart';
import 'package:diploma/models/notes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'cubit/add_note_cubit.dart';

class ViewNote extends StatefulWidget {
  const ViewNote({Key? key, required this.index, required this.notes})
      : super(key: key);

  final int index;
  final Box<dynamic> notes;

  @override
  _ViewNoteState createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  late Notes note;
  late int _index;
  @override
  void initState() {
    super.initState();
    _index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    note = widget.notes.getAt(_index) as Notes;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildPopIconButtons(context),
                    buildAppBarIconButtons(context)
                  ],
                ),
                buildNoteBody()
              ],
            ),
            Positioned(
                bottom: 0,
                child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () => _showModalBottomSheet(context)))
          ],
        ),
      ),
    );
  }

  Row buildPopIconButtons(BuildContext context) {
    return Row(
      children: [
        IconButton(
            icon: const Icon(Icons.keyboard_arrow_left_rounded),
            onPressed: () => Navigator.of(context)
                .pushNamedAndRemoveUntil('/notes', (route) => false)),
        const Text('Notes')
      ],
    );
  }

  Row buildAppBarIconButtons(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: _previousNote),
        IconButton(
            icon: const Icon(Icons.keyboard_arrow_right), onPressed: _nextNote),
        IconButton(
            icon: const Icon(Icons.done),
            onPressed: () {
              context.read<NotesCubit>().updateNote(_index, note);
            }),
      ],
    );
  }

  Expanded buildNoteBody() {
    return Expanded(
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                children: [
                  Text(note.title ?? 'Title'),
                  if (note.imageList != null)
                    CustomSlider(imageList: note.imageList!)
                  else
                    Container(),
                  Text(note.description ?? 'Description'),
                  ...note.checkBoxList
                          ?.map((checkBox) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Center(
                                      child: InkWell(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        onTap: () {
                                          setState(() {
                                            checkBox.copyWith(
                                                isCheck: !checkBox.isCheck);
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 2,
                                                  color: Colors.indigo),
                                              color: checkBox.isCheck
                                                  ? Colors.indigo
                                                  : Colors.transparent),
                                          child: checkBox.isCheck
                                              ? const Icon(
                                                  Icons.check,
                                                  size: 20,
                                                  color: Colors.white,
                                                )
                                              : Container(),
                                        ),
                                      ),
                                    ),
                                    Text(checkBox.description ?? '')
                                  ],
                                ),
                              ))
                          .toList() ??
                      []
                ],
              );
            }));
  }

  void _showModalBottomSheet(BuildContext context) {
    final tiles = <ListTile>[
      ListTile(
        leading: const Icon(Icons.delete),
        title: const Text('Delete'),
        onTap: () {
          BlocProvider.of<NotesCubit>(context).deleteNote(widget.index);
          Navigator.of(context).pushReplacementNamed('/notes');
        },
      ),
      const ListTile(
        leading: Icon(Icons.note),
        title: Text('Note'),
      ),
      const ListTile(
        leading: Icon(Icons.list),
        title: Text('CheckList'),
      )
    ];
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.elliptical(30, 20),
                topLeft: Radius.elliptical(30, 20))),
        builder: (context) => Wrap(children: [
              ...tiles,
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Sun , 20.04 | 4096 characters',
                    style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.7)),
                  ),
                ),
              )
            ]));
  }

  void _nextNote() {
    setState(() {
      _index++;
      if (_index >= widget.notes.length) {
        _index = 0;
      }
    });
  }

  void _previousNote() {
    setState(() {
      _index--;
      if (_index < 0) {
        _index = widget.notes.length - 1;
      }
    });
  }
}
