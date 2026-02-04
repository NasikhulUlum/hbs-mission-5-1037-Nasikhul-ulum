import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/routes/app_routes.dart';
import '../../widgets/user_pages/home_header.dart';
import '../../widgets/user_pages/search_bar.dart';
import '../../widgets/user_pages/section_title.dart';
import '../../widgets/user_pages/city_card.dart';
import '../../widgets/user_pages/curated_card.dart';
import '../../widgets/user_pages/plan_resume.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = "";
  String email = "";

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      userName = prefs.getString('name') ?? '';
      email = prefs.getString('email') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF7FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 12),

              /// HEADER (sudah pakai data user)
              HomeHeader(
                userName: userName.isEmpty ? "HBS" : userName,
              ),

              const SizedBox(height: 20),

              /// SEARCH
              const HomeSearchBar(),

              const SizedBox(height: 20),

              /// BANNER
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/hero.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withValues(alpha: 153),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Discover Your Destination",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.italic
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          ElevatedButton(
                            onPressed: () {
                              print("Book now clicked..");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFEAD9D3), // soft pink / beige
                              foregroundColor: Colors.black,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Book Now',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          const SizedBox(width: 16),

                          OutlinedButton(
                            onPressed: () {
                              print('Discover More clicked ..');
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: const BorderSide(
                                color: Colors.white,
                                width: 1.5,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Discover More',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ]
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              /// RESUME TRIP
              const SectionTitle(title: "Resume Your Plan Trip"),
              const SizedBox(height: 12),


              PlanResume(
                title: "Kyoto Exploration",
                image: 'assets/images/kyoto.png',
                progress: 0.50,
                onTap: () {
                  print("Kyoto card tapped");
                },
              ),

              const SizedBox(height: 24),

              /// TODAY TOP RATE
              const SectionTitle(title: "Today Top Rate"),
              const SizedBox(height: 12),

              SizedBox(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CityCard(
                      title: "Busan, South Korea",
                      image: 'assets/images/busan.png',
                    ),
                    CityCard(
                      title: "Bangkok, Thailand",
                      image: 'assets/images/bangkok.png',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// POPULAR
              const SectionTitle(title: "Popular", actionText: "Show all"),
              const SizedBox(height: 12),

              SizedBox(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CityCard(title: "Kyoto", image: 'assets/images/kyoto.png'),
                    CityCard(title: "Bali", image: 'assets/images/bali.jpg'),
                    CityCard(title: "New York", image: 'assets/images/newyork.jpg'),
                    CityCard(title: "London", image: 'assets/images/london.jpg'),
                    CityCard(title: "Busan", image: 'assets/images/busan.png'),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// CURATED
              const SectionTitle(title: "Curated Trip ⭐"),
              const SizedBox(height: 12),

              CuratedCard(
                title: "Dramatic limestone island",
                subtitle: "Halong Bay, Vietnam",
                imagePath: 'assets/images/halongbay.jpg',
                onTap: (title) {
                  print("Tapped: $title");
                  Navigator.pushNamed(context, AppRoutes.detail);
                },
              ),
              CuratedCard(
                title: "The Iconic White and Blue",
                subtitle: "Santorini, Greece",
                imagePath: 'assets/images/santorini.png',
                onTap: (title) {
                  print("Tapped: $title");
                  Navigator.pushNamed(context, AppRoutes.detail);
                },
              ),
              CuratedCard(
                title: "Iconic Urban Energy",
                subtitle: "New York, USA",
                imagePath: 'assets/images/usa.jpg',
                onTap: (title) {
                  print("Tapped: $title");
                  Navigator.pushNamed(context, AppRoutes.detail);
                },
              ),
              CuratedCard(
                title: "Nature, Culture and Beach",
                subtitle: "Bali, Indonesia",
                imagePath: 'assets/images/bali.jpg',
                onTap: (title) {
                  print("Tapped: $title");
                  Navigator.pushNamed(context, AppRoutes.detail);
                },
              ),
              CuratedCard(
                title: "Nature, Culture and Beach",
                subtitle: "Bali, Indonesia",
                imagePath: 'assets/images/bali.jpg',
                onTap: (title) {
                  print("Tapped: $title");
                  Navigator.pushNamed(context, AppRoutes.detail);
                },
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),

      /// BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
        ],
      ),
    );
  }
}
