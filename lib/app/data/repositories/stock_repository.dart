import 'dart:convert';
import 'package:invest_app/app/data/api_url.dart';
import 'package:invest_app/app/data/http/http_client.dart';
import 'package:invest_app/app/data/models/stock_model.dart';
import 'package:invest_app/app/utils/strings/app_strings.dart';

Future<List<StockModel>> getStocks(HttpClient client) async {
  final response = await client.get(
    url: apiUrlStocks,
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    if (jsonResponse is Map && jsonResponse.containsKey(AppStrings.stocks)) {
      final stocksList = jsonResponse[AppStrings.stocks] as List;
      return stocksList
          .map((stock) => StockModel.fromJson(stock as Map<String, dynamic>))
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
