import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1a/model/DaftarResponse.dart';
import 'package:flutter_application_1a/model/JobUserResponse.dart';
import 'package:flutter_application_1a/model/RegisterResponse.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

final db = FirebaseFirestore.instance;

class _RegisterScreenState extends State<RegisterScreen> {
  JobUserResponse? jobUserResponse;
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Screen'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 10),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: jobController,
                  decoration: InputDecoration(
                    hintText: 'Enter your Job',
                    labelText: 'Job',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (nameController.text == "" ||
                          jobController.text == "") {
                        Fluttertoast.showToast(
                            msg: "Name and Job cannot be empty",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 10,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        return;
                      }
                      db.collection('register').add({
                        'nama': nameController.text,
                        'job': jobController.text
                      });
                      // JobUserResponse.kirimDataJobUser(
                      //         nameController.text, jobController.text)
                      //     .then((value) {
                      //   setState(() {
                      //     jobUserResponse = value;
                      //     Fluttertoast.showToast(
                      //         msg:
                      //             "Data berhasil disimpan atas nama ${jobUserResponse!.nama} dengan pekerjaan ${jobUserResponse!.pekerjaan} dan id ${jobUserResponse!.id} pada tanggal ${jobUserResponse!.tanggal}",
                      //         toastLength: Toast.LENGTH_SHORT,
                      //         gravity: ToastGravity.CENTER,
                      //         timeInSecForIosWeb: 10,
                      //         backgroundColor: Colors.red,
                      //         textColor: Colors.white,
                      //         fontSize: 16.0);
                      //   });
                      // });
                    },
                    child: Text('Submit'),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
