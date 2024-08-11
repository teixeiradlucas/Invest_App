import 'package:flutter/material.dart';
import 'package:invest_app/app/presentation/pages/home/widgets/app_bar_widget.dart';
import 'package:invest_app/app/presentation/pages/home/widgets/stock_item.dart';
import 'package:invest_app/app/utils/dimension_custom.dart';
import 'package:invest_app/app/utils/themes/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      body: Column(
        children: [
          const AppBarWidget(),
          Container(
            color: AppColors.whiteColor,
            width: 500,
            height: 200,
          ),
          gap,
          const StockItem(),
        ],
      ),
    );
  }
}
