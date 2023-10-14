import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ElementWidget extends StatelessWidget {
  
  final Equatable element;

  const ElementWidget({
    Key? key,
    required this.element,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildFieldWidgets(),
        ),
    );
  }

  List<Widget> _buildFieldWidgets() {
    List<Widget> widgets = [];

    try {
      for (Object? prop in element.props) {
        widgets.add(Text('$prop'));
      }
    } catch (e) {
      print('Error: $e');
    }

    return widgets;
  }

}