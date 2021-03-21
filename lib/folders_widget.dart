import 'package:flutter/material.dart';

class FoldersWidget extends StatelessWidget {
  const FoldersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 3 / 4),
        itemBuilder: (context, index) => Card(
              elevation: 1,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/img/folder.png',
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Folders name',
                      style: TextStyle(
                          fontSize: 18, letterSpacing: 1.2, wordSpacing: 1),
                    ),
                    // SizedBox(
                    //   height: 20,
                    // )
                  ],
                ),
              ),
            ));
  }
}
