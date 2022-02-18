import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Practice 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Layout Practice 1'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'assets/images/lake.png',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            const TitleSection(),
            const ButtonSection(),
            const TextSection(),
          ],
        ),
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );
  }
}

// Bad Example
// Widget textSection = const Padding(
//   padding: EdgeInsets.all(32),
//   child: Text(
//     'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
//     'Alps. Situated 1,578 meters above sea level, it is one of the '
//     'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
//     'half-hour walk through pastures and pine forest, leads you to the '
//     'lake, which warms to 20 degrees Celsius in the summer. Activities '
//     'enjoyed here include rowing, and riding the summer toboggan run.',
//     softWrap: true,
//   ),
// );

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const ButtonItem(
          color: Colors.grey,
          icon: Icons.call,
          label: 'CALL',
        ),
        const ButtonItem(
          color: Colors.grey,
          icon: Icons.near_me,
          label: 'ROUTE',
        ),
        const ButtonItem(
          color: Colors.grey,
          icon: Icons.share,
          label: 'SHARE',
        ),
      ],
    );
  }
}

class ButtonItem extends StatelessWidget {
  const ButtonItem({
    Key? key,
    required this.color,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
        ),
        Text(label),
      ],
    );
  }
}

// Bad Example
// Column buildButtonColumn(Color color, IconData icon, String label) {
//   return Column(
//     children: [
//       Icon(
//         icon,
//         color: color,
//       ),
//       Text(label),
//     ],
//   );
// }

class TitleSection extends StatelessWidget {
  const TitleSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.red),
      // ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          // const Icon(
          //   Icons.star,
          //   color: Colors.red,
          // ),
          // const Text('41'),
          const FavoriteWidget(),
        ],
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: _toggleFavorite,
          icon: (_isFavorited
              ? const Icon(Icons.star)
              : const Icon(Icons.star_border)),
          color: Colors.red,
        ),
        Text('$_favoriteCount'),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
}
