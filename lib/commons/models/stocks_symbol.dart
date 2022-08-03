import 'dart:convert';

class StocksSymbol {
  final String? currency;
  final String? description;
  final String? displaySymbol;
  final String? figi;
  final String? mic;
  final String? symbol;
  final String? type;

  StocksSymbol({
    this.currency,
    this.description,
    this.displaySymbol,
    this.figi,
    this.mic,
    this.symbol,
    this.type,
  }) : super();

  factory StocksSymbol.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Null JSON provided');
    }

    return StocksSymbol(
      currency: json['currency'],
      description: json['description'],
      displaySymbol: json['displaySymbol'],
      figi: json['figi'],
      mic: json['mic'],
      symbol: json['symbol'],
      type: json['type'],
    );
  }

  static Map<String, dynamic> toMap(StocksSymbol stocksSymbol) => {
        "currency": stocksSymbol.currency,
        "description": stocksSymbol.description,
        "displaySymbol": stocksSymbol.displaySymbol,
        "figi": stocksSymbol.figi,
        "mic": stocksSymbol.mic,
        "symbol": stocksSymbol.symbol,
        "type": stocksSymbol.type,
      };

  static String encode(List<StocksSymbol> stockSymbol) => json.encode(
        stockSymbol
            .map<Map<String, dynamic>>(
                (stockSymbol) => StocksSymbol.toMap(stockSymbol))
            .toList(),
      );

  static List<StocksSymbol> decode(String stockSymbol) =>
      (json.decode(stockSymbol) as List<dynamic>)
          .map<StocksSymbol>((item) => StocksSymbol.fromJson(item))
          .toList();

  // @override
  // copyWith({
  //   String? currency,
  //   String? description,
  //   String? displaySymbol,
  //   String? figi,
  //   String? mic,
  //   String? symbol,
  //   String? type,
  // }) {
  //   return StocksSymbol(
  //     currency: currency ?? this.currency,
  //     description: description ?? this.description,
  //     displaySymbol: displaySymbol ?? this.displaySymbol,
  //     figi: figi ?? this.figi,
  //     mic: mic ?? this.mic,
  //     symbol: symbol ?? this.symbol,
  //     type: type ?? this.type,
  //   );
  // }
}
