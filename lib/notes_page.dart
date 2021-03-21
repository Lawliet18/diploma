import 'package:flutter/material.dart';

import 'folders_widget.dart';
import 'notes.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage>
    with SingleTickerProviderStateMixin {
  int _index = 0;
  final list = const ['Notes', 'Folders', 'Graphs'];
  final _widgetOptional = const [
    NotesWidget(),
    FoldersWidget(),
    Text('graphs')
  ];
  late TabController _controller;
  late List<Widget> _floatingButtonOptional;
  final color = Colors.white;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: list.length, vsync: this);
    _controller.addListener(_handleTabSelection);
    _floatingButtonOptional = [
      FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/add_note'),
          child: Icon(
            Icons.note_add_outlined,
            color: color,
          )),
      FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/add_note'),
          child: Icon(
            Icons.add,
            color: color,
          )),
      FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/add_note'),
          child: const Text('G')),
    ];
  }

  void _handleTabSelection() {
    setState(() {
      _index = _controller.index;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Overlay(initialEntries: [
      OverlayEntry(
        builder: (context) => SafeArea(
          child: Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 100,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Expanded(
                                  child: Text(
                                'Notes',
                                style: Theme.of(context).textTheme.headline6,
                              )),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                textBaseline: TextBaseline.ideographic,
                                children: const [
                                  IconButton(
                                      icon: Icon(Icons.search),
                                      onPressed: null),
                                  IconButton(
                                      icon: Icon(Icons.more_horiz_rounded),
                                      onPressed: null),
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBar(
                            controller: _controller,
                            //labelPadding: EdgeInsets.zero,
                            labelColor: Colors.amber,
                            labelStyle: const TextStyle(
                                fontSize: 16, fontFamily: 'Arista'),
                            unselectedLabelColor: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.7),
                            indicator: const UnderlineTabIndicator(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.amber),
                                insets: EdgeInsets.symmetric(
                                  horizontal: 35,
                                )),
                            tabs: list
                                .map((text) => Tab(
                                      text: text,
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: TabBarView(
                          controller: _controller,
                          children: _widgetOptional
                              .map((widget) => widget)
                              .toList())),
                ],
              ),
              floatingActionButton: _floatingButtonOptional.elementAt(_index)),
        ),
      ),
    ]);
  }
}
