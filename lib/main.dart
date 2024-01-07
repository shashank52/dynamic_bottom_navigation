import 'package:dynamic_bottom_navigation/screens/bottom_naviagtion_bar/view/bottom_navigation_bar_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Dynamic Bottom Navigation',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home());
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  void handleButtonClick(BuildContext context, int items) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => BottomNavigationBarView(items: items)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Dynamic Navigation Bar Demo',
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
                onPressed: () => handleButtonClick(context, 4),
                child: const Text('4 items')),
            FilledButton(
              onPressed: () => handleButtonClick(context, 5),
              child: const Text('5 items'),
            )
          ],
        ),
      ),
    );
  }
}
