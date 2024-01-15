// lib/widgets/custom_app_bar.dart
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: SizedBox(height: 35, child: Image.asset("assets/logo.png")),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: false);
  }
}
