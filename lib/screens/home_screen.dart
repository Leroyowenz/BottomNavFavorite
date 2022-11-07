import 'package:flutter/material.dart';
import 'package:stateapp/widgets/favorites_widget.dart';
import 'package:stateapp/widgets/home_widget.dart';
import 'package:stateapp/widgets/profile_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _appBarOptions = [
    Text("Home Screen"),
    Text("Favorite Screen"),
    Text("Profile Screen"),
  ];
  static const List _widgetOption = <Widget>[
    HomeWidget(),
    FavoriteWidget(),
    ProfileWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOption.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_rounded),
            label: "favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        title: _appBarOptions.elementAt(_selectedIndex),
        // title: _widgetOption[_selectedIndex],
        elevation: 0,
      ),
    );
  }
}
