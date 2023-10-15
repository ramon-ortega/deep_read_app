import 'dart:developer';

import 'package:deep_read_app/presentation/blocs/local_storage/local_storage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Favoritos',
            style: titleStyle?.copyWith(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<LocalStorageBloc, LocalStorageState>(
            builder: (context, state) {
          if (state is FavoritedState) {
            final favoriteBooksList = state.favoriteBooks.values.toList();

            return ListView.builder(
              itemCount: state.favoriteBooks.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.push('/home/0/book/${favoriteBooksList[index].id}');
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.network(
                              favoriteBooksList[index].imageLinks?.thumbnail ??
                                  'https://www.colombianosune.com/sites/default/files/asociaciones/NO_disponible-43_15.jpg',
                              width: 70,
                              height: 70,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    favoriteBooksList[index].title,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    favoriteBooksList[index].authors.join(', '),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(color: Colors.grey),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}
