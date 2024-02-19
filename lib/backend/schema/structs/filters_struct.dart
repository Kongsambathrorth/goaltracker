// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FiltersStruct extends BaseStruct {
  FiltersStruct({
    bool? archived,
  }) : _archived = archived;

  // "archived" field.
  bool? _archived;
  bool get archived => _archived ?? false;
  set archived(bool? val) => _archived = val;
  bool hasArchived() => _archived != null;

  static FiltersStruct fromMap(Map<String, dynamic> data) => FiltersStruct(
        archived: data['archived'] as bool?,
      );

  static FiltersStruct? maybeFromMap(dynamic data) =>
      data is Map ? FiltersStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'archived': _archived,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'archived': serializeParam(
          _archived,
          ParamType.bool,
        ),
      }.withoutNulls;

  static FiltersStruct fromSerializableMap(Map<String, dynamic> data) =>
      FiltersStruct(
        archived: deserializeParam(
          data['archived'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'FiltersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FiltersStruct && archived == other.archived;
  }

  @override
  int get hashCode => const ListEquality().hash([archived]);
}

FiltersStruct createFiltersStruct({
  bool? archived,
}) =>
    FiltersStruct(
      archived: archived,
    );
