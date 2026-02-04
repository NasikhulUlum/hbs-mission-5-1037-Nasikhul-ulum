import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../../../core/routes/app_routes.dart';
import '../widgets/logo_center.dart';
import '../widgets/social_button.dart';

import 'package:shared_preferences/shared_preferences.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();

  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  bool isPasswordHidden = true;

  Future<void> debugPrintAllLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();

    final keys = prefs.getKeys();

    if (keys.isEmpty) {
      print("❌ Local Storage KOSONG");
      return;
    }

    print("✅ DATA DI LOCAL STORAGE:");
    for (var key in keys) {
      print("$key : ${prefs.get(key)}");
    }
  }


  Future<void> login() async {
    final prefs = await SharedPreferences.getInstance();

    /// 🔍 DEBUG: cek semua data
    await debugPrintAllLocalStorage();

    final savedEmail = prefs.getString('email');
    final savedPassword = prefs.getString('password');

    if (savedEmail == null || savedPassword == null) {
      showError("Belum ada akun terdaftar");
      return;
    }

    if (emailC.text == savedEmail && passwordC.text == savedPassword) {
      showSuccess("Login berhasil");

      Navigator.pushReplacementNamed(context, AppRoutes.home);
    } else {
      showError("Email atau password salah");
    }
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  void showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }



  void submitLogin() {
    if (_formKey.currentState!.validate()) {
      // print("EMAIL: ${emailC.text}");
      // print("PASSWORD: ${passwordC.text}");
      login();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB7CED6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [

              const SizedBox(height: 30),

              /// LOGO
              const LogoCenter(),

              const SizedBox(height: 20),

              /// TITLE
              const Text(
                "Didn't have account ?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.register);
                },
                child: const Text(
                  "Create one here!",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              /// FORM LOGIN
              Form(
                key: _formKey,
                child: Column(
                  children: [

                    /// EMAIL
                    TextFormField(
                      controller: emailC,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email wajib diisi";
                        }
                        if (!value.contains('@')) {
                          return "Format email tidak valid";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "email@domain.com",
                        filled: true,
                        fillColor: Colors.white70,
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16),
                        errorStyle: const TextStyle(
                          fontSize: 14,
                          height: 2,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    /// PASSWORD
                    TextFormField(
                      controller: passwordC,
                      obscureText: isPasswordHidden,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password wajib diisi";
                        }
                        if (value.length < 6) {
                          return "Password minimal 6 karakter";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                        filled: true,
                        fillColor: Colors.white70,
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16),
                        errorStyle: const TextStyle(
                          fontSize: 14,
                          height: 2,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordHidden
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordHidden = !isPasswordHidden;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    /// LOGIN BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: submitLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// DIVIDER OR
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("or"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),

              const SizedBox(height: 25),

              SocialButton(
                icon: 'assets/images/google.png',
                text: "Continue with Google",
                onTap: () {
                  print("Google login");
                },
              ),

              const SizedBox(height: 12),

              SocialButton(
                icon: 'assets/images/apple.png',
                text: "Continue with Apple",
                onTap: () {
                  print("Apple login");
                },
              ),

              const SizedBox(height: 40),

              /// TERMS
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text.rich(
                  TextSpan(
                    text: "By clicking continue, you agree to our ",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                    children: [
                      TextSpan(
                        text: "Terms of Service",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("Terms clicked");
                          },
                      ),
                      const TextSpan(text: "\nand "),
                      TextSpan(
                        text: "Privacy Policy",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("Privacy clicked");
                          },
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
