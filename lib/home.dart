import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:video_sharing/video.dart' as first;
import 'package:video_sharing/record.dart' as second;

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<String> notifications1 = [
    "Welcome To Video Sharing App",
    "Nisha Just Posted an Video"
  ]; // List to store dummy notifications

  String _searchText = '';

  void _performSearch() {
    if (_searchText.isNotEmpty) {
      // Perform search operation using the _searchText value
      print('Performing search for: $_searchText');
    }
  }

  String _selectedFilter = 'All'; // Initially selected filter option

  void _showFilterOptions(BuildContext context) {
    showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(400, 50, 200, 500),
      items: const [
        PopupMenuItem(
          value: 'All',
          child: Text('All'),
        ),
        PopupMenuItem(
          value: 'Latest',
          child: Text('Latest'),
        ),
        PopupMenuItem(
          value: 'Popular',
          child: Text('Popular'),
        ),
      ],
      initialValue: _selectedFilter,
    ).then((value) {
      if (value != null) {
        setState(() {
          _selectedFilter = value;
          print('Filter: $_selectedFilter');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                print("Notifications are: $notifications1");
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.notifications),
                  SizedBox(width: 8.0),
                  Text(
                    'Notifications',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _performSearch,
                  ),
                  hintText: 'Search videos...',
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) {
                  // Perform search operation
                  _searchText = value;
                },
                onSubmitted: (_) {
                  _performSearch();
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.filter_list),
              tooltip: "Filter",
              onPressed: () {
                _showFilterOptions(context);
              },
            ),
            const VideoList(),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                // Navigate to the next page
              },
              child: Container(
                color: Colors.red,
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        print("Add Video");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => second.VideoRecord(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add),
                      color: Colors.white,
                    ),
                    const SizedBox(width: 20.0),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => print("Library"),
                          icon: const Icon(Icons.video_library),
                          color: Colors.white,
                        ),
                        // TextButton(
                        //   child: const Text(
                        //     'Library',
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 16.0,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ),
                        //   onPressed: () => print("Next Page"),
                        // ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class VideoList extends StatelessWidget {
//   const VideoList({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Container(
//         width: 80,
//         height: 60,
//         color: Colors.grey[300],
//         // Replace with your thumbnail image
//         child: Image.network(
//           'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
//           fit: BoxFit.cover,
//         ),
//       ),
//       title: Text('Video Title'),
//       subtitle: Text('User Profile - Location - X days ago'),
//     );
//   }
// }
class VideoList extends StatelessWidget {
  const VideoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 425,
                height: 238,
                color: Colors.grey,
                // Replace this with your thumbnail imagechild:
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Your onPressed function here
                        print('Container pressed');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => first.VideoPage(),
                          ),
                        );
                      },
                      child: Image.network(
                        width: 425,
                        height: 238,
                        'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                        fit: BoxFit.cover,
                      ),
                      // child: const Center(
                      //     // child: Text(
                      //     //   'Press Me',
                      //     //   style: TextStyle(
                      //     //     color: Colors.white,
                      //     //     fontSize: 16,
                      //     //   ),
                      //     // ),
                      //     ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Video Title $index',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 4.0),
              Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 14.0,
                    // Replace this with user profile image
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    'Username',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 3.0),
                  Text('•'),
                  SizedBox(width: 3.0),
                  Text('Location'),
                  SizedBox(width: 8.0),
                  Text('•'),
                  SizedBox(width: 8.0),
                  Text('Posted X days ago'),
                  SizedBox(width: 8.0),
                  Text('•'),
                  SizedBox(width: 8.0),
                  Text('Views'),
                  SizedBox(width: 8.0),
                  Text('•'),
                  SizedBox(width: 8.0),
                  Text('Category'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
