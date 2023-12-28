import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mercury/domain/entities/_entities.dart';
import 'package:mercury/home/widgets/fav_item_widget.dart';
import 'package:mercury/main.dart';
import 'package:mercury/shared/_shared.dart';

import 'favorites_bloc.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<StatefulWidget> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => FavoritesBloc(dataStore!),
        child: BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, favoriteState) {
            switch (favoriteState.state) {
              case KnownState.loading:
                BlocProvider.of<FavoritesBloc>(context)
                    .add(FavoritesLoadEvent());
                return const Center(child: CircularProgressIndicator());
              case KnownState.ready:
                if (favoriteState.properties.isEmpty) {
                  return Center(
                    child: Text(AppLocalizations.of(context)!.nofavs),
                  );
                }
              default:
            }
            return Center(
              child: _prepareList(favoriteState.properties),
            );
          },
        ),
      ),
    );
  }

  Widget _prepareList(List<Property>? properties) {
    List<Widget> props = List.empty(growable: true);
    if (properties != null) {
      for (var element in properties!) {
        props.add(FavItemWidget(property: element));
      }
    }

    return ListView(
      children: props,
    );
  }
}
