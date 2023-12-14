import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercury/domain/entities/_entities.dart';
import 'package:mercury/domain/repository/repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(Repository repository) : super(HomeState.initial()) {
    on<HomeLoadEvent>((event, emit) async {
      // 1. read repository
      var data = await repository.property.readAll();
      Timer(const Duration(seconds: 5), () {});
      // 2. prepare new state
      var newState = HomeState.ready(properties: data);
      // 3. emit state
      emit(newState);
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
