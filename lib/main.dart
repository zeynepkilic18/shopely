import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:async'; // For Timer

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  late Timer _timer;
  Duration _duration = const Duration(hours: 1); // Set the countdown duration

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_duration.inSeconds <= 0) {
        timer.cancel();
      } else {
        setState(() {
          _duration = _duration - const Duration(seconds: 1);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  String get _formattedTime {
    final minutes =
        _duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds =
        _duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 235, 163, 187),
        title: const Text("Home"),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset('lib/assets/icon1.png'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search Anything...",
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide(color: Color(0xFFD1D5DB), width: 1),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0.11,
                        letterSpacing: 0.07,
                        shadows: [
                          Shadow(
                            offset: const Offset(3.0, 3.0),
                            blurRadius: 1.0,
                            color: Colors.grey.withOpacity(0.5),
                          )
                        ]),
                  ),
                  const Spacer(),
                  const Text(
                    'View All ->',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0.12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(4, (index) {
                  final List<String> texts = [
                    'Fashion',
                    'Electronics',
                    'Appliances',
                    'Beauty'
                  ];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'lib/assets/group${index + 1}.png',
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(
                          height: 8,
                          width: 100,
                        ),
                        Text(texts[index]),
                      ],
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 200, // Adjust the height as needed
              child: PageView(
                controller: _pageController,
                children: [
                  Image.asset(
                    'lib/assets/Banner.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'lib/assets/Banner.png',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SmoothPageIndicator(
              controller: _pageController,
              count: 2,
              effect: const WormEffect(
                activeDotColor: Colors.blue,
                dotColor: Colors.grey,
                dotHeight: 8,
                dotWidth: 8,
                spacing: 16,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'Deal of the Day',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Hurry up! Limited time offer.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      _formattedTime,
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFFD1D5DB),
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Zeynep Kılıç"),
              accountEmail: Text("18zeynepklc@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('lib/assets/your_avatar.png'),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 235, 163, 187),
              ),
            ),
            ..._buildDrawerItems(context),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildDrawerItems(BuildContext context) {
    final drawerItems = [
      {'icon': Icons.border_all, 'title': 'Shop by Categories'},
      {'icon': Icons.access_time, 'title': 'My Orders'},
      {'icon': Icons.favorite, 'title': 'Favourites'},
      {'icon': Icons.live_help, 'title': 'FAQs'},
      {'icon': Icons.location_on, 'title': 'Addresses'},
      {'icon': Icons.credit_card, 'title': 'Saved Cards'},
      {'icon': Icons.description, 'title': 'Terms & Conditions'},
      {'icon': Icons.beenhere, 'title': 'Privacy Policy'},
      {'icon': Icons.logout, 'title': 'Logout'},
    ];

    return drawerItems.map((item) {
      return ListTile(
        leading: Icon(item['icon'] as IconData),
        title: Text(item['title'] as String),
        onTap: () {
          Navigator.pop(context); // Close the drawer
        },
      );
    }).toList();
  }
}
