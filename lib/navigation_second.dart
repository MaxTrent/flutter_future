import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    Color color;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Navigation Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: (){
                  color = Colors.red;
                  Navigator.pop(context, color);
                },
                child: Text('Red')),

            ElevatedButton(
                onPressed: (){
                  color = Colors.yellow;
                  Navigator.pop(context, color);
                },
                child: Text('Yellow')),

            ElevatedButton(
                onPressed: (){
                  color = Colors.green;
                  Navigator.pop(context, color);
                },
                child: Text('Green')),
          ],

        ),
      ),
    );
  }
}
