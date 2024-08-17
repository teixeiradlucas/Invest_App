String formattedPrice(double value) {
  var valueString = value.toStringAsFixed(2);
  valueString = valueString.replaceAll('.', ',');
  valueString = 'R\$ $valueString';

  return valueString;
}

String formattedPercentage(double percentage) {
  var percentageString = percentage.toStringAsFixed(1);
  percentageString = percentageString.replaceAll('.', ',');
  percentageString = '$percentageString%';

  return percentageString;
}

String variationAccount(double priceOpen, double priceClose) {
  final result = ((priceClose - priceOpen) / priceOpen) * 100;
  var resultString = result.toStringAsFixed(1);
  resultString = resultString.replaceAll('.', ',');
  resultString = '$resultString%';

  return resultString;
}
