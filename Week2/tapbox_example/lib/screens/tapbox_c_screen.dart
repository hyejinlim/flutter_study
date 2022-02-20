import 'package:flutter/material.dart';

class TapboxCScreen extends StatefulWidget {
  const TapboxCScreen({Key? key}) : super(key: key);

  @override
  _TapboxCScreenState createState() => _TapboxCScreenState();
}

class _TapboxCScreenState extends State<TapboxCScreen> {
  bool active = false;

  void handleTapboxChanged(bool newValue) {
    setState(() {
      active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TapBoxC Example'),
      ),
      body: SizedBox(
        child: TapboxC(
          active: active,
          onChanged: handleTapboxChanged,
        ),
      ),
    );
  }
}

class TapboxC extends StatefulWidget {
  const TapboxC({
    Key? key,
    this.active = false,
    required this.onChanged,
  }) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapboxCState createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool highlight = false;

  void handleTapDown(TapDownDetails details) {
    setState(() {
      highlight = true;
    });
  }

  void handleTapUp(TapUpDetails details) {
    setState(() {
      highlight = false;
    });
  }

  void handleTapCancel() {
    setState(() {
      highlight = false;
    });
  }

  void handleTap() {
    widget.onChanged(!widget.active); // widget 안쓰는법???????
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: handleTapDown,
      onTapUp: handleTapUp,
      onTapCancel: handleTapCancel,
      onTap: handleTap,
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: highlight
              ? Border.all(
                  color: Colors.teal[700]!,
                  width: 10.0,
                )
              : null,
        ),
        child: Text(
          widget.active ? 'Active' : 'InActive',
          style: const TextStyle(fontSize: 32.0, color: Colors.white),
        ),
      ),
    );
  }
}
