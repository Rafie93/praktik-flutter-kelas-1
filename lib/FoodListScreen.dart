import 'package:flutter/material.dart';
import 'package:flutter_application_1a/model/FoodItem.dart';

class FoodListScreen extends StatefulWidget {
  const FoodListScreen({super.key});

  @override
  State<FoodListScreen> createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  List foodList = [
    FoodItem(
        harga: "Rp. 10000",
        nama: "Bakso",
        deskripsi: "----",
        gambar:
            "https://awsimages.detik.net.id/community/media/visual/2022/10/12/resep-mie-ayam-kecap_43.jpeg",
        kategori: "Bakso"),
    FoodItem(
        harga: "Rp. 1200",
        nama: "Mie Indomies 2",
        deskripsi: "----",
        gambar:
            "https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/p1/294/2023/09/12/Ramen-goreng-2909020996.jpg",
        kategori: "Mie"),
    FoodItem(
        harga: "Rp. 1200",
        nama: "Mie Indomies 2",
        deskripsi: "----",
        gambar:
            "https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/p1/294/2023/09/12/Ramen-goreng-2909020996.jpg",
        kategori: "Mie"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          setState(() {
            // refresh foodlist
            foodList = foodList.toList();
          })
        },
        child: Icon(Icons.refresh),
      ),
      body: ListView.builder(
          itemCount: foodList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => {
                setState(() {
                  // foodList
                  foodList = foodList
                      .where((element) => element.kategori == "Bakso")
                      .toList();
                })
              },
              child: Card(
                child: Row(children: [
                  Image(
                      width: 100,
                      height: 100,
                      image: NetworkImage(foodList[index].gambar)),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(foodList[index].nama),
                        Text(foodList[index].harga),
                      ],
                    ),
                  )
                ]),
              ),
            );
          }),
    );
  }
}
