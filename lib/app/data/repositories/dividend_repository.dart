import 'dart:convert';
import 'package:invest_app/app/data/api_url.dart';
import 'package:invest_app/app/data/http/http_client.dart';
import 'package:invest_app/app/data/models/dividend_model.dart';
import 'package:invest_app/app/data/models/stock_model.dart';
import 'package:invest_app/app/utils/strings/app_strings.dart';

Future<List<DividendModel>> getDividend(
  HttpClient client,
  StockModel stock,
) async {
  final response = await client.get(
    url: apiUrlDividends + stock.ticket,
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    if (jsonResponse is Map && jsonResponse.containsKey(AppStrings.dividends)) {
      final dividendsList = jsonResponse[AppStrings.dividends] as List;
      return dividendsList
          .map(
            (dividend) =>
                DividendModel.fromJson(dividend as Map<String, dynamic>),
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
