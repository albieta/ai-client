import 'package:ai_client/domain/entities/general.dart';
import 'package:flutter/material.dart';

class ElementWidget extends StatelessWidget {
  
  final GeneralEntity element;

  const ElementWidget({
    Key? key,
    required this.element,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildFieldWidgets(),
              ),
            ),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildFieldWidgets() {
    List<Widget> widgets = [];

    try {
      final fieldsWithValues = element.getFieldsWithValues();

      for (final field in fieldsWithValues.keys) {
        final value = fieldsWithValues[field];

        widgets.add(
          Text('$field: $value'),
        );
      }
    } catch (e) {
      print('Error: $e');
    }

    return widgets;
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            //Todo
          },
        ),
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            //Todo
          },
        ),
      ],
    );
  }

}