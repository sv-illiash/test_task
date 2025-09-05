import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/injector.dart';
import 'package:test_task/presentation/blocs/coin_list/coin_list_bloc.dart';
import 'package:test_task/presentation/routes/routes.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => injector<CoinListBloc>()),
      ],
      child: MaterialApp(
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: AppRoutes.coinList,
      ),
    );
  }
}
