import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:mercury/data/stub/data_store_stub.dart';
import 'package:mercury/domain/repository/repository.dart';
import 'package:flutter/rendering.dart';
import 'package:mercury/home/screens/home_screen.dart';

Repository? dataStore;

void main() {
  // aqui podemos elegir el repositorio real o uno de prueba (stub)
  dataStore = DataStoreStub();
  runApp(const MainApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      name: 'main',
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      // routes: <RouteBase>[
      //   GoRoute(
      //     path: 'propertyDetails/:id',
      //     builder: (BuildContext context, GoRouterState state) {
      //       return const PropertyScreen(state.pathParameters["id"]);
      //     },
      //   ),
      // ],
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    debugPaintSizeEnabled = false;
    return MaterialApp.router(
        debugShowCheckedModeBanner: !kDebugMode,
        checkerboardOffscreenLayers: true,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: "Roboto",
        ),
        routerConfig: _router);
  }
}

/* 
 *routing 
 */
class Routes {
  static var home = "/home";
}
