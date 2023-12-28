import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercury/data/shared_pref_keys.dart';
import 'package:mercury/domain/entities/_entities.dart';
import 'package:mercury/domain/repository/repository.dart';
import 'package:mercury/shared/_shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc(Repository repository) : super(FavoritesState.loading()) {
    on<FavoritesLoadEvent>((event, emit) async {
      // 1. read repository
      var data = await repository.property.readFavorites();
      // emit new state
      emit(FavoritesState.ready(properties: data ?? List.empty()));
    });

    on<FavoritesSaveItemEvent>((event, emit) async {
      var isFavorite = event.property.isFavorite ? false : true;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final favs = prefs.getStringList(favoriteProperties);

      if (favs?.isNotEmpty == true) {
        var f = favs!.firstWhere(
          (element) => element == event.property.id.toString(),
          orElse: () => "",
        );
        if (isFavorite) {
          if (f.isEmpty) {
            favs.add(event.property.id.toString());
          }
        } else {
          if (f.isNotEmpty) {
            favs.remove(event.property.id.toString());
          }
        }
        prefs.setStringList(
          favoriteProperties,
          favs,
        );
      } else {
        if (isFavorite) {
          prefs.setStringList(
            favoriteProperties,
            <String>[event.property.id.toString()],
          );
        }
      }

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

class FavoritesSaveItemEvent extends FavoritesEvent {
  final Property property;

  const FavoritesSaveItemEvent(this.property);
}

// ****************************************************************
// State
class FavoritesState {
  KnownState state;
  List<Property> properties;

  FavoritesState.loading()
      : state = KnownState.loading,
        properties = List.empty();

  FavoritesState.ready({required this.properties}) : state = KnownState.ready;
}
