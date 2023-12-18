import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercury/domain/entities/_entities.dart';
import 'package:mercury/domain/repository/repository.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc(Repository repository) : super(FavoritesState.initial()) {
    on<FavoritesLoadEvent>((event, emit) async {
      // 1. read repository
      var data = await repository.property.readFavorites();
      // emit new state
      emit(FavoritesState.ready(properties: data ?? List.empty()));
    });
  }
}

// ****************************************************************
// Event
@immutable
abstract class FavoritesEvent {
  const FavoritesEvent();
}

class FavoritesLoadEvent extends FavoritesEvent {}

// ****************************************************************
// State

class FavoritesState {
  FavoriteStates state;
  List<Property> properties;

  FavoritesState.initial()
      : state = FavoriteStates.loading,
        properties = List.empty();

  FavoritesState.ready({required this.properties})
      : state = FavoriteStates.ready;
}

enum FavoriteStates {
  loading,
  ready,
}
