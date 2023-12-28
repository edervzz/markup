import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mercury/domain/entities/_entities.dart';
import 'package:mercury/shared/_shared.dart';

class PriceForBanner extends StatelessWidget {
  final PriceFor priceFor;

  const PriceForBanner({super.key, required this.priceFor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: globalColorAlert,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        (priceFor == PriceFor.forBuy
                ? AppLocalizations.of(context)!.buy
                : AppLocalizations.of(context)!.rent)
            .toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
          letterSpacing: 3,
        ),
      ),
    );
  }
}
