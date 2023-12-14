import 'package:flutter/widgets.dart';
import 'package:mercury/entities/property.dart';
import 'package:mercury/presentation/widgets/_widgets.dart';

class PropertiesWidget extends StatefulWidget {
  final List<Property>? properties;

  const PropertiesWidget({super.key, required this.properties});

  @override
  State<StatefulWidget> createState() => PropertiesWidgetState();
}

class PropertiesWidgetState extends State<PropertiesWidget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> props = List.empty(growable: true);
    if (widget.properties != null) {
      for (var element in widget.properties!) {
        props.add(PropertyWidget(property: element));
      }
    }

    return Column(
      children: [...props],
    );
  }
}
