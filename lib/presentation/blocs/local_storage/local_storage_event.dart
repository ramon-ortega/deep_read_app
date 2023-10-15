part of 'local_storage_bloc.dart';

abstract class LocalStorageEvent {}

class ToggleFavoriteEvent extends LocalStorageEvent {
  final Book book;
  ToggleFavoriteEvent(this.book);
}

class ChargeFavoritesEvent extends LocalStorageEvent {}
