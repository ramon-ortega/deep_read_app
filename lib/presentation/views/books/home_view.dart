import 'package:deep_read_app/presentation/blocs/books/books_bloc.dart';
import 'package:deep_read_app/presentation/widgets/books/books_horizontal_listview.dart';
import 'package:deep_read_app/presentation/widgets/books/books_slidershow.dart';
import 'package:deep_read_app/presentation/widgets/shared/custom_app_bar.dart';
import 'package:deep_read_app/presentation/widgets/shared/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksBloc, BooksState>(builder: (context, state) {
      return CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: CustomAppbar(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Column(
                children: [
                  state is BooksLoaded
                      ? Column(
                          children: [
                            BooksSlideshow(
                              books: state.headerBooks,
                            ),
                            BooksHorizontalListView(
                              title: 'Ciencia Ficción',
                              books: state.scienceBooks,
                              loadNextPage: () => {
                                context.read<BooksBloc>().add(LoadBooksEvent()),
                              },
                            ),
                            BooksHorizontalListView(
                              title: 'Terror',
                              books: state.horrorBooks,
                              loadNextPage: () => {
                                // context.read<BooksBloc>().add(LoadBooksEvent()),
                              },
                            ),
                            BooksHorizontalListView(
                              title: 'Política',
                              books: state.politicsBooks,
                              loadNextPage: () => {
                                // context.read<BooksBloc>().add(LoadBooksEvent()),
                              },
                            ),
                          ],
                        )
                      : const FullScreenLoader(),
                ],
              );
            }, childCount: 1),
          ),
        ],
      );
    });
  }
}
