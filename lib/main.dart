import 'package:deep_read_app/presentation/blocs/books/books_bloc.dart';
import 'package:deep_read_app/presentation/blocs/local_storage/local_storage_bloc.dart';
import 'package:deep_read_app/presentation/blocs/search_book/search_book_cubit.dart';
import 'package:flutter/material.dart';

import 'package:deep_read_app/config/router/app_router.dart';
import 'package:deep_read_app/config/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
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
        )
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
