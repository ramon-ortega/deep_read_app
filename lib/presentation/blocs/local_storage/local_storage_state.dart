part of 'local_storage_bloc.dart';

abstract class LocalStorageState {}

class LocalStorageInitial extends LocalStorageState {}

class FavoritedState extends LocalStorageState {
  final Map<String, Book> favoriteBooks;

  FavoritedState({required this.favoriteBooks});
}
