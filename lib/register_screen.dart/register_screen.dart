import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/text_styles.dart';
import 'package:flutter/gestures.dart';
import '../splash_screen/widgets/dialog/google_account_dialog.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    final isPasswordFilled = passwordController.text.isNotEmpty;
    final isConfirmFilled = confirmPasswordController.text.isNotEmpty;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.arrow_back),
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/onboarding'),
              ),
              const Text(
                'Buat Akun',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              RichText(
                text: TextSpan(
                  text: 'Sudah punya akun? ',
                  style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(
                      text: 'Masuk',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Email Field
              TextField(
                controller: _emailController,
                onChanged: (_) => setState(() {}),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Alamat E-mail",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: AppColors.lightGrey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: AppColors.lightGrey),
                  ),
                  suffixIcon: _emailController.text.isNotEmpty
                      ? IconButton(
                          icon: Image.asset(
                            'assets/icons/clear_icon.png',
                            width: 16,
                            height: 16,
                          ),
                          onPressed: () {
                            setState(() {
                              _emailController.clear();
                            });
                          },
                        )
                      : null,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
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
                  hintText: "Kata Sandi",
                  suffixIcon: isPasswordFilled
                      ? IconButton(
                          icon: Image.asset(
                            isPasswordVisible
                                ? 'assets/icons/eyelashes_icon.png'
                                : 'assets/icons/eye_icon.png',
                            width: 18,
                            height: 18,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.lightGrey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: AppColors.lightGrey),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
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
                  hintText: "Konfirmasi Kata Sandi",
                  suffixIcon: isConfirmFilled
                      ? IconButton(
                          icon: Image.asset(
                            isConfirmPasswordVisible
                                ? 'assets/icons/eyelashes_icon.png'
                                : 'assets/icons/eye_icon.png',
                            width: 18,
                            height: 18,
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
                    borderSide: BorderSide(color: AppColors.lightGrey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: AppColors.lightGrey),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Register Button
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, offset: Offset(1, 1)),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Daftar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
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
              OutlinedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const GoogleAccountDialog(),
                  );
                },
                icon: Image.asset('assets/icons/google_icon.png', width: 20),
                label: const Text("Google", style: AppTextStyles.button),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AppColors.lightGrey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  minimumSize: const Size(double.infinity, 40),
                ),
              ),
              const SizedBox(height: 20),

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
