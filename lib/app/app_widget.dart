import 'package:flutter/material.dart';
import 'package:invest_app/app/presentation/pages/home/home_page.dart';
import 'package:invest_app/app/utils/strings/app_strings.dart';
import 'package:invest_app/app/utils/themes/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.primaryTheme,
      home: const HomePage(),
    );
  }
}
