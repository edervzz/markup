import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mercury/data/stub/data_store_stub.dart';
import 'package:mercury/domain/repository/repository.dart';
import 'package:mercury/presentation/container/container_screen.dart';

const mainColor = Color(0xFF4966F2);
const activeColor = Color(0xFF49F2A3);
const pasiveColor = Color.fromARGB(255, 106, 106, 106);

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
      debugShowCheckedModeBanner: true,
      checkerboardOffscreenLayers: true,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Calibri",
      ),
      home: ContainerScreen(),
    );
  }
}

/* 
 *routing 
 */
class Routes {
  static var home = "/home";
}
