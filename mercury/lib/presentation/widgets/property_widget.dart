import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:mercury/constants.dart';
import 'package:mercury/domain/entities/_entities.dart';

class PropertyWidget extends StatefulWidget {
  final Property property;

  const PropertyWidget({
    super.key,
    String types = "",
    required this.property,
  });

  @override
  State<StatefulWidget> createState() => _PropertyWidgetState();
}

class _PropertyWidgetState extends State<PropertyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image.network(widget.property.imageUrl, fit: BoxFit.cover),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: alertColor,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      widget.property.type,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                        widget.property.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: mainColor),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 24, top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  style: const TextStyle(color: Colors.black54, fontSize: 18),
                ),
                Text(
                  "\$${NumberFormat("###,###.##").format(widget.property.price)}",
                  style: const TextStyle(color: Colors.black54, fontSize: 24),
                ),
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
}
