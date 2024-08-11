import 'package:flutter/material.dart';
import 'package:invest_app/app/presentation/widgets/app_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: Drawer(),
      body: Column(
        children: [
          AppBarWidget(),
        ],
      ),
    );
  }
}
