import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:royal_travel/model_view/buses_model_view.dart';
import 'package:royal_travel/view/screens/home_screen.dart';
import 'package:royal_travel/view/screens/setting_screen.dart';

class NavigationScreen extends StatefulWidget {
  static const nV = "/navigation";
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

int _selectedIndex = 0;

class _NavigationScreenState extends State<NavigationScreen> {
  // List<Widget> _widgetOptions = [];
  void callbackItems() {
    Provider.of<BusesModelView>(context, listen: false).getBuses();
  }

  @override
  void initState() {
    super.initState();
    callbackItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Builder(
          builder: (context) {
            switch (_selectedIndex) {
              case 0:
                return HomeScreen();
              case 3:
                return SettingsScreen();
              default:
                return HomeScreen();
            }
          },
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 3, color: Theme.of(context).primaryColor),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 2,
              activeColor: Theme.of(context).accentColor,
              iconSize: 26,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              // tabActiveBorder:
              //     Border.all(color: Theme.of(context).highlightColor, width: 2),
              tabBackgroundColor: Colors.white,
              color: Theme.of(context).primaryColor,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.airplane_ticket,
                  text: 'Tickets',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
