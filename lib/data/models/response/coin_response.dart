class CoinResponse {
  static const String _dataField = 'data'; // Константа для поля 'data'

  final List<Coin> data;

  CoinResponse({required this.data});

  factory CoinResponse.fromJson(Map<String, dynamic> json) {
    return CoinResponse(
      data: (json[_dataField] as List)
          .map((e) => Coin.fromJson(e))
          .toList(),
    );
  }
}

class Coin {
  static const String _nameField = 'name'; // Константа для поля 'name'
  static const String _priceUsdField = 'priceUsd'; // Константа для поля 'priceUsd'

  final String name;
  final String priceUsd;

  Coin({
    required this.name,
    required this.priceUsd,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      name: json[_nameField] as String,
      priceUsd: json[_priceUsdField] as String,
    );
  }
}