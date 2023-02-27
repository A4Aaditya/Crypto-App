import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travan_code_app/presentation/crypto_detail/bloc/favorite_bloc.dart';
import 'package:travan_code_app/presentation/home/bloc/crypto_bloc.dart';
import 'package:travan_code_app/presentation/home/view/home_page.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox<int>('crypto_favoritess');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CryptoBloc(),
        ),
        BlocProvider(
          create: (context) => FavoritesBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(useMaterial3: true),
        home: const HomePage(),
      ),
    );
  }
}
