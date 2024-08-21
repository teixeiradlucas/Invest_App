import 'dart:convert';
import 'package:invest_app/app/data/api_url.dart';
import 'package:invest_app/app/data/http/http_client.dart';
import 'package:invest_app/app/data/models/stock_model.dart';

Future<List<StockModel>> getStocks(HttpClient client) async {
  final response = await client.get(
    url: apiUrlStocks,
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    if (jsonResponse is Map && jsonResponse.containsKey('stocks')) {
      final stocksList = jsonResponse['stocks'] as List;
      return stocksList
          .map((stock) => StockModel.fromJson(stock as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Formato JSON inesperado');
    }
  } else if (response.statusCode == 404) {
    throw Exception('A url informada não é válida');
  } else {
    throw Exception('Não foi possível carregar os dados');
  }
}
