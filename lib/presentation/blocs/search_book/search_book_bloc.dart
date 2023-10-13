import 'package:bloc/bloc.dart';
import 'package:deep_read_app/domain/entities/book.dart';

part 'search_book_event.dart';
part 'search_book_state.dart';

class SearchBookBloc extends Bloc<SearchBookEvent, SearchBookState> {
  SearchBookBloc() : super(SearchBlocInitial()) {
    on<SearchQueryUpdated>((event, emit) {
      print("MANDAMOIS LLAMAR AL SERVICIO");
      emit(SearchResultState(resultsBook: []));
    });
  }
}
