import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants/app_colors.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String errorMessage = '';

  void changePassword() async {
    if (currentPasswordController.text.isEmpty) {
      setState(() {
        errorMessage = 'Please enter your current password';
      });
      return;
    }

    if (newPasswordController.text.isEmpty) {
      setState(() {
        errorMessage = 'Please enter a new password';
      });
      return;
    }

    if (confirmPasswordController.text.isEmpty) {
      setState(() {
        errorMessage = 'Please confirm your new password';
      });
      return;
    }

    if (newPasswordController.text != confirmPasswordController.text) {
      setState(() {
        errorMessage = 'Passwords do not match';
      });
      return;
    }

    try {
      await FirebaseAuth.instance.currentUser!.updatePassword(
        newPasswordController.text,
      );

      setState(() {
        errorMessage = 'Password changed successfully!';
      });
    } on FirebaseAuthException catch (e) {
        setState(() {
          errorMessage = e.message ?? 'Something went wrong';
        });
    }
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: Text('Change Password'),
        centerTitle: true,
        backgroundColor: AppColors.background,
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Current Password'),
            SizedBox(height: 8),

            TextField(
              controller: currentPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            Text('New Password'),
            SizedBox(height: 8),

            TextField(
              controller: newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            Text('Confirm New Password'),
            SizedBox(height: 8),

            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            Text(
              errorMessage,
              style:TextStyle(color: Colors.red),
            ),

            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: changePassword,
                child: Text('Change Password'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
