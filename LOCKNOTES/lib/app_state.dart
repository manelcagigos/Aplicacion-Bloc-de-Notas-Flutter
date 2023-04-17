import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _hola = prefs.getString('ff_hola') ?? _hola;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _buscando = false;
  bool get buscando => _buscando;
  set buscando(bool _value) {
    _buscando = _value;
  }

  String _nombrepr = '';
  String get nombrepr => _nombrepr;
  set nombrepr(String _value) {
    _nombrepr = _value;
  }

  String _TextoQR = '';
  String get TextoQR => _TextoQR;
  set TextoQR(String _value) {
    _TextoQR = _value;
  }

  String _TituloQR = '';
  String get TituloQR => _TituloQR;
  set TituloQR(String _value) {
    _TituloQR = _value;
  }

  String _FechaQR = '';
  String get FechaQR => _FechaQR;
  set FechaQR(String _value) {
    _FechaQR = _value;
  }

  String _nota = '';
  String get nota => _nota;
  set nota(String _value) {
    _nota = _value;
  }

  String _hola = '';
  String get hola => _hola;
  set hola(String _value) {
    _hola = _value;
    prefs.setString('ff_hola', _value);
  }

  String _titulomapa = '';
  String get titulomapa => _titulomapa;
  set titulomapa(String _value) {
    _titulomapa = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
