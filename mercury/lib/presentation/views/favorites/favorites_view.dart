import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mercury/domain/repository/repository.dart';
import 'package:mercury/main.dart';
import 'package:mercury/presentation/views/favorites/favorites_bloc.dart';
import 'package:mercury/presentation/widgets/properties_widget.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<StatefulWidget> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => dataStore,
        child: BlocProvider(
          create: (context) => FavoritesBloc(context.read<Repository>()),
          child: BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (context, favoriteState) {
              switch (favoriteState.state) {
                case FavoriteStates.loading:
                  BlocProvider.of<FavoritesBloc>(context)
                      .add(FavoritesLoadEvent());
                  return const Center(child: CircularProgressIndicator());
                case FavoriteStates.ready:
                  if (favoriteState.properties.isEmpty) {
                    return Center(
                      child: Text(AppLocalizations.of(context)!.nofavs),
                    );
                  }
                default:
              }
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PropertiesWidget(properties: favoriteState.properties),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
