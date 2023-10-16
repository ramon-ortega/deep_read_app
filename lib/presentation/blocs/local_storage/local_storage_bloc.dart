import 'package:bloc/bloc.dart';
import 'package:deep_read_app/domain/entities/book.dart';
import 'package:deep_read_app/infraestructure/datasources/isar_datasource.dart';
import 'package:deep_read_app/infraestructure/repositories/local_storage_repository_impl.dart';

part 'local_storage_event.dart';
part 'local_storage_state.dart';

class LocalStorageBloc extends Bloc<LocalStorageEvent, LocalStorageState> {
  int page = 0;
  LocalStorageBloc() : super(LocalStorageInitial()) {
    on<ToggleFavoriteEvent>((event, emit) async {
      LocalStorageRepositoryImpl(
        IsarDatasource(),
      ).toggleFavorite(event.book);
    });
    on<ChargeFavoritesEvent>((event, emit) async {
      final books = await loadNextPage();
      emit(FavoritedState(favoriteBooks: books));
    });
  }

  Future<Map<String, Book>> loadNextPage() async {
    Map<String, Book> map = {};
    final books = await LocalStorageRepositoryImpl(
      IsarDatasource(),
    ).loadBooks();

    for (final book in books) {
      map = {...map, book.id: book};
    }

    return map;
  }
}
