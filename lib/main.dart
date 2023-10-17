import 'dart:developer';

import 'package:deep_read_app/presentation/blocs/books/books_bloc.dart';
import 'package:deep_read_app/presentation/blocs/local_storage/local_storage_bloc.dart';
import 'package:deep_read_app/presentation/blocs/search_book/search_book_cubit.dart';
import 'package:deep_read_app/presentation/blocs/theme/theme_cubit.dart';
import 'package:flutter/material.dart';

import 'package:deep_read_app/config/router/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  final themeCubit = ThemeCubit();
  await themeCubit.initializeTheme();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: '.env');
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BooksBloc(),
        ),
        BlocProvider(
          create: (context) => BookSearchBloc(),
        ),
        BlocProvider(
          create: (context) => LocalStorageBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        )
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(builder: (context, state) {
      return MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        theme: state,
      );
    });
  }
}
