import 'package:flutter/material.dart';
import 'package:flutter_burc_projesi/utils/strings.dart';

import 'models/burc.dart';

class BurcListe extends StatelessWidget {
  static List<Burc> tumBurclar;

  @override
  Widget build(BuildContext context) {
    tumBurclar = veriKaynaginiHazirla();
    return Scaffold(
      appBar: AppBar(
        title: Text("Burç Rehberi"),
      ),
      body: listeyiHazirla(),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> burclar = [];
    for (int i = 0; i < 12; i++) {
      String _kucukresim =
          Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png";
      String _buyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk" + "${i + 1}.png";
      Burc eklenecekBurclar = Burc(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          _kucukresim,
          _buyukResim);
      burclar.add(eklenecekBurclar);
    }
    return burclar;
  }

  Widget listeyiHazirla() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return tekSatirBurc(context, index);
      },
      itemCount: tumBurclar.length,
    );
  }

  Widget tekSatirBurc(BuildContext context, int index) {
    Burc oanEklenenBurc = tumBurclar[index];
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListTile(
          onTap: () => Navigator.pushNamed(context, "/burcDetay/$index"),
          leading: Image.asset("images/" + oanEklenenBurc.burcKucukResim,
              width: 64, height: 64),
          title: Text(
            oanEklenenBurc.burcAdi,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              oanEklenenBurc.burcTarihi,
              style: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}
