import 'package:flutter/widgets.dart';
import 'package:mercury/domain/entities/_entities.dart';
import 'package:mercury/home/widgets/_widgets.dart';

class PropertyListWidget extends StatefulWidget {
  final List<Property>? properties;
  final PriceFor? priceFor;

  const PropertyListWidget(
      {super.key, required this.properties, this.priceFor});

  @override
  State<StatefulWidget> createState() => PropertyListWidgetState();
}

class PropertyListWidgetState extends State<PropertyListWidget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> props = List.empty(growable: true);
    if (widget.properties != null) {
      for (var element in widget.properties!) {
        if (widget.priceFor != null) {
          if (element.priceFor == widget.priceFor) {
            props.add(PropertyWidget(property: element));
          }
        } else {
          props.add(PropertyWidget(property: element));
        }
      }
    }

    return Column(
      children: props,
    );
  }
}
