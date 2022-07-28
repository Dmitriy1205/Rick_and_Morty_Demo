import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/widgets/character_items.dart';

import '../widgets/episode_items.dart';
import '../widgets/location_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: const Text(
          'Rick & Morty',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            label: 'Character',
            icon: Icon(
              Icons.accessibility,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Location',
            icon: Icon(
              Icons.local_offer_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Episode',
            icon: Icon(
              Icons.local_library_rounded,
            ),
          ),
        ],
      ),
    );
  }

  Widget getBody() {
    if (_selectedIndex == 0) {
      return const CharacterItems();
    } else if (_selectedIndex == 1) {
      return const LocationItems();
    } else {
      return const EpisodeItems();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
