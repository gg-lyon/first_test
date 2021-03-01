import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_test/NumberOutput.dart';
import 'package:flutter_first_test/generateAPI.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Generation',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Random Number Generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<NumberOutput> futureNumberGenerator;
  NumberOutput output;

  @override
  void initState() {
    super.initState();
    futureNumberGenerator = fetchNumberGenerator();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: [
          RaisedButton(
            child: Text("Get a new random number"),
            onPressed: () async{
              NumberOutput response = await fetchNumberGenerator();
              setState(() {
                output = NumberOutput.fromJson(response.body);
              });
            },
            color: Colors.lightBlue,
          ),
          Text('output'),
          FutureBuilder<NumberOutput>(
              future: futureNumberGenerator,
              builder: (context,  snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.output);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                
                return CircularProgressIndicator();
    }
    )
        ],)
      ),
    );
  }
}
