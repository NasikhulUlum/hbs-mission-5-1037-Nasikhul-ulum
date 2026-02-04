import 'package:flutter/material.dart';
import 'package:hsb_mission_5/features/onboarding/widgets/logo_center.dart';
import '../../widgets/user_pages/info_chip.dart';
import '../../widgets/user_pages/hotel_card.dart';

class DestinationDetailPage extends StatelessWidget {
  const DestinationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF7FB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// HERO IMAGE
              Stack(
                children: [
                  Image.asset(
                    'assets/images/paviliun.jpg',
                    height: 280,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ],
              ),

              /// CONTENT
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// TITLE
                    const Text(
                      "Golden Pavillion",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    /// INFO ROW
                    Row(
                      children: const [
                        InfoChip(
                          icon: Icons.location_on,
                          text: "Kyoto, Japan",
                        ),
                        SizedBox(width: 10),
                        InfoChip(
                          icon: Icons.person,
                          text: "65,034",
                        ),
                        SizedBox(width: 10),
                        InfoChip(
                          icon: Icons.star,
                          text: "4.5/10",
                          color: Colors.orange,
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// DETAIL
                    const Text(
                      "Detail",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Embark on a tranquil journey to Japan’s iconic Kinkaku-ji Temple, also known as the Golden Pavilion. Set against the serene backdrop of Kyoto’s lush gardens and calm ponds, this Zen Buddhist temple radiates golden beauty and deep historical and spiritual significance. Wander along peaceful pathways while admiring the harmonious blend of nature and architecture, intricate details, and the temple’s timeless cultural charm.",
                      style: TextStyle(
                        color: Colors.black54,
                        height: 1.4,
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// PRICE + CTA
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Trip Price",
                              style: TextStyle(color: Colors.black54),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "¥500",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {
                              print("lets go clicked..");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text("Let's go", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    /// HOTEL SECTION
                    const Text(
                      "Hotel nearest Golden Pavillion",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 12),

                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          HotelCard(
                            image: 'assets/images/urban.jpg',
                            title: 'Urban Hotel Kyoto Nijo Premium',
                            rating: 4.1,
                            price: '¥7,500',
                            onTap: () {
                              print("Hotel tapped");
                            },
                          ),
                          const SizedBox(width: 12),
                          HotelCard(
                            image: 'assets/images/roku.jpg',
                            title: 'RokuKyoto by Hilton',
                            rating: 4.5,
                            price: '¥131,000',
                          ),
                        ],
                      ),
                    ),


                    const SizedBox(height: 15),

                    /// FOOTER
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/logo_mini.png',
                          width: 140,
                        ),
                        Text(
                          "Enjoy your trip with glorious serve \nfrom harijumat.co! ",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Jl Raya Pajajaran No.86, Bogor Tengah, Bogor, Jawa Barat 16127",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 12),
                        Text("+62-89127-323", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Perusahaan", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                            IconButton(
                              icon: const Icon(Icons.arrow_forward),
                              onPressed: () {
                                print("perusahaan clicked..");
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Komunitas", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                            IconButton(
                              icon: const Icon(Icons.arrow_forward),
                              onPressed: () {
                                print("komunitas clicked..");
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 54,
                              height: 54,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/Linkedin.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              width: 54,
                              height: 54,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/Instagram.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              width: 54,
                              height: 54,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/Twitter.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              width: 54,
                              height: 54,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/Facebook.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Text(
                          "@2026 Kwetiau Siram All Rights Reserved",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
