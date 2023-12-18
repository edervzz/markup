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
            "https://static.wixstatic.com/media/087ce3_76f7e79239384c5db22390fd5662d1ee~mv2.jpg/v1/fill/w_1729,h_815,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/087ce3_76f7e79239384c5db22390fd5662d1ee~mv2.jpg",
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
