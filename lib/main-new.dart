import 'package:flutter/material.dart';
import 'package:flutter_application_1a/horizontalscroll.dart';
import 'package:flutter_application_1a/makanan.dart';
import 'package:flutter_application_1a/makanan_stfl.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Whatshapp Clone',
    home: MainApp2(),
  ));
}

class MainApp2 extends StatelessWidget {
  const MainApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Whatshapp Clone'),
            backgroundColor: Colors.blue,
            actions: [
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MakananPage2(title: "Hallo Page 2"),
                              ),
                            );
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red[200],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  width: 50,
                                  height: 50,
                                  image: AssetImage("assets/images/diet.png"),
                                ),
                                Text(
                                  'Makanan',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                          // icon

                          ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HorizontalScroll(),
                            ),
                          );
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          final snackBar = SnackBar(
                            content: const Text('Yay! A SnackBar!'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                // Some code to und o the change.
                              },
                            ),
                          );

                          // Find the ScaffoldMessenger in the widget tree
                          // and use it to show a SnackBar.
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          color: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 120,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 5),
                          width: 200,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    'https://i.pinimg.com/originals/72/7f/14/727f14f81890606a8b8dcb77a42bfeeb.jpg')),
                          ),
                        ),
                        Container(
                          width: 160,
                          color: Colors.blue,
                        ),
                        Container(
                          width: 160,
                          color: Colors.green,
                        ),
                        Container(
                          width: 160,
                          color: Colors.yellow,
                        ),
                        Container(
                          width: 160,
                          color: Colors.orange,
                        ),
                        Container(
                          width: 160,
                          color: Colors.purple,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  width: double.infinity,
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Submit'),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
