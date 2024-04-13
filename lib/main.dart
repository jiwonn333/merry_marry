import 'package:flutter/material.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Align(
                alignment: Alignment.centerLeft,
                child: Text('MerryMarry')
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: () {
                  print('button is clicked');
                },
              )
            ],
          ),
          body: Container(),
          bottomNavigationBar: BottomAppBar(),
        )
    );
  }
}


