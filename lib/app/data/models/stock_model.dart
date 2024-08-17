class StockModel {
  StockModel({
    required this.priceOpen,
    required this.ticket,
    required this.name,
    required this.sector,
    required this.price,
    required this.volume,
    required this.dividendYield,
    required this.lastYearHigh,
    required this.lastYearLow,
  });

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      ticket: json['symbol'] as String,
      name: json['name'] as String,
      sector: json['sector'] as String,
      price: (json['lastPrice'] as num).toDouble(),
      priceOpen: (json['priceOpen'] as num).toDouble(),
      volume: json['volume'] as int,
      dividendYield: (json['dividendYield'] as num).toDouble(),
      lastYearHigh: (json['lastYearHigh'] as num).toDouble(),
      lastYearLow: (json['lastYearLow'] as num).toDouble(),
    );
  }

  final String ticket;
  final String name;
  final String sector;
  final double price;
  final int volume;
  final double dividendYield;
  final double lastYearHigh;
  final double lastYearLow;
  final double priceOpen;
}
