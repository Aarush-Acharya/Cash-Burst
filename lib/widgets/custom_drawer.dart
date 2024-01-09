import 'package:flutter/material.dart';

class HangerDrawer extends StatelessWidget {
  const HangerDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xffB00B29),
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
              title: const Text('ATM'),
              selected: false,
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Deposit'),
              selected: false,
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Browse Bank'),
              selected: false,
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pushNamed(context, '/browseAtm');
              },
            ),
          ],
        ),
      );
  }
}