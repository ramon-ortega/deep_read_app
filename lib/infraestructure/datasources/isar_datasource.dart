import 'package:deep_read_app/domain/datasources/local_storage_datasource.dart';
import 'package:deep_read_app/domain/entities/book.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatasource extends LocalStorageDatasource {
  late Future<Isar> db;

  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [BookSchema],
        inspector: true,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isBookFavorite(String bookId) async {
    final isar = await db;

    final Book? isBookFavorite =
        await isar.books.filter().idEqualTo(bookId.toString()).findFirst();

    return isBookFavorite != null;
  }

  @override
  Future<List<Book>> loadBooks({int limit = 10, offset = 0}) async {
    final isar = await db;

    return isar.books.where().offset(offset).limit(limit).findAll();
  }

  @override
  Future<void> toggleFavorite(Book book) async {
    final isar = await db;

    final bookFavorite =
        await isar.books.filter().idEqualTo(book.id).findFirst();

    if (bookFavorite != null) {
      isar.writeTxnSync(() => isar.books.deleteSync(bookFavorite.isarId!));
      return;
    }

    isar.writeTxnSync(() => isar.books.putSync(book));
  }
}
