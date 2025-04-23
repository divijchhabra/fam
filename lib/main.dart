import 'package:fam_assignment/features/contextual_cards/data/enums/slug_type.dart';
import 'package:fam_assignment/features/home/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:fam_assignment/core/di/fam_di.dart';

import 'core/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FamDI.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contextual Cards',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}
