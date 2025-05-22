import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final db = FirebaseFirestore.instance;

class DaftarMotor extends StatelessWidget {
  const DaftarMotor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Motor'),
      ),
      body: StreamBuilder(
          stream: db.collection("register").snapshots(),
          builder: (context, AsyncSnapshot snapshots) {
            return ListView.builder(
              itemCount: snapshots.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot documentSnapshot = snapshots.data.docs[index];
                // return ListTile(
                //   title: Text(documentSnapshot['nama']),
                //   subtitle: Text(documentSnapshot['job']),
                // );
                return ListTile(
                  subtitle: Card(
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              height: 100,
                              width: 100,
                              image: NetworkImage(
                                  "https://static.wixstatic.com/media/a21dd2_074ea68fc4a94bbeac57cdda0f66cb48~mv2.jpg/v1/fit/w_320,h_328,q_90/a21dd2_074ea68fc4a94bbeac57cdda0f66cb48~mv2.jpg"),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  documentSnapshot['nama'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  documentSnapshot["job"],
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.green[800]),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
