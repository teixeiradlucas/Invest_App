String formattedPrice(double value) {
  var valueString = value.toStringAsFixed(2);
  valueString = valueString.replaceAll('.', ',');
  valueString = 'R\$ $valueString';

  return valueString;
}

String formattedPercentage(double percentage) {
  var percentageString = percentage.toStringAsFixed(1);
  percentageString = percentageString.replaceAll('.', ',');
  percentageString = '$percentageString %';

  return percentageString;
}
