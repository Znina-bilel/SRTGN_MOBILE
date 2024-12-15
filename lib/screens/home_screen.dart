import 'package:flutter/material.dart';
import '../bottom_screens/home.dart';
import '../bottom_screens/contact.dart';
import '../bottom_screens/more.dart';
import '../bottom_screens/settings.dart';
import '../bottom_screens/map.dart';
import '../bottom_screens/Equipement.dart';
import '../bottom_screens/abonnement.dart';
import '../bottom_screens/la_srtgn.dart';
import '../bottom_screens/lignes.dart';
import '../bottom_screens/live.dart';
import '../bottom_screens/nos_agences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _animationController;
  double _navBarHeight = kBottomNavigationBarHeight;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _navigator(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleNavBar() {
    setState(() {
      _navBarHeight == kBottomNavigationBarHeight
          ? _navBarHeight = 2 * kBottomNavigationBarHeight
          : _navBarHeight = kBottomNavigationBarHeight;
    });
  }

  final List<Widget> _pages = [
    Home(),
    Lignes(),
    Settings(),
    Map(),
    Contact(),
    More(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('SRTGN'),
        actions: [
          _ShiningButton(),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            _buildDrawerItem('La SRTGN', La()),
            _buildDrawerItem('Nos Agences', NosAgences()),
            _buildDrawerItem('Equipements', Equipement()),
            _buildDrawerItem('Abonnements', AboPage()),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: _navBarHeight,
        child: BottomAppBar(
          color: Color.fromARGB(255, 0, 48, 73), // Elegant Navy
          // Elegant Navy
          // Soft Blue
          // Set the background color of the BottomAppBar
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.home,
                    color: Colors.white), // Set the icon color to white
                onPressed: () {
                  _navigator(0);
                  _toggleNavBar();
                },
              ),
              IconButton(
                icon: Icon(Icons.directions_bus,
                    color: Colors.white), // Set the icon color to white
                onPressed: () {
                  _navigator(1);
                  _toggleNavBar();
                },
              ),
              IconButton(
                icon: Icon(Icons.settings,
                    color: Colors.white), // Set the icon color to white
                onPressed: () {
                  _navigator(2);
                  _toggleNavBar();
                },
              ),
              IconButton(
                icon: Icon(Icons.map,
                    color: Colors.white), // Set the icon color to white
                onPressed: () {
                  _navigator(3);
                  _toggleNavBar();
                },
              ),
              IconButton(
                icon: Icon(Icons.contact_phone,
                    color: Colors.white), // Set the icon color to white
                onPressed: () {
                  _navigator(4);
                  _toggleNavBar();
                },
              ),
              IconButton(
                icon: Icon(Icons.more_horiz,
                    color: Colors.white), // Set the icon color to white
                onPressed: () {
                  _navigator(5);
                  _toggleNavBar();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String title, Widget screen) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}

class _ShiningButton extends StatefulWidget {
  @override
  __ShiningButtonState createState() => __ShiningButtonState();
}

class __ShiningButtonState extends State<_ShiningButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: TweenAnimationBuilder(
        tween: ColorTween(
          begin: Colors.green.withOpacity(0.5),
          end: Colors.green,
        ),
        duration: Duration(seconds: 1),
        builder: (context, color, child) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LivePage()),
                );
              },
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.white),
                  SizedBox(width: 8.0),
                  Text(
                    "En directe",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
