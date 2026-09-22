import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Save screen visit to Firebase Firestore
    FirebaseFirestore.instance.collection('screen_visits').add({
      'screen': 'history',
      'visitedAt': DateTime.now().toIso8601String(),
    });

    return ListView(
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
    );
  }
}