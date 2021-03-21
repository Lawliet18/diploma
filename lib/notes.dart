import 'dart:io';
import 'dart:math';

import 'package:diploma/cubit/notes_cubit.dart';
import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'models/notes.dart';

class NotesWidget extends StatelessWidget {
  const NotesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is NoteDelete) {
          _showFlash(context, theme, state);
        }
      },
      builder: (context, state) {
        if (state is NotesError) {
          return buildOnError();
        }
        if (state is NotesLoading) {
          return buildOnLoading();
        }
        if (state is NotesLoaded) {
          return state.notes.isNotEmpty
              ? StaggeredGridView.countBuilder(
                  key: UniqueKey(),
                  primary: false,
                  crossAxisCount: 2,
                  itemCount: state.notes.length,
                  //maxCrossAxisExtent: 100,
                  itemBuilder: (context, index) {
                    final note = state.notes.getAt(index) as Notes;
                    return GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed(
                            '/view_note',
                            arguments: {'index': index, 'notes': state.notes}),
                        child: Note(note: note, value: Random().nextBool()));
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.extent(
                      1,
                      (state.notes.getAt(index)?.imageList != null &&
                              state.notes.getAt(index)!.imageList?.isNotEmpty
                                  as bool)
                          ? 300
                          : 100),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                )
              : Center(
                  child: Text(
                    'Add some notes',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                );
        }
        if (state is NotesInitial) {
          return buildOnInitial();
        }
        return Container();
      },
    );
  }

  Future<Object> _showFlash(
      BuildContext context, ColorScheme theme, NoteDelete state) async {
    return showFlash(
        context: context,
        persistent: true,
        duration: const Duration(seconds: 3),
        builder: (context, controller) => Flash.bar(
              margin: const EdgeInsets.all(8.0),
              brightness: Brightness.dark,
              backgroundColor: theme.background,
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              position: FlashPosition.bottom,
              forwardAnimationCurve: Curves.easeOut,
              reverseAnimationCurve: Curves.slowMiddle,
              controller: controller,
              child: FlashBar(
                message: Text(
                  state.message,
                  style: TextStyle(fontSize: 16, color: theme.onBackground),
                ),
                icon: Icon(
                  Icons.delete,
                  color: theme.error,
                  size: 24,
                ),
              ),
            ));
  }

  Widget buildOnError() {
    return const Center(
      child: Text('Error'),
    );
  }

  Widget buildOnLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildOnInitial() {
    return const Center(
      child: Text('Initial'),
    );
  }
}

class Note extends StatelessWidget {
  const Note({Key? key, required this.note, required this.value})
      : super(key: key);

  final Notes note;
  final bool value;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      elevation: 1,
      //color: Colors.white.withOpacity(0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _imageOrCheckBox(context),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title ?? 'Title',
                    style: textTheme.headline6,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        note.description ?? 'Description',
                        style: textTheme.bodyText1,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date',
                        style: textTheme.bodyText2,
                      ),
                      Text(
                        'Folder name',
                        style: textTheme.bodyText2,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageOrCheckBox(BuildContext context) {
    final imageListExist = note.imageList != null && note.imageList!.isNotEmpty;
    final checkBoxExist =
        note.checkBoxList != null && note.checkBoxList!.isNotEmpty;
    if (imageListExist) {
      return ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Image.file(
          File(note.imageList![0]),
          height: 200,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
      );
    } else if (checkBoxExist) {
      //TODO: add checkBoxList
      return const Text('CheckBOxList');
    } else if (imageListExist && checkBoxExist) {
      return value
          ? Image.file(
              File(note.imageList![0]),
              height: 200,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            )
          :
          //TODO: add checkBoxList
          const Text('CheckBOxList');
    } else {
      return Container();
    }
  }
}
