import 'package:flutter/material.dart';

class MakananPage extends StatelessWidget {
  final String title;
  const MakananPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
          backgroundColor: Colors.blue,
        ),
        body: ListView(
          children: [
            Card(
              child: Row(
                children: [
                  Image(
                    width: 100,
                    height: 100,
                    image: NetworkImage(
                        "https://awsimages.detik.net.id/community/media/visual/2022/10/12/resep-mie-ayam-kecap_43.jpeg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Mie Ayam Kecap'),
                        Text('Rp. 10.000'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  Image(
                      width: 100,
                      height: 100,
                      image: NetworkImage(
                          "https://awsimages.detik.net.id/community/media/visual/2022/10/12/resep-mie-ayam-kecap_43.jpeg")),
                  Text('Mie Ayam Bakso'),
                  Text('Rp. 12.000'),
                ],
              ),
            ),
          ],
        ));
  }
}
