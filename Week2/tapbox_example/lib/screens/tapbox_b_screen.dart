import 'package:flutter/material.dart';

class TapboxBScreen extends StatefulWidget {
  const TapboxBScreen({Key? key}) : super(key: key);

  @override
  _TapboxBScreenState createState() => _TapboxBScreenState();
}

class _TapboxBScreenState extends State<TapboxBScreen> {
  bool active = false;

  void handleTapboxChange(bool newValue) {
    setState(() {
      active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TapBoxB Example'),
      ),
      body: SizedBox(
        child: TapboxB(
          active: active,
          onChanged: handleTapboxChange,
        ),
      ),
    );
  }
}

class TapboxB extends StatelessWidget {
  const TapboxB({
    Key? key,
    this.active = false,
    required this.onChanged,
  }) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
