import 'package:flutter/material.dart';

class ChooseLocationPage extends StatefulWidget {
  @override
  _ChooseLocationPageState createState() => _ChooseLocationPageState();
}

class _ChooseLocationPageState extends State<ChooseLocationPage> {
  void getData() async {
    // simulate a network request for a username
    String username = await Future.delayed(Duration(seconds: 3), () {
      return 'jade';
    });

    // simulate a network request to gey bio of username
    String bio = await Future.delayed(Duration(seconds: 2), () {
      return 'Green, blue ';
    });

    print('$username- $bio');
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Text('Choose Location'),
    );
  }
}
