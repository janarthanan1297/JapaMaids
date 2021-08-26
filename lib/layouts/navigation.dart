import 'package:flutter/material.dart';
import 'package:japamaids/layouts/home.dart';

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({Key key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[MyHomePage(), Container(), Container(), Container(), Container()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: 56,
        child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    'assets/image/home.png',
                  ),
                  color: Colors.black,
                ),
                activeIcon: ImageIcon(
                  AssetImage(
                    'assets/image/home2.png',
                  ),
                  color: Color(0xFF94e7ef),
                ),
                title: Text(
                  '',
                  style: TextStyle(height: 0),
                ),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    'assets/image/grandmother.png',
                  ),
                  color: Colors.black,
                ),
                activeIcon: ImageIcon(
                  AssetImage(
                    'assets/image/grandmother2.png',
                  ),
                  color: Color(0xFF94e7ef),
                ),
                title: Text(
                  '',
                  style: TextStyle(height: 0),
                ),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    'assets/image/community.png',
                  ),
                  color: Colors.black,
                ),
                activeIcon: ImageIcon(
                  AssetImage(
                    'assets/image/community2.png',
                  ),
                  color: Color(0xFF94e7ef),
                ),
                title: Text(
                  '',
                  style: TextStyle(height: 0),
                ),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    'assets/image/stethoscope.png',
                  ),
                  color: Colors.black,
                ),
                activeIcon: ImageIcon(
                  AssetImage(
                    'assets/image/stethoscope2.png',
                  ),
                  color: Color(0xFF94e7ef),
                ),
                title: Text(
                  '',
                  style: TextStyle(height: 0),
                ),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    'assets/image/menu.png',
                  ),
                  color: Colors.black,
                ),
                activeIcon: ImageIcon(
                  AssetImage(
                    'assets/image/menu2.png',
                  ),
                  color: Color(0xFF94e7ef),
                ),
                title: Text(
                  '',
                  style: TextStyle(height: 0),
                ),
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            iconSize: 30,
            onTap: _onItemTapped,
            elevation: 10),
      ),
    );
  }
}
