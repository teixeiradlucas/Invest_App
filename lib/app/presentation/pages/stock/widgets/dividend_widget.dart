import 'package:flutter/material.dart';
import 'package:invest_app/app/data/http/http_client.dart';
import 'package:invest_app/app/data/models/stock_model.dart';
import 'package:invest_app/app/data/repositories/dividend_repository.dart';
import 'package:invest_app/app/utils/app_text.dart';
import 'package:invest_app/app/utils/commom.dart';
import 'package:invest_app/app/utils/formatted_value.dart';
import 'package:invest_app/app/utils/themes/app_colors.dart';

class DividendWidget extends StatelessWidget {
  const DividendWidget({
    required this.stock,
    super.key,
  });

  final StockModel stock;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        // ignore: discarded_futures
        future: getDividend(
          HttpClient(),
          stock,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return buildLoading();
          } else if (snapshot.hasError) {
            return Container();
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return buildNoData();
          } else {
            final reversedDividends = snapshot.data!.reversed.toList();
            return ListView.builder(
              itemCount: reversedDividends.length,
              itemBuilder: (context, index) {
                final dividend = reversedDividends[index];
                return ListTile(
                  title: AppText.h2(dividend.type),
                  subtitle: AppText.body(
                    formattedPrice(dividend.value),
                    color: AppColors.grayColor,
                  ),
                  trailing: AppText.body(
                    formatDateComplete(dividend.date),
                    color: AppColors.grayColor,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
