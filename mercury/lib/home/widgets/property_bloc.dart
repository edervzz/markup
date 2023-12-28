import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercury/data/shared_pref_keys.dart';
import 'package:mercury/domain/entities/property.dart';
import 'package:mercury/shared/_shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  PropertyBloc() : super(PropertyState.init()) {
    on<SaveProperty>((event, emit) async {
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

      emit(PropertyState.saved());
    });
  }
}

@immutable
abstract class PropertyEvent {}

class SaveProperty extends PropertyEvent {
  final Property property;

  SaveProperty(this.property);
}

class PropertyState {
  KnownState state;

  PropertyState.init() : state = KnownState.init;

  PropertyState.saved() : state = KnownState.ready;
}
