import 'package:flutter/material.dart';
import 'presentation/pages/profile_page.dart';
import 'presentation/pages/schedule_page.dart';
import 'presentation/pages/user_page.dart';
import 'core/navigation/navigation_service.dart';
import 'presentation/controllers/home_controller.dart';
import 'domain/usecases/navigate_to_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Singleton instance untuk NavigationService
  final NavigationService navigationService = NavigationService();
  final HomeController homeController;

  MyApp() : homeController = HomeController(NavigateToPageUseCase(NavigationService()));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey, // Gunakan global navigator key yang sama
      title: 'uts',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/idol': (context) => IdolListPage(homeController),
        '/schedule': (context) => ConcertSchedulePage(homeController),
        '/user': (context) => ProfilePage(homeController),
      },
    );
  }
}
