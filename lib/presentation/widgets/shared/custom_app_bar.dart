import 'package:deep_read_app/domain/entities/book.dart';
import 'package:deep_read_app/infraestructure/datasources/book_google_api_datasource.dart';
import 'package:deep_read_app/presentation/blocs/search_book/search_book_cubit.dart';
import 'package:deep_read_app/presentation/delegates/search_book_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(
                Icons.library_books_outlined,
                color: colors.primary,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Deep Read App',
                style: titleStyle,
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  final bookSearchBloc = context.read<BookSearchBloc>();
                  showSearch<Book?>(
                    query: bookSearchBloc.state,
                    context: context,
                    delegate: SearchBookDelegate(
                      searchBooks: (query) {
                        bookSearchBloc.updateQuery(query);
                        final bookProvider = BookGoogleAPIDatasource();
                        return bookProvider.searchBooks(query);
                      },
                    ),
                  ).then((book) {
                    if (book == null) return;
                    context.push('/book/${book.id}');
                  });
                },
                icon: Icon(
                  Icons.search,
                  color: colors.primary,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BooksRepositoryImpl {}
