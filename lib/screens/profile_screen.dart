import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'change_password_screen.dart';
import 'contact_us_screen.dart';
import 'help_center_screen.dart';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String errorMessage = "";

  bool notifications = true;
  bool darkMode = false;

  void logout() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Log Out"),
          content: Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),

            ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);

                try {
                  await FirebaseAuth.instance.signOut();

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false,
                  );
                } on FirebaseAuthException catch (e) {
                  setState(() {
                    errorMessage = e.message ?? 'Could not log out';
                  });
                }
              },
              child: Text("Log Out"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email ?? "user@gmail.com";
    final username = "@${email.split('@')[0]}";
    final fullName = user?.displayName ?? email.split('@')[0];

    return SingleChildScrollView(
      padding: EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'assets/images/Profile_screen/pfp_icon.png',
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  fullName,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                Text(username),
                Text(email),
              ],
            ),
          ),

          SizedBox(height: 30),

          Text(
            "Profile Information",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 10),

          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text("Full Name"),
                Text(fullName, style: TextStyle(fontWeight: FontWeight.bold)),

                SizedBox(height: 15),

                Text("Username"),
                Text(username, style: TextStyle(fontWeight: FontWeight.bold)),

                SizedBox(height: 15),

                Text("Email"),
                Text(email, style: TextStyle(fontWeight: FontWeight.bold)),

                SizedBox(height: 15),

                Text("Phone"),
                Text(
                  "+880 12 3456 7890",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 15),

                Text("Location"),
                Text(
                  "Dhaka, Bangladesh",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 15),

                Text("Date Joined"),
                Text(
                  "August 2026",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          SizedBox(height: 30),

          Text(
            "Account Settings",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 10),

          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),

            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangePasswordScreen(),
                      ),
                    );
                  },
                  child: Text("Change Password"),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Notifications"),

                    Switch(
                      value: notifications,
                      onChanged: (value) {
                        setState(() {
                          notifications = value;
                        });
                      },
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Dark Mode"),

                    Switch(
                      value: darkMode,
                      onChanged: (value) {
                        setState(() {
                          darkMode = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 30),

          Text(
            "Support",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 10),

          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),

            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HelpCenterScreen(),
                      ),
                    );
                  },
                  child: Text("Help Center"),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactUsScreen(),
                      ),
                    );
                  },
                  child: Text("Contact Us"),
                ),
              ],
            ),
          ),

          SizedBox(height: 30),

          Text(errorMessage, style: TextStyle(color: Colors.red)),

          SizedBox(height: 10),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: logout, child: Text("Log Out")),
          ),
        ],
      ),
    );
  }
}
