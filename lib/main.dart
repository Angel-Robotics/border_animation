import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _counter = 0;
  double _width = 0.0;
  double _height = 0.0;

  Animation<double> _animation;
  AnimationController _animationController;
  Animation<double> _animation2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 250));
//    _animation = Tween(begin: 0.0, end: 18.0).animate(_animationController);
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _animation2 = CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print("Completed");
        _animationController.reverse();
      }
    });
  }


  void _incrementCounter() {
    _animationController.forward();
    print(Theme.of(context).textTheme.headline1.fontSize);
    print(Theme.of(context).textTheme.headline2.fontSize);
    print(Theme.of(context).textTheme.headline3.fontSize);
    print(Theme.of(context).textTheme.headline4.fontSize);
    print(Theme.of(context).textTheme.headline5.fontSize);
    print(Theme.of(context).textTheme.headline6.fontSize);
    print(Theme.of(context).textTheme.subtitle1.fontSize);
    print(Theme.of(context).textTheme.subtitle2.fontSize);
    print(Theme.of(context).textTheme.bodyText1.fontSize);
    print(Theme.of(context).textTheme.bodyText2.fontSize);
    print(Theme.of(context).textTheme.caption.fontSize);
    print(Theme.of(context).textTheme.button.fontSize);
    print(Theme.of(context).textTheme.button.fontSize);

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    print("device pixel ratio : ${MediaQuery.of(context).devicePixelRatio}");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: _animation2.value * 24, color: Colors.blueAccent[100]),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: _animation2.value * 16, color: Colors.blueAccent[400]),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: Container(
              decoration: BoxDecoration(border: Border.all(width: _animation.value * 8, color: Colors.blueAccent)),
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 0,
            top: 32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Width: $_width Height: $_height"),
                Text(
                  "Sample Text",
                ),
                RaisedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "알림",
                              style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold),
                            ),
                            content: Text(
                              "안녕하세요 빈센트 반 고흐의 대표작 중 하나로 꼽히는 별이 빛나는 밤은 그가"
                              "고갱과 다툰 뒤 자신의 귀를 자른 사건 이후 생레미의 요양원에 있을 때 그린 것이다",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            actions: <Widget>[
                              ButtonBar(
                                children: <Widget>[
                                  FlatButton(
                                    child: Text(
                                      "아니요",
                                      style: Theme.of(context).textTheme.headline6,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  FlatButton(
                                    child: Text(
                                      "예",
                                      style: Theme.of(context).textTheme.headline6,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              )
                            ],
                          );
                        });
                  },
                )
              ],
            ),
          )
        ],
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
