import 'package:flutter/material.dart';
import 'package:loginui/login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isObscured = true;
  final GlobalKey<FormState> _validatingfeilds = GlobalKey<FormState>();
  TextEditingController _Name = TextEditingController();
  TextEditingController _Email = TextEditingController();
  TextEditingController _Password = TextEditingController();
  TextEditingController _Repassword = TextEditingController();
  TextEditingController _Contact = TextEditingController();

  @override
  void dispose() {
    _Email.dispose();
    _Name.dispose();
    _Password.dispose();
    _Repassword.dispose();
    _Contact.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _validatingfeilds,
        child: Center(
          // offset: const Offset(0, -40),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Register your account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _Name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlue,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlue,
                        width: 3,
                      ),
                    ),
                    prefixIcon:
                        IconButton(onPressed: () {}, icon: Icon(Icons.person)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Name Field is Empty';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                    controller: _Email,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.lightBlue,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.lightBlue,
                          width: 3,
                        ),
                      ),
                      prefixIcon:
                          IconButton(onPressed: () {}, icon: Icon(Icons.email)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email Field is Empty';
                      } else {
                        return null;
                      }
                    }),
                SizedBox(height: 16.0),
                TextFormField(
                    controller: _Password,
                    obscureText: _isObscured,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.lightBlue,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.lightBlue,
                          width: 3,
                        ),
                      ),
                      prefixIcon:
                          IconButton(onPressed: () {}, icon: Icon(Icons.lock)),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscured ? Icons.visibility_off : Icons.visibility,
                          color: Colors.blueAccent,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password Field is Empty';
                      } else if (value.length < 6) {
                        return 'Password length must be 6';
                      } else {
                        return null;
                      }
                    }),
                SizedBox(height: 16.0),
                TextFormField(
                    obscureText: _isObscured,
                    controller: _Repassword,
                    decoration: InputDecoration(
                      labelText: 'Confirm-Password',
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.lightBlue,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.lightBlue,
                          width: 3,
                        ),
                      ),
                      prefixIcon:
                          IconButton(onPressed: () {}, icon: Icon(Icons.lock)),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscured ? Icons.visibility_off : Icons.visibility,
                          color: Colors.blueAccent,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value != _Password.text) {
                        return 'password dont match';
                      } else {
                        return null;
                      }
                    }),
                SizedBox(height: 16.0),
                TextFormField(
                    controller: _Contact,
                    decoration: InputDecoration(
                      labelText: 'Contact-No',
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.lightBlue,
                          width: 2,
                        ),
                      ),
                      prefixIcon:
                          IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.lightBlue,
                          width: 3,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Contact number Field is Empty';
                      }
                    }),
                SizedBox(
                  height: 16,
                ),
                TextButton(
                  onPressed: () {
                    if (_validatingfeilds.currentState!.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    }
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 70.0, vertical: 12.0),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
