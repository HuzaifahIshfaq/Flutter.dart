import 'package:flutter/material.dart';
import 'package:task/secondscreen.dart';

class Firstscreen extends StatefulWidget {
  const Firstscreen({super.key});

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  TextEditingController firstNameController = TextEditingController();
  String fullNameString = '';
  @override
  void dispose() {
    firstNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First screen'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: firstNameController,
            decoration: InputDecoration(hintText: 'enter your first name'),
          ),
          Center(
            child: TextButton(
              child: Text('Enter first name'),
              onPressed: () async {
                await Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (context) => Secondscreen(
                              textFirstName: firstNameController.text,
                            )))
                    .then((value) {
                  setState(() {
                    fullNameString =
                        'Full name is : ${firstNameController.text} $value';
                  });
                });
              },
            ),
          ),
          Text(fullNameString),
        ],
      ),
    );
  }
}
