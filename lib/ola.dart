import 'package:flutter/material.dart';
import 'package:mediatask3/servicio.dart';
import 'package:provider/provider.dart';

class ola extends StatelessWidget {
  const ola({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final datosNoticias = Provider.of<servicio>(context);
    if (datosNoticias.propiedades.isEmpty) {
      return Container(
        color: Colors.white,
        child: const CircularProgressIndicator(
          color: Colors.black,
        ),
      );
    }
    print(datosNoticias);
    return Container(
      color: Colors.amber,
      child: Text(datosNoticias.propiedades[0].description),
    );
  }
}
