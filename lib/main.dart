import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('counter')),
        body: Counter()
      )
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  // void addCount() {
  //   _counter++;
  // }

  final counterSubject = BehaviorSubject<int>(); //int를 입력받고 마지막에 입력받은 것을 return함. stream을 지원함

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(child: Text('add'), onPressed: () {
            counterSubject.add(++_counter);
          },),
          StreamBuilder<int>(
            stream: counterSubject.stream,
            initialData: 0,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('${snapshot.data}', style: TextStyle(fontSize: 30));
              } else {
                return null;
              }
            },
          ),
        ],
      )
    );
  }
}