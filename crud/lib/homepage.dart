import 'package:crud/createuser.dart';
import 'package:crud/updateuser.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // AnimationController
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
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return ScaleTransition(
      scale: _animation,
      child: ElevatedButton(
        onPressed: () {
          _animationController.forward();
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          backgroundColor: Colors.deepOrangeAccent,
          foregroundColor: Colors.white,
          shadowColor: Colors.deepOrange.withOpacity(0.5),
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CRUD Operations',
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
              Color(0xFFFFB6A4),
              Color(0xFFFF9A8B),
              Color(0xFFFF6F61),
              Color(0xFFFFE0E0),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              _buildButton('Create User', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateUserPage()),
                );
              }),
              const SizedBox(height: 20),
              _buildButton('Get User', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdateUserPage()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
