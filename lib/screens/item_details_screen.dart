import 'package:flutter/material.dart';
import 'select_duration_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryThemeColor = Color(0xFF4A6844);

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4EE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F4EE),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF2D3B2D)),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        title: const Text(
          'Item Details',
          style: TextStyle(
            color: Color(0xFF2D3B2D),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Color(0xFF2D3B2D)),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Item Image Banner
                  // Item Image Banner
                  Container(
                    height: 280, // Increased height
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/Product_images/DSLR.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Main Content Section
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        const Text(
                          'Canon EOS 5D Mark IV DSLR',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E1E1E),
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Status Tag
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEBF4EB),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Excellent',
                            style: TextStyle(
                              color: Color(0xFF3B6E3B),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Price Details
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: const [
                            Text(
                              '৳1,500',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2D3B2D),
                              ),
                            ),
                            Text(
                              ' / day',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          '৳8,000 / week',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Divider(height: 1, color: Color(0xFFEEEEEE)),
                        ),

                        // Availability & Location
                        Row(
                          children: const [
                            Icon(Icons.check_circle, color: primaryThemeColor, size: 20),
                            SizedBox(width: 8),
                            Text(
                              'Available Now',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF1E1E1E),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: const [
                            Icon(Icons.location_on_outlined, color: Colors.grey, size: 20),
                            SizedBox(width: 8),
                            Text(
                              'Dhanmondi, Dhaka',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF666666),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Description
                        const Text(
                          'DESCRIPTION',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Professional mirrorless camera with 24.2MP sensor. Perfect for portraits and low-light photography. Includes 28-70mm lens.',
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.4,
                            color: Color(0xFF444444),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Lender Card
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F7F3),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 22,
                                backgroundImage: AssetImage(
                                  'assets/images/Product_images/pfp.jpg',
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Rahat Ahmed',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Color(0xFF1E1E1E),
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Row(
                                    children: const [
                                      Icon(Icons.check_circle, size: 12, color: Colors.grey),
                                      SizedBox(width: 4),
                                      Text(
                                        'Verified Lender',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: const Color(0xFFE0E0E0)),
                                ),
                                child: Row(
                                  children: const [
                                    Icon(Icons.star,color: Colors.amber, size: 16),
                                    SizedBox(width: 4),
                                    Text(
                                      '4.9',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Action Button Container
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryThemeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectDurationScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.calendar_today_outlined, color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Select Duration',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}