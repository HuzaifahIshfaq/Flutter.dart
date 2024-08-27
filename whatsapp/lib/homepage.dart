import 'package:flutter/material.dart';
import 'package:whatsapp/calls.dart';
import 'package:whatsapp/groups.dart';
import 'package:whatsapp/status.dart'; // Import UpdatesPage and UpdatesPage1 here

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();
  bool _isScrollingToUpdatesPage1 = false;

  final List<Widget> _pages = [
    HomePageContent(),
    UpdatesPage(), // Page for scrolling
    GroupsPage(),
    CallsPage(),
  ];

  final List<Widget> _pagesWithUpdates1 = [
    HomePageContent(),
    UpdatesPage1(), // Page for BottomNavigationBar tap
    GroupsPage(),
    CallsPage(),  
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _isScrollingToUpdatesPage1 = false;
      _pageController.jumpToPage(index); // Jump to the selected page
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
      if (_isScrollingToUpdatesPage1 && index == 1) {
        _pageController.jumpToPage(1); // Ensure UpdatesPage1 is visible
      }
      _isScrollingToUpdatesPage1 = false; // Reset flag after scrolling
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'WhatsApp',
          style: TextStyle(color: Color(0xFF25D366)), // WhatsApp green color
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt, color: Color(0xFF25D366)),
            onPressed: () {
              // Add your camera action here
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Color(0xFF25D366)),
            onPressed: () {
              // Add your 3-dots action here
            },
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _isScrollingToUpdatesPage1
            ? _pagesWithUpdates1
            : _pages, // Use _pagesWithUpdates1 if scrolling to UpdatesPage1
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Set the current index
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update_sharp),
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
        selectedItemColor: Color(0xFF25D366), // WhatsApp green color
        unselectedItemColor: Colors.grey, // Color for unselected items
        onTap: (index) {
          if (index == 1) {
            setState(() {
              _isScrollingToUpdatesPage1 =
                  false; // Reset flag on tapping Updates icon
            });
            _pageController.jumpToPage(1); // Navigate to UpdatesPage
          } else {
            _onItemTapped(index);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF25D366), // WhatsApp green color
        child: Icon(Icons.chat),
        onPressed: () {
          // Add your floating action button action here
        },
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.roundabout_left_rounded,
                  color:
                      Color.fromARGB(255, 88, 36, 230)), // Hollow circle icon
              hintText: 'Search',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/avatar1.png'), // Replace with actual avatar images
                ),
                title: Text('Chat Title ${index + 1}'),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text('Last message ${index + 1}')),
                    Text('12:00 PM'), // Replace with actual time
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
