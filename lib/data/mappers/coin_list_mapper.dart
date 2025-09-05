import 'package:test_task/data/models/response/coin_response.dart';
import 'package:test_task/domain/entities/coin_entity.dart';

class CoinListMapper {
  static List<CoinEntity> listFromApi(CoinResponse response) {
    return response.data.map((i) {
      return CoinEntity(
        name: i.name,
        priceUsd: double.tryParse(i.priceUsd) ?? 0.0,
      );
    }).toList();
  }
}



