import 'package:fam_assignment/features/home/presentation/home_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String homePage = '/homePage';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('Route not found'),
          ),
        );
      },
    );
  }
}
