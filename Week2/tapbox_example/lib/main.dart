import 'package:flutter/material.dart';
import 'package:tapbox_example/screens/tapbox_a_screen.dart';
import 'package:tapbox_example/screens/tapbox_b_screen.dart';
import 'package:tapbox_example/screens/tapbox_c_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TapBox Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Center(
        child: App(),
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TapBox Example'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TapboxAScreen(),
                  ),
                );
              },
              child: const Text('TapboxA'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TapboxBScreen(),
                  ),
                );
              },
              child: const Text('TapboxB'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TapboxCScreen(),
                  ),
                );
              },
              child: const Text('TapboxC'),
            ),
          ],
        ),
      ),
    );
  }
}
