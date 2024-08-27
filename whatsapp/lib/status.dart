import 'package:flutter/material.dart';

class UpdatesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Status', style: TextStyle(fontWeight: FontWeight.bold)),
                IconButton(
                  icon: Icon(Icons.add, color: Color(0xFF25D366)),
                  onPressed: () {
                    // Add status action here
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 120, // Adjust height as needed
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                // "My Status" section
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/avatar1.png'), // Replace with actual image
                        radius: 30,
                      ),
                      SizedBox(height: 4.0),
                      Text('My Status'),
                    ],
                  ),
                ),
                // Status list
                Container(
                  height: 120,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/avatar1.png'), // Replace with actual avatar images
                              radius: 30,
                            ),
                            SizedBox(height: 4.0),
                            Text('User ${index + 1}'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey),
          // Channels Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Channels', style: TextStyle(fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {
                    // Add see all action here
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(color: Color(0xFF25D366)),
                  ),
                ),
              ],
            ),
          ),
          // Group Chats List
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/avatar1.png'), // Replace with actual group image
                ),
                title: Text('Group 1'),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text('Last message in Group 1')),
                    Text('12:00 PM'), // Replace with actual time
                  ],
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/avatar1.png'), // Replace with actual group image
                ),
                title: Text('Group 2'),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text('Last message in Group 2')),
                    Text('12:00 PM'), // Replace with actual time
                  ],
                ),
              ),
            ],
          ),
          Divider(color: Colors.grey),
          // Grid View Container
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Grid View',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Container(
            height: 200, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: 150, // Adjust width as needed
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/images/avatar1.png'), // Replace with actual avatar image
                          radius: 30,
                        ),
                        SizedBox(height: 8.0),
                        Text('User ${index + 1}'),
                        SizedBox(height: 8.0),
                        ElevatedButton(
                          onPressed: () {
                            // Add follow action here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFF25D366), // WhatsApp green color
                          ),
                          child: Text('Follow'),
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
    );
  }
}

class UpdatesPage1 extends StatefulWidget {
  const UpdatesPage1({super.key});

  @override
  State<UpdatesPage1> createState() => _UpdatesPage1State();
}

class _UpdatesPage1State extends State<UpdatesPage1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Private', style: TextStyle(fontWeight: FontWeight.bold)),
                IconButton(
                  icon: Icon(Icons.add, color: Color(0xFF25D366)),
                  onPressed: () {
                    // Add status action here
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
