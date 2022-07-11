import 'package:flutter/material.dart';

class NavigationDialog extends StatefulWidget {

  @override
  State<NavigationDialog> createState() => _NavigationDialogState();
}

class _NavigationDialogState extends State<NavigationDialog> {
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
          title: Text(
              'Navigation Dialog'
          )),
      body: Center(
        child: ElevatedButton(
          child: Text('Change Color'),
          onPressed: () {
            _showColorDialog(context);
          },
        ),
      ),
    );
  }


  _showColorDialog(BuildContext context) async {
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) =>
            AlertDialog(
              title: Text('Important Question'),
              content: Text('Select a colour'),
              actions: [
                TextButton(
                  child: Text('Red'),
                  onPressed: () {
                    color = Colors.red;
                    Navigator.pop(context, color);
                  },
                ),
                TextButton(
                  child: Text('Yellow'),
                  onPressed: () {
                    color = Colors.yellow;
                    Navigator.pop(context, color);
                  },
                ),

                TextButton(
                  child: Text('Green'),
                  onPressed: () {
                    color = Colors.green;
                    Navigator.pop(context, color);
                  },
                ),
              ],
            ),
    );
    setState(() {
      color = color;
    });;
  }
}