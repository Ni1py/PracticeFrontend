import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  Scaffold(
        backgroundColor: Colors.deepPurple[400],
        body: const SingleChildScrollView(child: Gallery()),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Color.fromARGB(255, 138, 10, 161), Color.fromARGB(255, 205, 12, 66)]
              )
            ),
          ),
          title: const Center(
            child: Text(
              "Gallery", 
              style: TextStyle(
                color: Color.fromARGB(255, 248, 137, 244),
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            )
          )
        ),
      )
    );
  }
}

BoxDecoration _myBoxDecoration() {
  return BoxDecoration(
    color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
    border: Border.all(
      color: Colors.black,
      width: 2.0,
    ),
    boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))],
  );
}

Container _myContainer() {
  return Container(
    width: 200,
    height: 200,
    decoration: _myBoxDecoration(),
  );
}

ElevatedButton _myButton(String str, VoidCallback fun) {
  return ElevatedButton(
    onPressed: fun,
    style: ButtonStyle(
      fixedSize: MaterialStateProperty.all(const Size(200, 40)),
      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 223, 26, 81)),
    ), 
    child: Text(
      str,
      style: TextStyle(
        color: Color.fromARGB(255, 98, 243, 207),
        fontSize: 22,
        fontStyle: FontStyle.italic,
      ),
    ),
  );
}

Container _containerRow(double margin, List<Container> row) {
  return Container(
    margin: EdgeInsets.only(top: margin),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: row,
    ),
  );
}

class Gallery extends StatefulWidget {
  const Gallery({ Key? key }) : super(key: key);
  
  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  List<Container> _row1 = [];
  List<Container> _row2 = [];

  void _addContainer() {
    setState(() {
      if (_row1.length != 4) {
        _row1.add(_myContainer());
      }
      else if (_row2.length != 4) {
        _row2.add(_myContainer());
      }
    });
  }

  void _deleteContainer() {
    setState(() { 
      if ((_row1.length == 4) && (_row2.isNotEmpty)) {
        _row2.removeLast(); 
      }
      else if ((_row2.isEmpty) && (_row1.isNotEmpty)) {
        _row1.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _myButton('Add an item', _addContainer),
              _myButton('Delete item', _deleteContainer),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                _containerRow(50.0, _row1),
                _containerRow(70.0, _row2),
              ],
            ),
          ),
        ],
      )
    );
  }
}
