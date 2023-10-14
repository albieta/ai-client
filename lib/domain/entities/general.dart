import 'package:equatable/equatable.dart';

class GeneralEntity extends Equatable {

  final dynamic modelJsonSchema;

  final dynamic data;  

  const GeneralEntity(
    this.modelJsonSchema,
    this.data
  );

  @override
  List<Object?> get props => [modelJsonSchema, data];

  // List of field names
  List<String> getFieldNames() {
    if (modelJsonSchema['type'] == 'object' &&
        modelJsonSchema.containsKey('properties')) {
      return (modelJsonSchema['properties'] as Map<String, dynamic>).keys.toList();
    }
    return [];
  }

  // Map of field names and values
  Map<String, dynamic> getFieldsWithValues() {
    final fields = getFieldNames();
    final values = <String, dynamic>{};
    for (final field in fields) {
      if (data.containsKey(field)) {
        values[field] = data[field];
      }
    }
    return values;
  }

  // Map of field names and types
  Map<String, String> getFieldsWithTypes() {
    final fields = getFieldNames();
    final types = <String, String>{};
    if (modelJsonSchema['type'] == 'object' &&
        modelJsonSchema.containsKey('properties')) {
      final properties = modelJsonSchema['properties'] as Map<String, dynamic>;
      for (final field in fields) {
        if (properties.containsKey(field) &&
            properties[field].containsKey('type')) {
          types[field] = properties[field]['type'];
        }
      }
    }
    return types;
  }
}
