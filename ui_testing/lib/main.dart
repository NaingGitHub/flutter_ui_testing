import 'package:flutter/material.dart';

import 'constraints_sample.dart';
import 'list_design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListDesign(),
    );
  }
}

class Tutotial1 extends StatelessWidget {
  const Tutotial1({super.key});

  @override
  Widget build(BuildContext context) {
    Widget randomImage = Image.network(
      'https://picsum.photos/200',
      fit: BoxFit.fitWidth,
      height: 250,
    );

    Widget imageTitle = Container(
      height: 100,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const Expanded(
            child: ListTile(
              title: Text(
                'Oeschinen Lake Campground',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Kandersteg, Switzerland',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
            size: 28,
          ),
          const Text(
            '41',
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );

    Widget iconRow = Container(
      padding: const EdgeInsets.fromLTRB(25, 10, 25, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          iconButton(Colors.blue, Icons.call, 'CALL'),
          iconButton(Colors.blue, Icons.near_me, 'ROUTE'),
          iconButton(Colors.blue, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget longText = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        '''Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run. Color and ColorSwatch constants which represent Material design's color palette.

Instead of using an absolute color from these palettes, consider using Theme.of to obtain the local ThemeData.colorScheme, which defines the colors that most of the Material components use by default.

Most swatches have colors from 100 to 900 in increments of one hundred, plus the color 50. The smaller the number, the more pale the color. The greater the number, the darker the color. The accent swatches (e.g. redAccent) only have the values 100, 200, 400, and 700.

In addition, a series of blacks and whites with common opacities are available. For example, black54 is a pure black with 54% opacity.
      ''',
        softWrap: true,
      ),
    );

    return Scaffold(
      body: ListView(
        children: [randomImage, imageTitle, iconRow, longText],
      ),
    );
  }

  Column iconButton(Color color, IconData iconData, String iconText) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 30,
          color: color,
        ),
        const Divider(
          height: 5,
        ),
        Text(
          iconText,
          style: TextStyle(color: color),
        )
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
