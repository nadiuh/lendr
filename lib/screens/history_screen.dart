import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          'Borrowing History',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Recent Transaction',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'lib/Images/Drill.jpeg',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: const Text('DeWalt Cordless Drill   ৳10500'),
              subtitle: const Text(
                'Lent by Leuna.\nOct 12, 2023 - Oct 15, 2023\n৳3500/day',
              ),
            ),
          ),

          Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'lib/Images/Tent.jpeg',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: const Text('4-Person Camping Tent   ৳7500'),
              subtitle: const Text(
                'Lent by Rahul.\nSep 22, 2023 - Sep 25, 2023\n৳2500',
              ),
            ),
          ),

          Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'lib/Images/Pressure_Washer.jpeg',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: const Text('Electrical Pressure Washer   ৳1500'),
              subtitle: const Text(
                'Lent by Rupai\nAug 14, 2023 (1 day)\n৳1500',
              ),
            ),
          ),
        ],
      ),
    );
  }
}