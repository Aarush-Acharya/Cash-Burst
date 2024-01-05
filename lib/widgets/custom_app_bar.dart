// lib/widgets/custom_app_bar.dart
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const Text(
          'Hanger Ink',
          style: TextStyle(
            letterSpacing: 2,
            fontSize: 20.0,
            fontFamily: 'Cinzel',
            // fontWeight: FontWeight.bold,
            color: Color(0xffB00B29),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: false);
  }
}
