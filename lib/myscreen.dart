import 'package:flutter/material.dart';
import 'package:flutter_playground/Login_bottom_sheet.dart';

class Myyyscreeeeen extends StatefulWidget {
  _MyyyscreeeeenState createState() => _MyyyscreeeeenState();
}

class _MyyyscreeeeenState extends State<Myyyscreeeeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: FlatButton(
          color: Colors.green,
          child: Text('Show'),
          onPressed: () {
            _showMyBottomSheet();
          },
        ),
      ),
      appBar: AppBar(
        title: Text('Test App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.open_in_new),
            onPressed: () {
              _showMyBottomSheet();
            },
          )
        ],
      ),
    );
  }

  void _showMyBottomSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        context: context,
        builder: (BuildContext context) {
          return ShowLoginBottomModalSheet(); // returns your BottomSheet widget
        });
  }
}
