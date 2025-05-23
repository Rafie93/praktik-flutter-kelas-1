import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1a/DaftarMotor.dart';
import 'package:flutter_application_1a/FoodListScreen.dart';
import 'package:flutter_application_1a/HistoryPage.dart';
import 'package:flutter_application_1a/HistoryScreen.dart';
import 'package:flutter_application_1a/ImageUploadScreen.dart';
import 'package:flutter_application_1a/MinumanPage.dart';
import 'package:flutter_application_1a/RegisterScreen.dart';
import 'package:flutter_application_1a/UserScreen.dart';
import 'package:flutter_application_1a/model/RegisterResponse.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  final fbapiKey = dotenv.env['FIREBASE_API_KEY'];
  final fbappid = dotenv.env['FIREBASE_APP_ID'];
  final fbsender = dotenv.env['FIREBASE_SENDER_ID'];
  final fbproject = dotenv.env['FIREBASE_PROJECT_ID'];
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: fbapiKey!,
          appId: fbappid!,
          messagingSenderId: fbsender!,
          projectId: fbproject!));

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Whatshapp Clone',
    home: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.green),
                    accountName: Text("Rafie"),
                    accountEmail: Text("raf@gmail.com")),
                ListTile(
                  title: Text('Minum'),
                  leading: Icon(Icons.food_bank_sharp),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Historypage()));
                  },
                ),
                ListTile(
                  title: Text('Register'),
                  leading: Icon(Icons.app_registration),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  },
                ),
                ListTile(
                  title: Text('List User'),
                  leading: Icon(Icons.app_registration),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserScreen()));
                  },
                ),
                ListTile(
                  title: Text('Home'),
                  leading: Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Makanan'),
                  leading: Icon(Icons.food_bank),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodListScreen()));
                  },
                ),
                ListTile(
                  title: Text('History'),
                  leading: Icon(Icons.history),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HistoryScreen()));
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.red,
            child: Icon(Icons.refresh),
          ),
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
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: 0,
              onTap: (int index) {
                print(index);
              },
              selectedItemColor: Colors.red,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Order'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_box), label: 'Account'),
              ]),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ImageUploadScreen()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red[400],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_basket,
                                size: 50,
                                color: Colors.white,
                              ),
                              Text(
                                'Produk',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DaftarMotor()));
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green[300],
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                  height: 50,
                                  width: 50,
                                  image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOg6oKIOxVAqdwvCGEHRLzUSERajwCRf2L-w&s")),
                              Text(
                                'Motor',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue[300],
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                  height: 50,
                                  width: 50,
                                  image: AssetImage("assets/images/diet.png")),
                              Text(
                                'Makanan',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue[300],
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                  height: 50,
                                  width: 50,
                                  image: AssetImage("assets/images/diet.png")),
                              Text(
                                'Makanan',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // SLIDER START
                Text("Daftar Slider"),
                Container(
                  height: 150,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                              width: 300,
                              image: NetworkImage(
                                  "https://images.tokopedia.net/img/cache/730/kjjBfF/2021/6/14/658ede0f-7236-425e-bef3-a498a6c14912.jpg")),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                              width: 300,
                              image: NetworkImage(
                                  "https://images.tokopedia.net/img/cache/730/kjjBfF/2021/6/14/658ede0f-7236-425e-bef3-a498a6c14912.jpg")),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                              width: 300,
                              image: NetworkImage(
                                  "https://images.tokopedia.net/img/cache/730/kjjBfF/2021/6/14/658ede0f-7236-425e-bef3-a498a6c14912.jpg")),
                        ),
                      ),
                    ],
                  ),
                ),

                /// END SLIDER
                SizedBox(height: 10),
              ],
            ),
          )),
    );
  }
}
