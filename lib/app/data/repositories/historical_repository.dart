import 'dart:convert';
import 'package:invest_app/app/data/api_url.dart';
import 'package:invest_app/app/data/http/http_client.dart';
import 'package:invest_app/app/data/models/historical_model.dart';
import 'package:invest_app/app/data/models/stock_model.dart';
import 'package:invest_app/app/utils/strings/app_strings.dart';

Future<List<HistoricalModel>> getHistorical(
  HttpClient client,
  StockModel stock,
) async {
  final response = await client.get(
    url: apiUrlHistoricals + stock.ticket,
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    if (jsonResponse is Map &&
        jsonResponse.containsKey(AppStrings.historicals)) {
      final historicalsList = jsonResponse[AppStrings.historicals] as List;
      return historicalsList
          .map(
            (historical) =>
                HistoricalModel.fromJson(historical as Map<String, dynamic>),
          )
          .toList();
    } else {
      throw Exception(AppStrings.jsonUnexpected);
    }
  } else if (response.statusCode == 404) {
    throw Exception(AppStrings.urlInvalid);
  } else {
    throw Exception(AppStrings.dataError);
  }
}
