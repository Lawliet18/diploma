import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Image(
                  image: AssetImage('assets/img/notes.png'),
                ),
                Column(
                  children: [
                    Text(
                      'Daily Notes',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Take notes, reminders, set targets, \n collect resources, and secure privace',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).colorScheme.secondary),
                        minimumSize:
                            MaterialStateProperty.all(const Size(120, 60)),
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))))),
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/notes'),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Get Started'.toUpperCase(),
                        style: Theme.of(context).textTheme.button,
                      ),
                    )),
                Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
