import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<http.Response> getBitcoinPrize() async {
  return await http.get(Uri.https('blockchain.info', 'ticker'));
}

Widget buildBitcoinStatus() {
  return FutureBuilder(
    future: getBitcoinPrize(),
    builder: (context, snapshot) {
      if(snapshot.hasData) {
        int? statuscode = snapshot.data?.statusCode;
        if ( statuscode == 200) {
          var btcPrice = BitcoinPrice.fromJson(jsonDecode(snapshot.data!.body));
          return Text(btcPrice.eur.toString());
        }
        return Text('${snapshot.data?.statusCode}');
      } else if (snapshot.hasError) {
        return Text(snapshot.error.toString());
      } else {
        return const CircularProgressIndicator();
      }
    },
  );
}

class BitcoinPrice {
  double eur;

  BitcoinPrice({ required this.eur});

  factory BitcoinPrice.fromJson(Map<String, dynamic> json) {
    return BitcoinPrice(eur: json['EUR']['15m']);
  }
}