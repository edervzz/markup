import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mercury/data/shared_pref_keys.dart';
import 'package:mercury/domain/entities/_entities.dart';
import 'package:mercury/shared/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PropertyDetailWidget extends StatefulWidget {
  final Property property;

  const PropertyDetailWidget({super.key, required this.property});

  @override
  State<StatefulWidget> createState() => PropertyDetailState();
}

class PropertyDetailState extends State<PropertyDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.property.propertyName,
                  maxLines: 2,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 20),
                ),
                Text(
                  widget.property.location,
                  maxLines: 2,
                  style: const TextStyle(color: Colors.black54, fontSize: 18),
                ),
              ],
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                ),
                child:
                    Image.network(widget.property.imageUrl, fit: BoxFit.cover),
                onPressed: () {},
              ),
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
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${NumberFormat("###,###.##").format(widget.property.price)}",
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 24),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                          iconSize: 30,
                          onPressed: () async {
                            var isFavorite =
                                widget.property.isFavorite ? false : true;
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            final favs =
                                prefs.getStringList(favoriteProperties);

                            if (favs?.isNotEmpty == true) {
                              var f = favs!.firstWhere(
                                (element) =>
                                    element == widget.property.id.toString(),
                                orElse: () => "",
                              );
                              if (isFavorite) {
                                if (f.isEmpty) {
                                  favs.add(widget.property.id.toString());
                                }
                              } else {
                                if (f.isNotEmpty) {
                                  favs.remove(widget.property.id.toString());
                                }
                              }
                              prefs.setStringList(
                                favoriteProperties,
                                favs,
                              );
                            } else {
                              if (isFavorite) {
                                prefs.setStringList(
                                  favoriteProperties,
                                  <String>[widget.property.id.toString()],
                                );
                              }
                            }
                            setState(() {
                              widget.property.isFavorite = isFavorite;
                            });
                          },
                          icon: Icon(
                              widget.property.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: globalColorMain)),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          ),
        ],
      ),
      // ),
    );
  }

  // CarouselSlider(
  //   options: CarouselOptions(height: 400.0),
  //   items: [1, 2, 3, 4, 5].map((i) {
  //     // return Builder(
  //     //   builder: (BuildContext context) {
  //     return Container(
  //         width: MediaQuery.of(context).size.width,
  //         margin: const EdgeInsets.symmetric(horizontal: 5.0),
  //         decoration: const BoxDecoration(color: Colors.amber),
  //         child: Text(
  //           'text $i',
  //           style: const TextStyle(fontSize: 16.0),
  //         ));
  //     // },
  //     // );
  //   }).toList(),
  // )
}
