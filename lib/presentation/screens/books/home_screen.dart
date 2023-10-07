import 'package:deep_read_app/presentation/blocs/books/books_bloc.dart';
import 'package:flutter/material.dart';

import 'package:deep_read_app/config/constants/environment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksBloc, BooksState>(builder: (context, state) {
      if (state is BooksLoaded) {
        return ListView.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              final book = state.books[index];
              return ListTile(
                title: Text(book.title),
              );
            });
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
