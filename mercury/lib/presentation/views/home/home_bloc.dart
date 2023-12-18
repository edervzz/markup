import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercury/data/shared_pref_keys.dart';
import 'package:mercury/domain/entities/_entities.dart';
import 'package:mercury/domain/repository/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(Repository repository) : super(HomeState.initial()) {
    on<HomeLoadEvent>((event, emit) async {
      // 1. read repository
      var data = await repository.property.readAll();
      // 2. read shared preferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final favs = prefs.getStringList(favoriteProperties);
      if (favs?.isNotEmpty == true && data?.isNotEmpty == true) {
        for (var f in favs!) {
          var ee = data!.firstWhere((e) => e.id == int.parse(f));
          ee.isFavorite = true;
        }
      }
      // 3. emit new state
      emit(HomeState.ready(properties: data ?? List.empty()));
    });
  }
}

// ****************************************************************
// Event
@immutable
abstract class HomeEvent {
  const HomeEvent();
}

class HomeLoadEvent extends HomeEvent {}

// ****************************************************************
// State
class HomeState {
  HomeStates state;
  List<Property> properties;

  HomeState.initial()
      : state = HomeStates.loading,
        properties = List.empty();

  HomeState.ready({
    required this.properties,
  }) : state = HomeStates.ready;
}

enum HomeStates {
  loading,
  ready,
  empty,
}
