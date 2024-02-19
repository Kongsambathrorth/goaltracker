import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_filters')) {
        try {
          final serializedData = prefs.getString('ff_filters') ?? '{}';
          _filters =
              FiltersStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  FiltersStruct _filters = FiltersStruct.fromSerializableMap(jsonDecode('{}'));
  FiltersStruct get filters => _filters;
  set filters(FiltersStruct value) {
    _filters = value;
    prefs.setString('ff_filters', value.serialize());
  }

  void updateFiltersStruct(Function(FiltersStruct) updateFn) {
    updateFn(_filters);
    prefs.setString('ff_filters', _filters.serialize());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
