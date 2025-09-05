import 'package:flutter/material.dart';
import 'package:test_task/presentation/views/coin_list_view/coin_list_view.dart';


class AppRoutes {
  static const coinList = 'coins';

  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case coinList:
        return _materialRoute(CoinListView(), routeSettings: routeSettings);

      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view, {RouteSettings? routeSettings}) {
    return MaterialPageRoute(
        builder: (_) => Builder(builder: (BuildContext context) => view), settings: routeSettings);
  }
}
