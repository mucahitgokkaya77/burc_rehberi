import 'package:flutter/material.dart';
import 'package:flutter_burc_projesi/burc_detay.dart';
import 'package:flutter_burc_projesi/burc_liste.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/burcListesi",
      routes: {
        "/": (context) => BurcListe(),
        "/burcListesi": (context) => BurcListe(),
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathElemanlari = settings.name.split("/");
        if (pathElemanlari[1] == "burcDetay") {
          return MaterialPageRoute(
              builder: (context) => BurcDetay(int.parse(pathElemanlari[2])));
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
      title: "Burç Rehberi",
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
