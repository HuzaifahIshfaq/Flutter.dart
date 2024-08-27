import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Models/usermodel.dart';

class UpdateUserPage extends StatefulWidget {
  @override
  _UpdateUserPageState createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  List<UserModel> _users = [];
  List<UserModel> _filteredUsers = [];
  bool _isLoading = true;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchUsers();
    _searchController.addListener(() {
      _filterUsers();
    });
  }

  Future<void> _fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      setState(() {
        _users = userJson.map((json) => UserModel.fromJson(json)).toList();
        _filteredUsers = _users; // Initialize filtered list
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _filterUsers() {
    final query = _searchController.text;
    if (query.isEmpty) {
      setState(() {
        _filteredUsers = _users;
      });
    } else {
      setState(() {
        _filteredUsers =
            _users.where((user) => user.id.toString().contains(query)).toList();
      });
    }
  }

  Future<void> _showEditDialog(UserModel user) async {
    final TextEditingController idController =
        TextEditingController(text: user.id.toString());
    final TextEditingController titleController =
        TextEditingController(text: user.title);
    final TextEditingController bodyController =
        TextEditingController(text: user.body);

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit User ${user.id}'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                _buildTextField('ID', idController, TextInputType.number),
                _buildTextField('Title', titleController, TextInputType.text),
                _buildTextField('Body', bodyController, TextInputType.text),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Update'),
              onPressed: () async {
                final updatedUser = UserModel(
                  userId: user.userId,
                  id: int.tryParse(idController.text),
                  title: titleController.text,
                  body: bodyController.text,
                );
                await _updateUser(updatedUser);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _updateUser(UserModel user) async {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/${user.id}'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User Updated Successfully!'),
          backgroundColor: Colors.green,
        ),
      );
      _fetchUsers(); // Refresh the user list after update
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to Update User'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _deleteUser(UserModel user) async {
    final response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/${user.id}'),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User Deleted Successfully!'),
          backgroundColor: Colors.green,
        ),
      );
      _fetchUsers(); // Refresh the user list after deletion
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to Delete User'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _showDeleteDialog(UserModel user) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete User ${user.id}'),
          content: const Text('Are you sure you want to delete this user?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Delete'),
              onPressed: () async {
                await _deleteUser(user);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
          labelStyle: TextStyle(color: Colors.black87),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.black87),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.black87),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.black54),
          ),
        ),
        style: TextStyle(color: Colors.black87),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Users'),
        backgroundColor: const Color(0xFFFF6F61), // Sunset Orange
        elevation: 5,
        shadowColor: const Color(0xFFFF6F61).withOpacity(0.5),
      ),
      body: Container(
        color: const Color(0xFFFFE0E0), // Light Peach
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search by ID',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: _filteredUsers.length,
                      itemBuilder: (context, index) {
                        final user = _filteredUsers[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: Colors.black54),
                          ),
                          color: const Color(0xFFFFB6A4), // Peach
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16.0),
                            title: Text(
                              'ID: ${user.id}\nUserID: ${user.userId}\nTitle: ${user.title}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(user.body ?? ''),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    _showEditDialog(user);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    _showDeleteDialog(user);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
