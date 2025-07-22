import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final isEmailFilled = emailController.text.isNotEmpty;
    final isPasswordFilled = passwordController.text.isNotEmpty;
    final isConfirmFilled = confirmPasswordController.text.isNotEmpty;

    final isFormValid =
        isEmailFilled &&
        isPasswordFilled &&
        isConfirmFilled &&
        passwordController.text == confirmPasswordController.text;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 8),

              // Title
              const Text(
                "Buat Akun",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text(
                "Sudah punya akun? Masuk",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 30),

              // Email Field
              TextField(
                controller: emailController,
                onChanged: (_) => setState(() {}),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Alamat E-mail",
                  suffixIcon: isEmailFilled
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            emailController.clear();
                            setState(() {});
                          },
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Password Field
              TextField(
                controller: passwordController,
                onChanged: (_) => setState(() {}),
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  labelText: "Kata Sandi",
                  suffixIcon: isPasswordFilled
                      ? IconButton(
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Confirm Password Field
              TextField(
                controller: confirmPasswordController,
                onChanged: (_) => setState(() {}),
                obscureText: !isConfirmPasswordVisible,
                decoration: InputDecoration(
                  labelText: "Konfirmasi Kata Sandi",
                  suffixIcon: isConfirmFilled
                      ? IconButton(
                          icon: Icon(
                            isConfirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              isConfirmPasswordVisible =
                                  !isConfirmPasswordVisible;
                            });
                          },
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Register Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: isFormValid
                      ? () {
                          // Handle register logic here
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isFormValid
                        ? Colors.blue
                        : Colors.blue.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("Daftar"),
                ),
              ),

              const SizedBox(height: 20),

              // Divider
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("atau"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),

              const SizedBox(height: 20),

              // Google Register Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Handle Google Sign Up
                  },
                  icon: Image.asset("assets/icons/google_icon.png", height: 24),
                  label: const Text("Google"),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Agreement
              const Text(
                "Dengan mendaftar, Anda menyetujui Persyaratan Layanan dan Kebijakan Privasi",
                style: TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
