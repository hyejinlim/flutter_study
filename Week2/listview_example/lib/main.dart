import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

List<Map> listData = [
  {
    'title': 'CineArts at the Empire',
    'subTitle': '85 W Portal Ave',
    'icon': Icons.theaters
  },
  {
    'title': 'The Castro Theater',
    'subTitle': '429 Castro St',
    'icon': Icons.theaters
  },
  {
    'title': 'Alamo Drafthouse Cinema',
    'subTitle': '2550 Mission St',
    'icon': Icons.theaters
  },
  {
    'title': 'Roxie Theater',
    'subTitle': '3117 16th St',
    'icon': Icons.theaters
  },
  {
    'title': 'United Artists Stonestown Twin',
    'subTitle': '501 Buckingham Way',
    'icon': Icons.theaters
  },
  {
    'title': 'AMC Metreon 16',
    'subTitle': '135 4th St #3000',
    'icon': Icons.theaters
  },
  {
    'title': 'K\'s Kitchen',
    'subTitle': '757 Monterey Blvd',
    'icon': Icons.restaurant
  },
  {
    'title': 'Emmy\'s Restaurant',
    'subTitle': '1923 Ocean Ave',
    'icon': Icons.restaurant
  },
  {
    'title': 'Chaiya Thai Restaurant',
    'subTitle': '272 Claremont Blvd',
    'icon': Icons.restaurant
  },
  {'title': 'La Ciccia', 'subTitle': '291 30th St', 'icon': Icons.restaurant},
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Study Listview Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Listview Example'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('전체 ${listData.length}개'),
                  Icon(Icons.list),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                // primary: false,
                itemCount: listData.length,
                itemBuilder: (BuildContext context, int index) {
                  return BuildListTile(
                    title: listData[index]['title'],
                    subTitle: listData[index]['subTitle'],
                    icon: listData[index]['icon'],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BuildListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;

  const BuildListTile({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )),
      subtitle: Text(subTitle),
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
    );
  }
}
