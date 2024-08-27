import 'package:flutter/material.dart';

class Huz extends StatefulWidget {
  var list = [];
  Huz({super.key, required this.list});
  @override
  State<Huz> createState() => _HuzState();
}

class _HuzState extends State<Huz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.list.length,
              itemBuilder: (context, index) {
                return Text(widget.list[index]);
              })),
    );
  }
}
