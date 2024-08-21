import 'package:flutter/material.dart';

class Secondscreen extends StatefulWidget {
  final String? textFirstName;
  const Secondscreen({Key? key, required this.textFirstName}) : super(key: key);

  @override
  State<Secondscreen> createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
  TextEditingController secondNameController = TextEditingController();

  @override
  void dispose() {
    secondNameController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('secondscreen'),
      ),
      body: Column(
        children: [
          Text(widget.textFirstName!),
          TextFormField(
            controller: secondNameController,
            decoration: InputDecoration(hintText: 'Enter last name'),
          ),
          Center(
            child: TextButton(
              child: Text('Send to first screen'),
              onPressed: () {
                Navigator.of(context).pop(secondNameController.text);
              },
            ),
          ),
        ],
      ),
    );
  }
}
