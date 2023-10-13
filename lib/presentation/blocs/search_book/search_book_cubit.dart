import 'package:flutter_bloc/flutter_bloc.dart';

class BookSearchBloc extends Cubit<String> {
  BookSearchBloc() : super('');

  void updateQuery(String query) => emit(query);
}
