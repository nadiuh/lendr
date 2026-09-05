import 'package:flutter/material.dart';
import 'borrow_details_screen.dart';


class SelectDurationScreen extends StatefulWidget {
  const SelectDurationScreen({super.key});

  @override
  State<SelectDurationScreen> createState() => _SelectDurationScreenState();
}

class _SelectDurationScreenState extends State<SelectDurationScreen> {
  // Currently selected duration tier index
  int _selectedIndex = 2; // Default selected: 8 - 14 Days

  final List<Map<String, dynamic>> _tiers = [
    {
      'label': '1 – 2 Days',
      'price': 800,
      'rangeText': 'Total ৳800 – ৳1,600',
      'isPopular': false,
    },
    {
      'label': '3 – 7 Days',
      'price': 650,
      'rangeText': 'Total ৳1,950 – ৳4,550',
      'isPopular': true,
    },
    {
      'label': '8 – 14 Days',
      'price': 550,
      'rangeText': 'Total ৳4,400 – ৳7,700',
      'isPopular': false,
    },
    {
      'label': '15 – 30 Days',
      'price': 450,
      'rangeText': 'Total ৳6,750 – ৳13,500',
      'isPopular': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF1E4620); // Dark green accent
    const backgroundColor = Color(0xFFF9F6EE); // Off-white/cream background

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Select Duration',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Summary Card
            Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Colors.grey.shade200),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/Product_images/DSLR.jpg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          alignment: const Alignment(0.0, 0.456),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Canon EOS 5D Mark IV DSLR',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              SizedBox(width: 4),
                              Text(
                                '4.9 ',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                              Text(
                                '(32 reviews)',
                                style: TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(Icons.person_outline, size: 16, color: Colors.grey.shade600),
                              const SizedBox(width: 4),
                              Text(
                                'by Rahat Ahmed',
                                style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
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
            const SizedBox(height: 20),

            // Duration Title & Subtitle
            const Text(
              'How long do you need it?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'Choose a duration to see the total charge.',
              style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 16),

            // Duration Option Radio Cards
            RadioGroup<int>(
              groupValue: _selectedIndex,
              onChanged: (val) {
                if (val != null) setState(() => _selectedIndex = val);
              },
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _tiers.length,
                itemBuilder: (context, index) {
                  final tier = _tiers[index];
                  final isSelected = _selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFFF1F6F2) : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected ? primaryColor : Colors.grey.shade300,
                          width: isSelected ? 1.5 : 1.0,
                        ),
                      ),
                      child: Row(
                        children: [
                          Radio<int>(
                            value: index,
                            activeColor: primaryColor,
                          ),
                          Text(
                            tier['label'],
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          if (tier['isPopular']) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Row(
                                children: [
                                  Text('Popular ', style: TextStyle(fontSize: 11)),
                                  Icon(Icons.star, size: 11, color: primaryColor),
                                ],
                              ),
                            ),
                          ],
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '৳${tier['price']} / day',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                tier['rangeText'],
                                style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Tip Banner
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFAF4EA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.access_time, color: primaryColor),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'The longer you keep it, the lower the daily price, but the total charge will increase with time.',
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Breakdown Card
            Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Colors.grey.shade200),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Date Selector Row
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Start Date', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                              const SizedBox(height: 4),
                              const Row(
                                children: [
                                  Icon(Icons.calendar_today_outlined, size: 16),
                                  SizedBox(width: 6),
                                  Text('20 May 2025', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_forward, color: Colors.grey),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('End Date', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                              const SizedBox(height: 4),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.calendar_today_outlined, size: 16),
                                  SizedBox(width: 6),
                                  Text('27 May 2025 (8 Days)', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),

                    // Pricing Details
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Daily Price', style: TextStyle(color: Colors.grey.shade700)),
                        Text('৳${_tiers[_selectedIndex]['price']}'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Duration', style: TextStyle(color: Colors.grey.shade700)),
                        const Text('8 Days'),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Dashed Divider simulation
                    Row(
                      children: List.generate(
                        30,
                            (index) => Expanded(
                          child: Container(
                            color: index % 2 == 0 ? Colors.transparent : Colors.grey.shade300,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Total Payable
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total Payable', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Text(
                          '৳${_tiers[_selectedIndex]['price'] * 8}',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: primaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Continue Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A6844),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BorrowDetailsScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Footer note
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.lock_outline, size: 14, color: Colors.grey),
                  SizedBox(width: 4),
                  Text('Secure & Safe Transaction', style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}