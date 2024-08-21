import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();
  int _num = 0;
  List _table = [];

  void _generate() {
    setState(() {
      try {
        _num = int.parse(_controller.text);
        _table = [];

        for (int i = 1; i <= 10; i++) {
          _table.add("$_num x $i= ${_num * i}");
        }
      } catch (e) {
        _table = ['invalid input'];
      }
    });
  }

  void _squareroot() {
    setState(() {
      _num = int.parse(_controller.text);
      
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Table',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new TextField(
                    controller: _controller,
                    decoration:
                        new InputDecoration(labelText: 'Enter your number'),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                print(_controller);
                _generate();
              },
              child: Text('generate'),
            ),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _table.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_table[index]),
                      );
                    })),
          ],
        ),
      );
}
