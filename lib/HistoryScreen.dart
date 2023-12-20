import 'package:flutter/material.dart';
import 'package:flutter_application_1a/model/HistoryItem.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List historyList = [
    HistoryItem(
        date: "20/12/2023",
        no_order: "O12020202",
        makanan: "MIE AYAM",
        makanan_image:
            "https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/p1/294/2023/09/12/Ramen-goreng-2909020996.jpg",
        subtotal: "Rp. 10000",
        quantity: "2"),
    HistoryItem(
        date: "20/12/2023",
        no_order: "O12020203",
        makanan: "MIE AYAM JOMBO",
        makanan_image:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Mi_ayam_jamur.JPG/1200px-Mi_ayam_jamur.JPG",
        subtotal: "Rp. 12000",
        quantity: "1"),
    HistoryItem(
        date: "21/12/2023",
        no_order: "O12020204",
        makanan: "MIE AYAM JOMBO",
        makanan_image:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Mi_ayam_jamur.JPG/1200px-Mi_ayam_jamur.JPG",
        subtotal: "Rp. 12000",
        quantity: "1"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('History'),
        ),
        body: ListView.builder(
          itemCount: historyList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => {
                setState(() {
                  historyList = historyList
                      .where((element) => element.makanan == "MIE AYAM")
                      .toList();
                }),
              },
              child: Card(
                child: Container(
                  child: Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                  image: NetworkImage(
                                      historyList[index].makanan_image)))),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(historyList[index].date),
                            Text(historyList[index].no_order),
                            Text(historyList[index].makanan),
                            Text(historyList[index].subtotal),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
