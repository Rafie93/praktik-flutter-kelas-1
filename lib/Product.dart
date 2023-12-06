import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Product Page'),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(children: [
                  Image(
                      image: NetworkImage(
                          "https://cdn-brilio-net.akamaized.net/community/community-news/2019/11/12/9d003345e078b070b5d46c7096a43f62/12-image_1573542286_5dca598ee1599.jpg"),
                      width: 100,
                      height: 100),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Silver Quen',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Rp. 20.000'),
                        Text('Stok : 10'),
                      ],
                    ),
                  )
                ]),
              ),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(children: [
                  Image(
                      image: NetworkImage(
                          "https://cdn-brilio-net.akamaized.net/community/community-news/2019/11/12/9d003345e078b070b5d46c7096a43f62/12-image_1573542286_5dca598ee1599.jpg"),
                      width: 100,
                      height: 100),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Silver Quen',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Rp. 20.000'),
                        Text('Stok : 10'),
                      ],
                    ),
                  )
                ]),
              ),
            )
          ],
        ));
  }
}
