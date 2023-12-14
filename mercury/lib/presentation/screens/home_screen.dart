import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercury/adapters/_adapters.dart';
import 'package:mercury/entities/_entities.dart';
import 'package:mercury/presentation/screens/home_bloc.dart';
import 'package:mercury/presentation/widgets/_widgets.dart';

class HomeScreen extends StatefulWidget {
  final List<Property>? properties;
  const HomeScreen({super.key, this.properties});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // var repository = PropertyAdapterStub();
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const ContactWidget(),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   body: BlocProvider(
    //     create: (context) => HomeBloc(repository),
    //     child: BlocBuilder<HomeBloc, HomeState>(
    //       builder: (context, homeState) {
    //         switch (homeState.state) {
    //           case HomeStates.loading:
    //             BlocProvider.of<HomeBloc>(context).add(HomeLoadEvent());
    //             return const Center(child: CircularProgressIndicator());
    //           case HomeStates.ready:
    //           default:
    //         }
    //         return Center(
    //           child: SingleChildScrollView(
    //             child: Column(
    //               children: [
    //                 PropertiesWidget(properties: homeState.properties),
    //                 const ContactWidget(),
    //               ],
    //             ),
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}
