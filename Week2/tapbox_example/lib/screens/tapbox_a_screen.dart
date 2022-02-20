import 'package:flutter/material.dart';

class TapboxAScreen extends StatefulWidget {
  const TapboxAScreen({Key? key}) : super(key: key);

  @override
  _TapboxAScreenState createState() => _TapboxAScreenState();
}

class _TapboxAScreenState extends State<TapboxAScreen> {
  bool active = false;

  void handleTap() {
    setState(() {
      active = !active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TapBoxA Example'),
      ),
      body: GestureDetector(
        onTap: handleTap,
        child: Container(
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
            color: active ? Colors.lightGreen[700] : Colors.grey[600],
          ),
          child: Text(
            active ? 'Active' : 'InActive',
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
