import 'package:flutter/material.dart';
import 'package:invest_app/app/data/models/stock_model.dart';
import 'package:invest_app/app/presentation/pages/stock/stock_page.dart';
import 'package:invest_app/app/utils/app_text.dart';
import 'package:invest_app/app/utils/formatted_value.dart';
import 'package:invest_app/app/utils/images/app_images_stocks.dart';

class StockItem extends StatelessWidget {
  const StockItem({
    required this.stock,
    super.key,
  });

  final StockModel stock;

  @override
  Widget build(BuildContext context) {
    final variation = variationAccount(stock.priceOpen, stock.price);
    return InkWell(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute<dynamic>(
            builder: (context) => StockPage(stock: stock),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Image.asset(
                  ticketImages[stock.ticket] ?? AppImagesStocks.defaultImage,
                ),
              ),
            ),
            AppText.body(stock.ticket),
            AppText.body(formattedPrice(stock.price)),
            if (variation.contains('-'))
              AppText.bodyNegativeValue(variation)
            else if (variation == '0,0%')
              AppText.body(variation)
            else
              AppText.bodyPositiveValue(variation),
            AppText.body(formattedPercentage(stock.dividendYield)),
          ],
        ),
      ),
    );
  }
}
