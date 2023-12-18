import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mercury/data/stub/data_store_stub.dart';
import 'package:mercury/domain/repository/repository.dart';
import 'package:mercury/presentation/container/container_screen.dart';

Repository? dataStore;

void main() {
  // aqui podemos elegir el repositorio real o uno de prueba (stub)
  dataStore = DataStoreStub();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: !kDebugMode,
      checkerboardOffscreenLayers: true,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Roboto",
      ),
      home: const ContainerScreen(),
    );
  }
}

/* 
 *routing 
 */
class Routes {
  static var home = "/home";
}
