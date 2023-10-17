import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miniproject/components/bottom_bar.dart';
import 'package:miniproject/components/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _formkey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwdController = TextEditingController();
  final _unameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // Gunakan SingleChildScrollView
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Login Account",
                  style: DesignSystem.headlineLarge,
                ),
                const Text(
                  "Begin your health journey today with SlimSage",
                  style: DesignSystem.bodyMedium,
                ),
                const SizedBox(height: 30),
                Center(
                  child: SizedBox(
                    height: 60,
                    width: 200,
                    child: SvgPicture.asset(
                      "assets/images/icons/app_logo.svg",
                      color: DesignSystem.mainGreen,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _unameController,
                        decoration: InputDecoration(
                          labelText: "Enter username",
                          labelStyle: DesignSystem.labelLarge,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: "Enter email",
                          labelStyle: DesignSystem.labelLarge,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _passwdController,
                        decoration: InputDecoration(
                          labelText: "Enter password",
                          labelStyle: DesignSystem.labelLarge,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          child: const Text(
                            "Login",
                            style: DesignSystem.headlineMediumWhite,
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BottomBar()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: DesignSystem.mainGreen),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 2.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Or login with",
                              style: DesignSystem.bodySmall,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 2.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        width: 80,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: DesignSystem.white),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                                "assets/images/icons/logo_google.svg"),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        width: 80,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: DesignSystem.white),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                                "assets/images/icons/logo_facebook.svg"),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        width: 80,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: DesignSystem.white),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                                "assets/images/icons/logo_apple.svg"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Center(
                  child: Text(
                    "The first step towards a healthier life.",
                    style: DesignSystem.bodyMedium,
                  ),
                ),
                const SizedBox(height: 40),
                const SafeArea(
                  child: Center(
                    child: Text(
                      "Slimsage © 2023",
                      style: DesignSystem.bodySmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
