import 'package:flutter/material.dart';
import 'package:flutter_application_1a/model/ItemMakanan.dart';

class MakananPage2 extends StatefulWidget {
  final String title;
  const MakananPage2({super.key, required this.title});
  @override
  State<MakananPage2> createState() => _MakananPage2State();
}

class _MakananPage2State extends State<MakananPage2> {
  List makanList = [
    ItemMakanan(
        nama: "Mie Ayam",
        harga: 10000,
        image:
            "https://awsimages.detik.net.id/community/media/visual/2022/10/12/resep-mie-ayam-kecap_43.jpeg"),
    ItemMakanan(
        nama: "Mie Ayam",
        harga: 10000,
        image:
            "https://awsimages.detik.net.id/community/media/visual/2022/10/12/resep-mie-ayam-kecap_43.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.title),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: makanList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              children: [
                Image(
                  width: 100,
                  height: 100,
                  image: NetworkImage(makanList[index].image),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(makanList[index].nama),
                      Text(makanList[index].harga.toString()),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
