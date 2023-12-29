import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:mercury/home/widgets/price_for_widget.dart';
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
            fit: StackFit.passthrough,
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              image(widget.property.imageUrl),
              Column(
                children: [
                  Container(
                    color: Colors.black26,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Column(
                      children: [
                        Text(
                          widget.property.propertyName,
                          maxLines: 2,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: globalColorWhite,
                              fontSize: 30),
                        ),
                        Text(
                          widget.property.location,
                          maxLines: 2,
                          style: const TextStyle(
                              color: globalColorWhite, fontSize: 18),
                        ),
                        Text(
                          "\$${NumberFormat("###,###.##").format(widget.property.price)}",
                          style: const TextStyle(
                              color: globalColorWhite, fontSize: 24),
                        ),
                        PriceForBanner(priceFor: widget.property.priceFor),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.black26,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Icon(Icons.bed_outlined,
                                    color: globalColorWhite),
                                Text(AppLocalizations.of(context)!.rooms,
                                    style: TextStyle(color: globalColorWhite)),
                                Text(widget.property.rooms.toString(),
                                    style: TextStyle(color: globalColorWhite)),
                              ],
                            ),
                            Column(
                              children: [
                                const Icon(Icons.bathtub_outlined,
                                    color: globalColorWhite),
                                Text(AppLocalizations.of(context)!.bathrooms,
                                    style: TextStyle(color: globalColorWhite)),
                                Text(widget.property.bathrooms.toString(),
                                    style: TextStyle(color: globalColorWhite)),
                              ],
                            ),
                            Column(
                              children: [
                                const Icon(Icons.format_list_numbered_rtl,
                                    color: globalColorWhite),
                                Text(AppLocalizations.of(context)!.levels,
                                    style: TextStyle(color: globalColorWhite)),
                                Text(widget.property.levels.toString(),
                                    style: TextStyle(color: globalColorWhite)),
                              ],
                            ),
                            Column(
                              children: [
                                const Icon(Icons.dashboard_outlined,
                                    color: globalColorWhite),
                                Text(AppLocalizations.of(context)!.mt2,
                                    style: TextStyle(color: globalColorWhite)),
                                Text(widget.property.mt2.toString(),
                                    style: TextStyle(color: globalColorWhite)),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: 2))
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
