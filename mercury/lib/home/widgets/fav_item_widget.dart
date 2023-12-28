import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:mercury/shared/constants.dart';
import 'package:mercury/data/shared_pref_keys.dart';
import 'package:mercury/domain/entities/_entities.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavItemWidget extends StatefulWidget {
  final Property property;

  const FavItemWidget({
    super.key,
    String types = "",
    required this.property,
  });

  @override
  State<StatefulWidget> createState() => _FavItemWidgetState();
}

class _FavItemWidgetState extends State<FavItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              image(widget.property.imageUrl),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: globalColorAlert,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      (widget.property.priceFor == PriceFor.forBuy
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
                  ),
                  Column(
                    children: [
                      Text(
                        widget.property.propertyName,
                        maxLines: 2,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: 30),
                      ),
                      Text(
                        widget.property.location,
                        maxLines: 2,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 18),
                      ),
                      Text(
                        "\$${NumberFormat("###,###.##").format(widget.property.price)}",
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 24),
                      ),
                    ],
                  ),
                  Container(),
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 24, top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.bed_outlined),
                        Text(AppLocalizations.of(context)!.rooms),
                        Text(widget.property.rooms.toString()),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.bathtub_outlined),
                        Text(AppLocalizations.of(context)!.bathrooms),
                        Text(widget.property.bathrooms.toString()),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.format_list_numbered_rtl),
                        Text(AppLocalizations.of(context)!.levels),
                        Text(widget.property.levels.toString()),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.dashboard_outlined),
                        Text(AppLocalizations.of(context)!.mt2),
                        Text(widget.property.mt2.toString()),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      // ),
    );
  }

  Image image(String url) {
    Image w;

    // try {
    //   w = Image.network(
    //     widget.property.imageUrl,
    //     fit: BoxFit.cover,
    //     errorBuilder: (context, error, stackTrace) {
    //       return Image.asset("assets/images/background.jpg");
    //     },
    //   );
    // } catch (e) {
    w = Image.asset("assets/images/background.jpg");
    // }
    return w;
  }

  Future<void> _setPreferedProp(Property property) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final favs = prefs.getStringList(favoriteProperties);

    if (favs?.isEmpty == true) {
      if (property.isFavorite) {
        prefs.setStringList(
          favoriteProperties,
          <String>[property.id.toString()],
        );
      }
    } else {
      var f = favs!.firstWhere((element) => element == property.id.toString());
      if (property.isFavorite) {
        if (f.isEmpty) {
          favs.add(property.id.toString());
        }
      } else {
        if (f.isNotEmpty) {
          favs.remove(property.id.toString());
        }
      }
      prefs.setStringList(
        favoriteProperties,
        <String>[property.id.toString()],
      );
    }
  }
}
