import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercury/domain/repository/repository.dart';
import 'package:mercury/main.dart';
import 'package:mercury/presentation/home/home_bloc.dart';
import 'package:mercury/presentation/widgets/_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                      PropertiesWidget(properties: homeState.properties),
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
}
