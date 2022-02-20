import 'package:flutter/material.dart';
import '../models/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Study Listview Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isGrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Text('전체 ${locations.length}개'),
                IconButton(
                  onPressed: handleListType,
                  icon: (isGrid ? Icon(Icons.list) : Icon(Icons.grid_view)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: (isGrid
                  ? GridView.builder(
                      itemCount: locations.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Icon(
                              locations[index].icon,
                              size: 40,
                              color: Colors.blue[500],
                            ),
                            Container(
                              child: Text(
                                locations[index].title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              child: Text(locations[index].subTitle),
                            ),
                          ],
                        );
                      },
                    )
                  : ListView.builder(
                      // primary: false,
                      itemCount: locations.length,
                      itemBuilder: (BuildContext context, int index) {
                        return BuildListTile(
                          title: locations[index].title,
                          subTitle: locations[index].subTitle,
                          icon: locations[index].icon,
                        );
                      },
                    )),
            ),
          ),
        ],
      ),
    );
  }

  void handleListType() {
    setState(() {
      isGrid ? isGrid = false : isGrid = true;
    });
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
