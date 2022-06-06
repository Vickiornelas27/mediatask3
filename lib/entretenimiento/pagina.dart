import 'package:flutter/material.dart';
import 'package:mediatask3/entretenimiento/paginaentretenimiento.dart';
import 'package:mediatask3/servicio.dart';
import 'package:provider/provider.dart';

class hi extends StatefulWidget {
  const hi({Key? key}) : super(key: key);

  @override
  State<hi> createState() => _hiState();
}

class _hiState extends State<hi> {
  List<Widget> paginas = [en()];
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('MEDIATASK'),
            centerTitle: true,
            //backgroundColor: Colors.greenAccent,
            flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black12, Colors.red],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft))),
          ),
          body: ListView.builder(
            itemBuilder: formaWidget,
            itemCount: 5,
          ),
          // ignore: prefer_const_literals_to_create_immutables
          bottomNavigationBar: BottomNavigationBar(items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'NEWS'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'Entretenimiento')
          ]),
        ),
      );
}

Widget formaWidget(BuildContext context, int index) {
  final datosNoticias = Provider.of<servicio>(context);

  if (datosNoticias.propiedades.isEmpty) {
    return Container(
      color: Colors.white,
      child: const CircularProgressIndicator(
        color: Colors.black,
      ),
    );
  }
  return Column(
    children: [
      ListTile(
        title: (Text(datosNoticias.propiedades[index].title!)),
        subtitle: (Text(datosNoticias.propiedades[index].description)),
      ),
      Text(datosNoticias.propiedades[index].publishedAt.toString()),
      Container(
        child: Image.asset('assets/logo.jpg'),
      ),
    ],
  );
}
