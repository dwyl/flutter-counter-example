
import 'package:counter_app_tdd/Domain/counter.dart';
import 'package:flutter/material.dart';


class CounterPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '0',
              style: TextStyle(fontSize:80.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              FloatingActionButton(
              onPressed: () {
              },
              child: Icon(Icons.add),
              tooltip: 'Increment',
              ),
              SizedBox(width: 20.0),
              FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.remove),
              tooltip: 'Decrement',
              ),

              ],)
            ],
          )));
  }
}

