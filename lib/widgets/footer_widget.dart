// lib/widgets/footer_widget.dart
import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  // Define the menu items
  Map<String, String> menuItems = {
    'Home': '',
    'Find ATM': 'findAtm',
    'Customer Support': 'customerSupport',
  };

  FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Check if the screen width is greater than a specified breakpoint
    bool isDesktop = MediaQuery.of(context).size.width > 600;

    return Container(
      padding: const EdgeInsets.all(20),
      color: const Color(0xffB00B29),
      child: Column(
        children: [
          const Divider(
            color: Colors.amber,
            thickness: 1,
          ),
          const SizedBox(height: 10),
          // Navigation Bar
          isDesktop
              ? // Desktop layout
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: menuItems.keys.map((item) {
                    return TextButton(
                      onPressed: () {
                        // Navigate to the corresponding page for each menu item
                        // You can replace the '/' with the actual route for each menu item
                        Navigator.pushNamed(context, '/${menuItems[item]}');
                      },
                      child: Text(
                        item,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    );
                  }).toList(),
                )
              : // Mobile layout
              Column(
                  children: menuItems.keys.map((item) {
                    return TextButton(
                      onPressed: () {
                        // Navigate to the corresponding page for each menu item
                        // You can replace the '/' with the actual route for each menu item
                        Navigator.pushNamed(context, '/${menuItems[item]}');
                      },
                      child: Text(
                        item,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    );
                  }).toList(),
                ),

          const SizedBox(height: 20),
          // Social Media Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/facebook.jpeg', // Replace with your Facebook icon asset
                width: 30,
                height: 30,
              ),
              const SizedBox(width: 10),
              Image.asset(
                'assets/insta.jpeg', // Replace with your Instagram icon asset
                width: 30,
                height: 30,
              ),
              const SizedBox(width: 10),
              Image.asset(
                'assets/twitter.jpeg', // Replace with your Twitter icon asset
                width: 30,
                height: 30,
              ),
              const SizedBox(width: 10),
              Image.asset(
                'assets/google.jpeg', // Replace with your Google icon asset
                width: 30,
                height: 30,
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Copyright Text
          const Center(
            child: Text(
              'Hanger Ink © All Rights Reserved. ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
