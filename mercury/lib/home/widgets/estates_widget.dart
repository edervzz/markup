import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mercury/shared/constants.dart';

class EstatesWidget extends StatefulWidget {
  const EstatesWidget({super.key});

  @override
  State<StatefulWidget> createState() => _EstatesWidgetState();
}

class _EstatesWidgetState extends State<EstatesWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 250,
          child: Image.network(
            "https://cf.bstatic.com/xdata/images/hotel/max1024x768/330993383.jpg?k=931a8b3286d533d1bb984218304d85029f464ab79e0bb25083e25d6fe1d8b340&o=&hp=1",
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            Container(
              color: Colors.black26,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.newEstates,
                    style: const TextStyle(
                        color: globalColorWhite,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    AppLocalizations.of(context)!.exclusive,
                    style: const TextStyle(
                      color: globalColorWhite,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                color: globalColorButton,
                padding:
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
                child: Text(AppLocalizations.of(context)!.explore,
                    style: const TextStyle(
                        color: globalColorWhite, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ],
    );
  }
}
