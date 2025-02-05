import 'package:flutter/material.dart';
import '/backend/backend.dart';
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
      _taxaExists = prefs.getDouble('ff_taxaExists') ?? _taxaExists;
    });
    _safeInit(() {
      _taxaDestaque = prefs.getDouble('ff_taxaDestaque') ?? _taxaDestaque;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _apiImgBBkey = '5ff7b7fed81442c9f35d042675cd5cc1';
  String get apiImgBBkey => _apiImgBBkey;
  set apiImgBBkey(String value) {
    _apiImgBBkey = value;
  }

  double _taxaExists = 0.0;
  double get taxaExists => _taxaExists;
  set taxaExists(double value) {
    _taxaExists = value;
    prefs.setDouble('ff_taxaExists', value);
  }

  double _taxaDestaque = 0.0;
  double get taxaDestaque => _taxaDestaque;
  set taxaDestaque(double value) {
    _taxaDestaque = value;
    prefs.setDouble('ff_taxaDestaque', value);
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
