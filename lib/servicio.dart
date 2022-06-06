import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mediatask3/modelo.dart';

class servicio extends ChangeNotifier {
  final String _urlBase = 'api.mediastack.com';
  final String _apiKey = '57acc1619ba952df14aff694b7a52d26';

  List<Datum> propiedades = [];
  List<Datum> propiedadesEntretenimiento = [];

  servicio() {
    getServicio();
    getEntretenimiento();
  }
  getServicio() async {
    final url = Uri.https(_urlBase, '/v1/news',
        {'keyword': 'tennis', 'access_key': _apiKey, 'countries': 'us'});
    final respuesta = await http.get(url);
    final noticia = Noticias.fromJson(respuesta.body);
    propiedades = noticia.data!;
    print(propiedades[0].category);
    notifyListeners();
  }

  getEntretenimiento() async {
    final url = Uri.https(_urlBase, '/v1/news',
        {'keyword': 'entertainment', 'access_key': _apiKey, 'countries': 'mx'});
    final respuesta = await http.get(url);
    final noticia = Noticias.fromJson(respuesta.body);
    propiedadesEntretenimiento = noticia.data!;
    print(propiedadesEntretenimiento[0].country);
    notifyListeners();
  }
}
