import 'package:diploma/cubit/add_note_cubit.dart';
import 'package:diploma/cubit/notes_cubit.dart';
import 'package:diploma/models/notes.dart';
import 'package:diploma/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'home_page.dart';

const String boxName = 'notes';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(NotesAdapter());
  Hive.registerAdapter(CheckBoxAdapter());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NotesCubit(Hive.box(boxName))),
        BlocProvider(create: (_) => AddNoteCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes',
        theme: ThemeData(
            primaryColorDark: const Color.fromRGBO(31, 29, 43, 1),
            colorScheme: const ColorScheme.dark()
                .copyWith(secondary: Colors.indigo[400]),
            fontFamily: 'Arista',
            textTheme: const TextTheme()),
        home: FutureBuilder(
            future: Hive.openBox(
              boxName,
              compactionStrategy: (entries, deletedEntries) =>
                  deletedEntries > 50,
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return snapshot.hasError
                    ? Text(snapshot.error.toString())
                    : const HomePage();
              } else {
                return const Scaffold();
              }
            }),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generatorRoute,
      ),
    );
  }

  @override
  void dispose() {
    Hive.box(boxName).compact();
    Hive.close();
    super.dispose();
  }
}
