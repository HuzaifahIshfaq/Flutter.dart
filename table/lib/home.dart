import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:table/table.dart';

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

        for (int i = 10; i >= 1; i--) {
          _table.add("$_num x $i= ${_num * i}");
        }
      } catch (e) {
        _table = ['invalid input'];
      }
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Huz(list: _table)));
              },
              child: Text('generate'),
            ),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _table.length,
                    itemBuilder: (context, index) {
                      return Text(_table[index]);
                    })),
          ],
        ),
      );
}
