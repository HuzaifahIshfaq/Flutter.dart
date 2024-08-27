import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Models/usermodel.dart';

class CreateUserPage extends StatefulWidget {
  @override
  _CreateUserPageState createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        }
      });
  }

  @override
  void dispose() {
    _userIdController.dispose();
    _idController.dispose();
    _titleController.dispose();
    _bodyController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> createUser() async {
    final user = UserModel(
      userId: int.tryParse(_userIdController.text),
      id: int.tryParse(_idController.text),
      title: _titleController.text,
      body: _bodyController.text,
    );

    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 201) {
      // Show success message and clear fields
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('User Created Successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      // Clear the text fields
      _userIdController.clear();
      _idController.clear();
      _titleController.clear();
      _bodyController.clear();
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Failed to Create User'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Widget _buildTextField(
      String labelText, TextEditingController controller, TextInputType type) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white70),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.black87), // Dark border color
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.black87), // Dark border color
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.black54), // Darker gray border
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create User',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFF6F61), // Sunset Orange
        elevation: 5,
        shadowColor: const Color(0xFFFF6F61).withOpacity(0.5),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFB6A4), // Peach
              Color(0xFFFF9A8B), // Coral Pink
              Color(0xFFFF6F61), // Sunset Orange
              Color(0xFFFFE0E0), // Light Peach
            ],
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField('User ID', _userIdController, TextInputType.number),
            _buildTextField('ID', _idController, TextInputType.number),
            _buildTextField('Title', _titleController, TextInputType.text),
            _buildTextField('Body', _bodyController, TextInputType.text),
            const SizedBox(height: 20),
            ScaleTransition(
              scale: _animation,
              child: ElevatedButton(
                onPressed: () {
                  _animationController.forward();
                  createUser();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Create',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
