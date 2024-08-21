import 'dart:convert';
import 'package:invest_app/app/data/api_url.dart';
import 'package:invest_app/app/data/http/http_client.dart';
import 'package:invest_app/app/data/models/historical_model.dart';
import 'package:invest_app/app/data/models/stock_model.dart';

Future<List<HistoricalModel>> getHistorical(
  HttpClient client,
  StockModel stock,
) async {
  final response = await client.get(
    url: apiUrlHistoricals + stock.ticket,
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    if (jsonResponse is Map && jsonResponse.containsKey('historicals')) {
      final historicalsList = jsonResponse['historicals'] as List;
      return historicalsList
          .map(
            (historical) =>
                HistoricalModel.fromJson(historical as Map<String, dynamic>),
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
