import 'package:flutter/material.dart';
import 'package:flutter_application_1a/model/ListUserResponse.dart';
import 'package:flutter_application_1a/model/UserResponse.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  ListuserResponse? listuserResponse;
  List<ListuserResponse> userList = [];

  @override
  void initState() {
    ListuserResponse.getData("2").then((value) {
      userList = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar User'),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              return InkWell(
                child: Card(
                  child: Row(children: [
                    Image(
                        width: 100,
                        height: 100,
                        image: NetworkImage(userList[index].avatar)),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(userList[index].firstName),
                          Text(userList[index].email),
                        ],
                      ),
                    )
                  ]),
                ),
              );
            }),
      ),
    );
  }
}
