import 'package:mobx/mobx.dart';

class Global {
  Global() {
    addDenuncia = Action(_addDenuncia);
  }

  Observable _denuncia = Observable({});

  Object get denuncia => _denuncia.value;

  Action? addDenuncia;

  void _addDenuncia(Object denuncia) {
    _denuncia.value = denuncia;
  }
}
