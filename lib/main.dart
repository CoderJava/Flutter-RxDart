import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter RxDart"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                child: Text("Publish Subject"),
                onPressed: () {
                  PublishSubject<int> subject = PublishSubject<int>();
                  subject.stream.listen((value) => print("pertama $value"));
                  subject.add(1);
                  subject.add(2);

                  subject.stream.listen((value) => print("kedua $value"));
                  subject.add(3);
                },
              ),
              RaisedButton(
                child: Text("Behavior Subject"),
                onPressed: () {
                  BehaviorSubject<int> subject = BehaviorSubject<int>();
                  subject.stream.listen((value) => print("pertama $value"));
                  subject.add(1);
                  subject.add(2);
                  subject.add(3);
                  subject.stream.listen((value) => print("kedua $value"));
                },
              ),
              RaisedButton(
                child: Text("Replay Subject"),
                onPressed: () {
                  ReplaySubject<int> subject = ReplaySubject();
                  subject.add(1);
                  subject.add(2);
                  subject.add(3);
                  subject.stream.listen((value) => print(value));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
