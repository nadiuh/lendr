import 'package:flutter/material.dart';
import '../utils/validators.dart';
import 'login_screen.dart';
import 'terms_conditions_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void createAccount() {
    if (formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TermsConditionsScreen(
            isAgreementFlow: true,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F0E6),

      body: Padding(
        padding: EdgeInsets.all(25),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              "Create Your Account",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5F735B),
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Sign up to get started",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 30),

            Container(
              padding: EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),

              child: Form(
                key: formKey,

                child: Column(
                  children: [
                    TextFormField(
                      controller: fullNameController,

                      decoration: InputDecoration(
                        labelText: "Full Name",
                        border: OutlineInputBorder(),
                      ),

                      validator: Validators.validateFullName,
                    ),

                    SizedBox(height: 20),

                    TextFormField(
                      controller: emailController,

                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),

                      validator: Validators.validateEmail,
                    ),

                    SizedBox(height: 20),

                    TextFormField(
                      controller: passwordController,

                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                      ),

                      validator: (value) {
                        return Validators.validatePassword(
                          value,
                          isCreate: true,
                        );
                      },
                    ),

                    SizedBox(height: 20),

                    TextFormField(
                      controller: confirmPasswordController,

                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        border: OutlineInputBorder(),
                      ),

                      validator: (value) {
                        return Validators.validateConfirmPassword(
                          value,
                          passwordController.text,
                        );
                      },
                    ),

                    SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,

                      child: ElevatedButton(
                        onPressed: createAccount,

                        child: Text("Create Account"),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text("Already have an account?"),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },

                  child: Text("Log In"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
