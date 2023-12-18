import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mercury/domain/entities/_entities.dart';
import 'package:mercury/domain/repository/repository.dart';
import 'package:mercury/main.dart';
import 'package:mercury/presentation/views/home/home_bloc.dart';
import 'package:mercury/presentation/widgets/_widgets.dart';
import 'package:mercury/presentation/widgets/subheader_widget.dart';
import 'package:mercury/shared/constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => dataStore,
        child: BlocProvider(
          create: (context) => HomeBloc(context.read<Repository>()),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, homeState) {
              switch (homeState.state) {
                case HomeStates.loading:
                  BlocProvider.of<HomeBloc>(context).add(HomeLoadEvent());
                  return const Center(child: CircularProgressIndicator());
                case HomeStates.ready:
                default:
              }
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const EstatesWidget(),
                      Subheader(
                          text1: AppLocalizations.of(context)!.newEstates,
                          text2: AppLocalizations.of(context)!.onSale),
                      PropertiesWidget(
                          properties: homeState.properties,
                          priceFor: PriceFor.forBuy),
                      TextButton(
                        onPressed: () {},
                        child: _seeMore(),
                      ),
                      Subheader(
                          text1: AppLocalizations.of(context)!.newEstates,
                          text2: AppLocalizations.of(context)!.onRent),
                      PropertiesWidget(
                          properties: homeState.properties,
                          priceFor: PriceFor.forRent),
                      TextButton(
                        onPressed: () {},
                        child: _seeMore(),
                      ),
                      const ContactWidget(),
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

  Widget _seeMore() {
    return Container(
        color: globalColorButton,
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
        child: Text(AppLocalizations.of(context)!.seeMore,
            style: const TextStyle(
                color: globalColorWhite, fontWeight: FontWeight.bold)));
  }
}
