import 'dart:convert';
import 'package:invest_app/app/data/api_url.dart';
import 'package:invest_app/app/data/http/http_client.dart';
import 'package:invest_app/app/data/models/dividend_model.dart';
import 'package:invest_app/app/data/models/stock_model.dart';

Future<List<DividendModel>> getDividend(
  HttpClient client,
  StockModel stock,
) async {
  final response = await client.get(
    url: apiUrlDividends + stock.ticket,
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    if (jsonResponse is Map && jsonResponse.containsKey('dividends')) {
      final dividendsList = jsonResponse['dividends'] as List;
      return dividendsList
          .map(
            (dividend) =>
                DividendModel.fromJson(dividend as Map<String, dynamic>),
          )
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
