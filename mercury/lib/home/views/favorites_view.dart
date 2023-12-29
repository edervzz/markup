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
    return BlocProvider(
      create: (context) => FavoritesBloc(dataStore!),
      child: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, favoriteState) {
          switch (favoriteState.state) {
            case KnownState.loading:
              BlocProvider.of<FavoritesBloc>(context).add(FavoritesLoadEvent());
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
    );
  }

  Widget _prepareList(List<Property> properties) {
    return ListView.builder(
        itemCount: properties?.length,
        itemBuilder: (context, index) {
          return Dismissible(
              direction: DismissDirection.endToStart,
              key: ValueKey<int>(index),
              background: Container(
                alignment: Alignment.center,
                color: globalColorAlert,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.delete),
                    Text(AppLocalizations.of(context)!.removeItem)
                  ],
                ),
              ),
              onDismissed: (direction) {
                var e = properties[index];
                properties.removeAt(index);
                BlocProvider.of<FavoritesBloc>(context)
                    .add(FavoriteRemoveItemEvent(e));
              },
              child: FavItemWidget(property: properties[index]));
        });
  }
}
