import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _distanceController = TextEditingController();
  String errorMessage = '';

  void addItem() async {
    if (_nameController.text.trim().isEmpty) {
      setState(() {
        errorMessage = 'Please enter item name';
      });
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('items').add({
        'name': _nameController.text.trim(),
        'price': _priceController.text.trim().isEmpty
            ? '৳1000/day'
            : _priceController.text.trim(),
        'distance': _distanceController.text.trim().isEmpty
            ? '1.0 km away'
            : _distanceController.text.trim(),
        'createdAt': DateTime.now().toIso8601String(),
      });

      if (!mounted) return;
      Navigator.pop(context);
    } on FirebaseException catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = e.message ?? 'Could not add item';
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = 'Could not add item';
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _distanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: const Text(
          'Add New Item',
          style: TextStyle(
            color: AppColors.primaryDark,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Item Name',
                filled: true,
                fillColor: AppColors.inputBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 14),

            TextField(
              controller: _priceController,
              decoration: InputDecoration(
                labelText: 'Price (e.g. ৳2000/day)',
                filled: true,
                fillColor: AppColors.inputBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 14),

            TextField(
              controller: _distanceController,
              decoration: InputDecoration(
                labelText: 'Distance (e.g. 1.5 km away)',
                filled: true,
                fillColor: AppColors.inputBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            Text(
              errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: addItem,
                child: const Text(
                  'Add Item',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
