import 'package:flutter/material.dart';

Widget buildLoading() {
  return const Center(child: CircularProgressIndicator());
}

Widget buildError(Object? error) {
  return Center(child: Text('Error: $error'));
}

Widget buildNoData() {
  return const Center(child: Text('Dados não encontrados'));
}
