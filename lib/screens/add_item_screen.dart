import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  File? _selectedImage;

  void pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _selectedImage = File(picked.path);
      });
    }
  }

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

      Navigator.pop(context);
    } on FirebaseException catch (e) {
      setState(() {
        errorMessage = e.message ?? 'Could not add item';
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: pickImage,
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.inputBackground,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: _selectedImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          _selectedImage!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      )
                    : const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_a_photo, size: 40, color: AppColors.primary),
                          SizedBox(height: 8),
                          Text('Tap to add photo'),
                        ],
                      ),
              ),
            ),

            const SizedBox(height: 14),

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
