import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/parts/main_segments.dart';
import 'package:flutter_application_1/parts/off_page.dart';
import './parts/mainpage_product_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Duration _timeUntilTarget;

  final PageController controller = PageController(initialPage: 0);

  int currentPage = 0;

  late Color dot1 = const Color.fromRGBO(29, 78, 216, 1);
  late Color dot2 = Colors.grey;
  late Color dot3 = Colors.grey;
  late Color dot4 = Colors.grey;
  late Color dot5 = Colors.grey;

  int sayac = 0;

  @override
  void initState() {
    super.initState();

    DateTime targetDate = DateTime(2024, 1, 30, 11);

    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        int nextPage = (controller.page?.round() ?? 0) + 1;
        if (nextPage > 4) {
          nextPage = 0;
        }
        if (sayac == 8) {
          controller.animateToPage(nextPage,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
          sayac = 0;
        }
        sayac++;
        _timeUntilTarget = targetDate.difference(DateTime.now());
      });
    });

    //Hedef ana kalan sürenin hesaplandığı yer
    _timeUntilTarget = targetDate.difference(DateTime.now());

    // Sayfa değiştiği andaki işlemler
    controller.addListener(() {
      setState(() {
        currentPage = controller.page?.round() ?? 0;
        switch (currentPage) {
          case 0:
            dot1 = const Color.fromRGBO(29, 78, 216, 1);
            dot2 = Colors.grey;
            dot3 = Colors.grey;
            dot4 = Colors.grey;
            dot5 = Colors.grey;
          case 1:
            dot1 = Colors.grey;
            dot2 = const Color.fromRGBO(29, 78, 216, 1);
            dot3 = Colors.grey;
            dot4 = Colors.grey;
            dot5 = Colors.grey;
          case 2:
            dot1 = Colors.grey;
            dot2 = Colors.grey;
            dot3 = const Color.fromRGBO(29, 78, 216, 1);
            dot4 = Colors.grey;
            dot5 = Colors.grey;
          case 3:
            dot1 = Colors.grey;
            dot2 = Colors.grey;
            dot3 = Colors.grey;
            dot4 = const Color.fromRGBO(29, 78, 216, 1);
            dot5 = Colors.grey;
          case 4:
            dot1 = Colors.grey;
            dot2 = Colors.grey;
            dot3 = Colors.grey;
            dot4 = Colors.grey;
            dot5 = const Color.fromRGBO(29, 78, 216, 1);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime =
        "${_timeUntilTarget.inDays} DAY ${_timeUntilTarget.inHours % 24} HRS ${_timeUntilTarget.inMinutes % 60} MIN ${_timeUntilTarget.inSeconds % 60} SEC ";

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          centerTitle: false,
          actions: [
            IconButton(
              icon: Image.asset(
                'assets/notification.png',
                width: 24,
                height: 24,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                'assets/bag.png',
                width: 24,
                height: 24,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Search Anything...",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        color: Color(0xFFD1D5DB),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        color: Color(0xFF1F2937),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0.11,
                        letterSpacing: 0.07,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'View All ->',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0.12,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    MainSegment(
                      title: 'Fashion',
                      pictureAddress: 'assets/fashion.png',
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    MainSegment(
                      title: 'electronics',
                      pictureAddress: 'assets/electronic.png',
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    MainSegment(
                      title: 'Appliances',
                      pictureAddress: 'assets/Appliances.png',
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    MainSegment(
                      title: 'Beauty',
                      pictureAddress: 'assets/Beauty.png',
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    MainSegment(
                      title: 'Furniture',
                      pictureAddress: 'assets/Furniture.png',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: 360,
                height: 154,
                child: PageView(
                  controller: controller,
                  children: <Widget>[
                    Center(
                      child: Image.asset("assets/indirim.png"),
                    ),
                    Center(
                      child: Image.asset("assets/bilgisayar.png"),
                    ),
                    Center(
                      child: Image.asset("assets/takim elbise.png"),
                    ),
                    Center(
                      child: Image.asset("assets/kadin-elbise.png"),
                    ),
                    Center(
                      child: Image.asset("assets/cocuk-elbise.png"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.circle,
                        size: 6,
                        color: dot1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.circle,
                        size: 6,
                        color: dot2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.circle,
                        size: 6,
                        color: dot3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.circle,
                        size: 6,
                        color: dot4,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.circle,
                        size: 6,
                        color: dot5,
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              const SizedBox(
                height: 65,
              ),
              Container(
                height: 600,
                width: 400,
                color: const Color.fromARGB(255, 238, 238, 238),
                child: Stack(
                  children: [
                    Positioned(
                      top: 30,
                      left: 10,
                      right: 245,
                      child: Container(
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.red, // Set the background color
                          borderRadius:
                              BorderRadius.circular(2), // Set the border radius
                        ),
                        child: Center(
                          child: Text(
                            formattedTime,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Aligns children to the start (top)
                        children: [
                          Text(
                            'Deal of the day',
                            style: TextStyle(
                              color: Color(0xFF1F2937),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0.11,
                              letterSpacing: 0.07,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'View All ->',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFF6B7280),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0.12,
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 10,
                      right: 10,
                      child: Container(
                        height: 500,
                        color: Colors.white,
                        child: const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                            ),
                            Row(
                              children: [
                                OffPage(
                                  pitcureadress: "assets/greenshoe.png",
                                  title: 'Running Shoes',
                                  title2: 'Upto 40% OFF',
                                ),
                                OffPage(
                                  pitcureadress: "assets/Sneakers.png",
                                  title: 'Sneakers',
                                  title2: '40-60% OFF',
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                            ),
                            Row(
                              children: [
                                OffPage(
                                  pitcureadress: "assets/Wrist-Watches.png",
                                  title: 'Wrist Watches',
                                  title2: 'Upto 40% OFF',
                                ),
                                OffPage(
                                  pitcureadress:
                                      "assets/Bluetooth-Speakers.png",
                                  title: 'Bluetooth Speakers',
                                  title2: '40-60% OFF',
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 410,
                width: 400,
                color: Colors.white,
                child: Stack(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Aligns children to the start (top)
                        children: [
                          Text(
                            'Hot Selling Footwear',
                            style: TextStyle(
                              color: Color(0xFF1F2937),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0.11,
                              letterSpacing: 0.07,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'View All ->',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFF6B7280),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0.12,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: MainPage(
                              title: "Adidas wihite sneakers for men",
                              pitcureadress: "assets/adidas.png",
                              usdFiyat: 68,
                              percentageoff: 50,
                              rating: 4.8,
                              stock: 692.0,
                              oldprice: 136,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: MainPage(
                              title: "Nike black running shoes for men",
                              pitcureadress: "assets/Nike.png",
                              usdFiyat: 75,
                              percentageoff: 90,
                              rating: 4.2,
                              stock: 412,
                              oldprice: 90,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: MainPage(
                              title: "Nike sky blue & white Sneakers",
                              pitcureadress: "assets/Nike-white.png",
                              usdFiyat: 137,
                              percentageoff: 25,
                              rating: 4.0,
                              stock: 124,
                              oldprice: 171.25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 400),
                      child: Container(
                        height: 30,
                        width: 350,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Recommended for you",
                              style: TextStyle(
                                color: Color(0xFF1F2937),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0.11,
                                letterSpacing: 0.07,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "View All",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFF6B7280),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0.12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 350,
                width: 400,
                color: Colors.white,
                child: const Stack(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: MainPage(
                              title: "Allen Solly Regular fit cotton shirt",
                              pitcureadress: "assets/Allen-Solly.png",
                              usdFiyat: 75,
                              percentageoff: 20,
                              rating: 4.4,
                              stock: 412,
                              oldprice: 90,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: MainPage(
                              title: "Calvin Clein Regular fit slim fit shirt",
                              pitcureadress: "assets/Calvin-Clein.png",
                              usdFiyat: 75,
                              percentageoff: 20,
                              rating: 4.2,
                              stock: 214,
                              oldprice: 90,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: MainPage(
                              title: "H&M Half Regular fit cotton shirt",
                              pitcureadress: "assets/H&P.png",
                              usdFiyat: 75,
                              percentageoff: 20,
                              rating: 4.0,
                              stock: 254,
                              oldprice: 90,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          height: 120,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/home-2.png'),
                        onPressed: () {
                          // Handle home button press
                        },
                      ),
                      const Text(
                        "Home",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/element-3.png'),
                        onPressed: () {
                          // Handle search button press
                        },
                      ),
                      const Text("Categories"),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/clock.png'),
                        onPressed: () {
                          // Handle orders button press
                        },
                      ),
                      const Text("Orders"),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/profile-circle.png'),
                        onPressed: () {
                          // Handle profile button press
                        },
                      ),
                      const Text("Profile"),
                    ],
                  ),
                  // Add more IconButtons as needed
                ],
              ),
              const SizedBox(
                height: 20,
              ), // Adjust spacing between icons and the image
              Column(
                children: [
                  Image.asset(
                    'assets/line.png',
                  ),
                ],
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                //BoxDecoration
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  accountName: Text(
                    "Ali Demir",
                    style: TextStyle(fontSize: 18),
                  ),
                  accountEmail: Text("alidemir200258@gmail.com"),
                  currentAccountPictureSize: Size.square(50),
                  currentAccountPicture: Padding(
                    padding: EdgeInsets.only(bottom: 9.0),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 242, 254, 13),
                      child: Text(
                        "A",
                        style: TextStyle(fontSize: 30.0, color: Colors.white),
                      ), //Text
                    ),
                  ), //circleAvatar
                ), //UserAccountDrawerHeader
              ), //DrawerHeader
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text(' My Profile '),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.book),
                title: const Text(' My Course '),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.workspace_premium),
                title: const Text(' Go Premium '),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.video_label),
                title: const Text(' Saved Videos '),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text(' Edit Profile '),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
