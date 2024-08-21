import 'package:flutter/material.dart';
import 'package:whatsapp/calls.dart';
import 'package:whatsapp/groups.dart';
import 'updates.dart'; // Import the updates.dart file

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'WhatsApp';

    // Define the custom color
    final Color customColor = const Color(0xFF273443);

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primaryColor: customColor, // Sets the primary color (used for AppBar)
        scaffoldBackgroundColor:
            customColor, // Sets the background color for Scaffold
        appBarTheme: AppBarTheme(
          backgroundColor: customColor, // Ensure AppBar uses the primary color
          titleTextStyle: const TextStyle(
            color: Colors.white, // Set the title color to white
            fontWeight: FontWeight.bold, // Set the title to bold
            fontSize: 20, // Adjust the font size if needed
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // To track the selected tab

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      // Navigate to UpdatesScreen when the second item is tapped
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UpdatesScreen()),
      );
    }
    if (index == 2) {
      // Navigate to UpdatesScreen when the second item is tapped
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Groups()),
      );
    }
    if (index == 3) {
      // Navigate to UpdatesScreen when the second item is tapped
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Calls()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('WhatsApp'),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt, color: Colors.white),
            onPressed: () {
              // Define the action when the camera icon is pressed
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              // Define the action when the menu icon is pressed
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 10,
                      height: 10,
                      child: Image.asset('assets/images/meta.png'),
                    ),
                  ),
                  hintText: 'Ask Meta AI or Search',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar1.png'),
                  ),
                  title: Text(
                    'Chat ${index + 1}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    'Last message...',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  trailing: Text(
                    '12:00 PM',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  onTap: () {
                    // Define the action when a chat item is tapped
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //define the action when pressed
        },
        backgroundColor: const Color.fromARGB(255, 52, 175, 56),
        child: Icon(Icons.message),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF273443),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
