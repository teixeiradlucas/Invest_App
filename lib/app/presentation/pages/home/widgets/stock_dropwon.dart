import 'package:flutter/material.dart';
import 'package:invest_app/app/data/models/stock_model.dart';

class StockDropdown extends StatefulWidget {
  const StockDropdown({
    required this.stocks,
    required this.onChanged,
    this.selectedTicket,
    super.key,
  });
  final List<StockModel> stocks;
  final ValueChanged<String?> onChanged;
  final String? selectedTicket;

  @override
  _StockDropdownState createState() => _StockDropdownState();
}

class _StockDropdownState extends State<StockDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.selectedTicket,
      items: widget.stocks.map((stock) {
        return DropdownMenuItem<String>(
          value: stock.ticket,
          child: Text(stock.ticket),
        );
      }).toList(),
      onChanged: widget.onChanged,
    );
  }
}
