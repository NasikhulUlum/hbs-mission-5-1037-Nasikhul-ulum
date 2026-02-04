import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';
import '../widgets/logo_center.dart';
import '../widgets/password_field.dart';

import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _formKey = GlobalKey<FormState>();

  final nameC = TextEditingController();
  final emailC = TextEditingController();
  final phoneC = TextEditingController();
  final passC = TextEditingController();
  final confirmPassC = TextEditingController();

  String gender = "Pria";

  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  Future<void> saveRegister() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('name', nameC.text);
    await prefs.setString('email', emailC.text);
    await prefs.setString('gender', gender);
    await prefs.setString('phone', phoneC.text);
    await prefs.setString('password', passC.text);

    print("REGISTER DATA SAVED TO LOCAL STORAGE");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Register data saved in local storage..'),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pushReplacementNamed(context, AppRoutes.auth);
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

              const SizedBox(height: 20),

              /// LOGO
              const LogoCenter(),

              const SizedBox(height: 20),

              /// CARD
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  
                      const Center(
                        child: Text(
                          "Account register",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  
                      const SizedBox(height: 20),
                  
                      label("Full Name"),
                      formField(
                        hint: "Full Name",
                        controller: nameC,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name wajib diisi";
                          }
                          return null;
                        },
                      ),
                  
                      const SizedBox(height: 14),
                  
                      label("Email"),
                      formField(
                        hint: "Email",
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
                      ),
                  
                      const SizedBox(height: 14),
                  
                      label("Jenis Kelamin"),
                      dropdown(),
                  
                      const SizedBox(height: 14),
                  
                      label("No. Hp"),
                      formField(
                        hint: "Phone Number",
                        controller: phoneC,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nomor HP wajib diisi";
                          }
                          if (value.length < 9) {
                            return "Nomor HP tidak valid";
                          }
                          return null;
                        },
                      ),
                  
                      const SizedBox(height: 14),
                  
                      label("Kata Sandi"),
                      PasswordField(
                        controller: passC,
                        isHidden: isPasswordHidden,
                        onToggle: () {
                          setState(() {
                            isPasswordHidden = !isPasswordHidden;
                          });
                        },
                      ),
                  
                      const SizedBox(height: 14),
                  
                      label("Konfirmasi Kata Sandi"),
                      PasswordField(
                        controller: confirmPassC,
                        isHidden: isConfirmPasswordHidden,
                        onToggle: () {
                          setState(() {
                            isConfirmPasswordHidden =
                            !isConfirmPasswordHidden;
                          });
                        },
                      ),
                  
                      const SizedBox(height: 20),
                  
                      /// REGISTER BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              saveRegister();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigoAccent,
                            foregroundColor: Colors.white,
                            textStyle: TextStyle(fontWeight: FontWeight.bold),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text("Register"),
                        ),
                      ),
                  
                      const SizedBox(height: 20),
                  
                      /// LOGIN BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.auth);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[200],
                            foregroundColor: Colors.black,
                            textStyle: TextStyle(fontWeight: FontWeight.bold),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text("Login"),
                        ),
                      ),
                  
                      const SizedBox(height: 20),
                  
                      /// OR DIVIDER
                      Row(
                        children: const [
                          Expanded(child: Divider(color: Colors.white)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text("Or",
                                style: TextStyle(color: Colors.white)),
                          ),
                          Expanded(child: Divider(color: Colors.white)),
                        ],
                      ),
                  
                      const SizedBox(height: 20),
                  
                      /// GOOGLE BUTTON
                      GestureDetector(
                        onTap: () {
                          print("Login with Google tapped");
                        },
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/google.png',
                                width: 22,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "Login with Google",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                  
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  /// HELPERS
  Widget label(String text) =>
      Text("$text *", style: const TextStyle(color: Colors.white));

  // Widget field(String hint, TextEditingController c) {
  //   return TextField(
  //     controller: c,
  //     decoration: InputDecoration(
  //       hintText: hint,
  //       filled: true,
  //       fillColor: Colors.white,
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(8),
  //         borderSide: BorderSide.none,
  //       ),
  //     ),
  //   );
  // }

  Widget formField({
    required String hint,
    required TextEditingController controller,
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        errorStyle: const TextStyle(
          fontSize: 14,
          height: 2,
          color: Colors.redAccent,
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget dropdown() {
    return DropdownButtonFormField<String>(
      initialValue: gender,
      items: ["Pria", "Wanita"]
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (v) => setState(() => gender = v!),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
