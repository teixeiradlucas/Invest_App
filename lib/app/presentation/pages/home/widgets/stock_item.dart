import 'package:flutter/material.dart';
import 'package:invest_app/app/utils/app_text.dart';
import 'package:invest_app/app/utils/formatted_value.dart';
import 'package:invest_app/app/utils/images/app_images_stocks.dart';

class StockItem extends StatelessWidget {
  const StockItem({
    required this.ticket,
    required this.name,
    required this.price,
    required this.dy,
    required this.priceOpen,
    super.key,
  });

  final String ticket;
  final String name;
  final double price;
  final double dy;
  final double priceOpen;

  @override
  Widget build(BuildContext context) {
    final variation = variationAccount(priceOpen, price);
    return InkWell(
      onTap: () {},
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
                  ticketImages[ticket] ?? AppImagesStocks.defaultImage,
                ),
              ),
            ),
            AppText.body(ticket),
            AppText.body(formattedPrice(price)),
            if (variation.contains('-'))
              AppText.bodyNegativeValue(variation)
            else if (variation == '0,0%')
              AppText.body(variation)
            else
              AppText.bodyPositiveValue(variation),
            AppText.body(formattedPercentage(dy)),
          ],
        ),
      ),
    );
  }
}
