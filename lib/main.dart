import 'dart:async';
import 'package:async/async.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_future/geo_location.dart';
import 'package:flutter_future/navigation_dialog.dart';
import 'package:flutter_future/navigation_first.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Future',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NavigationDialog(),
    );
  }
}

class FuturePage extends StatefulWidget {
  @override
  _FuturePageState createState() => _FuturePageState();
}


class _FuturePageState extends State<FuturePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back from the Future'),
      ),
      body: Center(
        child: Column(children: [
          Spacer(),
          ElevatedButton(
            child: Text('GO!'),
            onPressed: () {
            returnFG();
            },
          ),
          Spacer(),
          Text(result.toString()),
          Spacer(),
          CircularProgressIndicator(),
          Spacer(),
        ]),
      ),
    );
  }

  String? result;
  late Completer completer;

  Future getNumber() {
    completer = Completer<int>();
    calculate();
    return completer.future;
  }

  Future<Response> getData() async {
    const String? authority = 'www.googleapis.com';
    const String? path = '/books/v1/volumes/junbDwAAQBAJ';
    Uri url = Uri.http(authority, path);
    return http.get(url);
  }

  Future<int> returnOneAsync() async {
    await Future<int>.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future<int>.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future<int>.delayed(const Duration(seconds: 3));
    return 3;
  }

  Future count() async {
    int total = 0;
    total = await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();

    setState(() {
      result = total.toString();
    });
  }

  calculate() async {
    try {
      // ignore: unnecessary_new
      await new Future.delayed(Duration(seconds: 3));
      completer.complete(42);
    }
    catch (_) {
      completer.completeError([null]);
    }
  }

  void returnFG(){
    FutureGroup<int> futureGroup = FutureGroup<int>();
    futureGroup.add(returnOneAsync());
    futureGroup.add(returnTwoAsync());
    futureGroup.add(returnThreeAsync());
    futureGroup.close();
    futureGroup.future.then((List<int>value){
      int total = 0;
      for (var element in value) {
        total += element;
      }
      setState(() {
        result = total.toString();
      });
    });
  }
  Future returnError(){
    throw ('An error occurred!');
  }

  Future handleError() async{
    try{
      await returnError();
    }
    catch(error){
      setState(() {
        result = 'error';
      });
    }
    finally{
      print('Complete');
    }

  }
}
