import 'package:fineartsociety/utils/constants.dart';
import 'package:flutter/material.dart';

class HangerDrawer extends StatelessWidget {
  const HangerDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: appThemeColour,
            ),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            selected: true,
            onTap: () {
              // Update the state of the app
              // Then close the drawer
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            title: const Text('Find ATM'),
            selected: false,
            onTap: () {
              // Update the state of the app
              // Then close the drawer
              Navigator.pushNamed(context, '/findAtm');
            },
          ),
          ListTile(
            title: const Text('Customer Support'),
            selected: false,
            onTap: () {
              // Update the state of the app
              // Then close the drawer
              Navigator.pushNamed(context, '/customerSupport');
            },
          ),
          ListTile(
            title: const Text('Host Atm'),
            selected: false,
            onTap: () {
              // Update the state of the app
              // Then close the drawer
              Navigator.pushNamed(context, '/hostAtm');
            },
          ),
        ],
      ),
    );
  }
}
