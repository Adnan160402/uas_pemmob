import 'package:flutter/material.dart';
import 'base_page.dart';
import '../controllers/home_controller.dart';

class ProfilePage extends StatelessWidget {
  final HomeController controller;

  ProfilePage(this.controller);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://pbs.twimg.com/profile_images/1795853981924855808/pTy3XFUs_400x400.jpg', 
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Nabila Putri Setyono', 
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'nabilaputrisetyono@gmail.com', 
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
      selectedIndex: 1,
      controller: controller,
    );
  }
}
