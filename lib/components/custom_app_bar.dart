import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // menu icon
          Image.asset(
            'assets/icons/more.png',
            height: 45,
            color: Colors.grey[800],
          ),
          // account icon
          Icon(
            Icons.person,
            size: 45,
            color: Colors.grey[800],
          ),
        ],
      ),
    );
  }
}
