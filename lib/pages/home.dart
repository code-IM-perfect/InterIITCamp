import 'package:camp/pages/dynamic_data.dart';
import 'package:camp/pages/notification_editor.dart';
import 'package:camp/pages/static_data.dart';
import 'package:flutter/material.dart';
import 'image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            [
              "Images from the Web",
              "Fetch Books",
              "",
              "Notification Interval"
            ][currentPageIndex],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.image),
              icon: Icon(Icons.image_outlined),
              label: "Image",
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.data_object),
              icon: Icon(Icons.data_object_outlined),
              label: "Static",
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.water),
              icon: Icon(Icons.water_outlined),
              label: "Weather",
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.edit_notifications),
              icon: Icon(Icons.edit_notifications_outlined),
              label: "Notifications",
            ),
          ],
          selectedIndex: currentPageIndex,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: [
            const ImagePage(),
            const StaticData(),
            const LiveData(),
            const NotificationEditor(),
          ][currentPageIndex],
        ));
  }
}
