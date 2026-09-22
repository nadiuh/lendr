import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  String errorMessage='';
  String message='';

  void sendMessage() {
    if (nameController.text.isEmpty) {
      setState(() {
        errorMessage='Please enter your name';
      });
      return;
    }

    if (emailController.text.isEmpty ||
        !emailController.text.contains('@')) {
      setState(() {
        errorMessage='Please enter a valid email';
      });
      return;
    }

    if (messageController.text.isEmpty) {
      setState(() {
        errorMessage='Please write your message';
      });
      return;
    }

    setState(() {
      message='Message sent successfully';
    });

    nameController.clear();
    emailController.clear();
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Contact Us'),
        centerTitle: true,
        backgroundColor: AppColors.background,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.white,
                      size: 28,
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Get in Touch',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Have a question or need help?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.border,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.email_outlined),
                          SizedBox(height: 8),
                          Text(
                            'Email Us',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'support@lendr.app',
                            style: TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 12),

                  Expanded(
                    child: Container(
                      padding:EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.border,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.phone_outlined),
                          SizedBox(height: 8),
                          Text(
                            'Call Us',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '+880 1700-000000',
                            style: TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25),

              Text(
                'Send us a message',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 15),

              Container(
                padding:EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: AppColors.border,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('Your Name'),
                    SizedBox(height: 6),

                    TextField(
                      controller: nameController,
                      decoration:InputDecoration(
                        hintText: 'Enter your full name',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    SizedBox(height: 15),

                    Text('Email Address'),
                    SizedBox(height: 6),

                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration:InputDecoration(
                        hintText: 'Enter your email address',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    SizedBox(height: 15),

                    Text('Message'),
                    SizedBox(height: 6),

                    TextField(
                      controller: messageController,
                      maxLines: 4,
                      decoration:InputDecoration(
                        hintText: 'How can we help you?',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    Text(
                      errorMessage,
                      style:TextStyle(color: Colors.red),
                    ),
                    Text(
                      message,
                      style:TextStyle(color: Colors.green),
                    ),
                    SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: sendMessage,
                        child: Text('Send Message'),
                      ),
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
