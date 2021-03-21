import 'package:diploma/add_note.dart';
import 'package:diploma/home_page.dart';
import 'package:diploma/notes_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'models/notes.dart';
import 'view_note.dart';

class RouteGenerator {
  static Route<dynamic> generatorRoute(dynamic settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (context) => const HomePage());
      case '/notes':
        return CupertinoPageRoute(builder: (context) => const NotesPage());
      case '/add_note':
        return CupertinoPageRoute(builder: (context) => const AddNote());
      case '/view_note':
        if (arguments is Map<String, dynamic>) {
          final args = arguments;
          return CupertinoPageRoute(
              builder: (context) => ViewNote(
                    index: args['index'] as int,
                    notes: args['notes'] as Box<dynamic>,
                  ));
        } else {
          throw 'Invalid arguments';
        }
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return CupertinoPageRoute(
        builder: (context) => Scaffold(
              appBar: AppBar(
                title: const Text('Error'),
              ),
              body: const Text('ERROR'),
            ));
  }
}
