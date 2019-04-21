import 'package:flutter/material.dart';
import 'package:flutter_rxdart_app/counter_bloc.dart';
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

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CounterBloc _counterBloc = CounterBloc(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter RxDart"),
      ),
      body: SafeArea(
        child: Center(
          child: StreamBuilder<int>(
            stream: _counterBloc.counterObservable,
            builder: (context, snapshot) {
              return Text(
                "${snapshot.data}",
                style: Theme.of(context).textTheme.display2,
              );
            }
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              _counterBloc.increment();
            },
          ),
          SizedBox(height: 16.0,),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              setState(() {
                _counterBloc.decrement();
              });
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
}
