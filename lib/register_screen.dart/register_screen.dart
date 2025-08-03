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

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;

  bool get isEmailValid =>
      RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(_emailController.text);

  bool get isPasswordValid =>
      passwordController.text.length >= 8 &&
      RegExp(r'\d').hasMatch(passwordController.text);

  bool get isConfirmPasswordValid =>
      confirmPasswordController.text == passwordController.text;

  bool get isFormValid =>
      isEmailValid &&
      isPasswordValid &&
      isConfirmPasswordValid &&
      _emailController.text.isNotEmpty &&
      passwordController.text.isNotEmpty &&
      confirmPasswordController.text.isNotEmpty;

  void _validateForm() {
    setState(() {
      _emailError =
          _emailController.text.isEmpty || isEmailValid ? null : "Format email tidak valid";

      _passwordError = passwordController.text.isEmpty
          ? null
          : (!isPasswordValid
              ? "Minimal 8 karakter & mengandung angka"
              : null);

      _confirmPasswordError = confirmPasswordController.text.isEmpty
          ? null
          : (!isConfirmPasswordValid ? "Kata sandi tidak cocok" : null);
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
    confirmPasswordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    Navigator.pushReplacementNamed(context, '/login'),
              ),
              const Text('Buat Akun', style: AppTextStyles.titleLogres),
              const SizedBox(height: 4),
              RichText(
                text: TextSpan(
                  text: 'Sudah punya akun? ',
                  style: AppTextStyles.terms,
                  children: [
                    TextSpan(
                      text: 'Masuk',
                      style: AppTextStyles.terms.copyWith(
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

              const Text("Alamat E-mail", style: AppTextStyles.textReguler),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Masukkan alamat email",
                  hintStyle: AppTextStyles.textPlaceholder,
                  errorText: _emailError,
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

              const SizedBox(height: 12),
              const Text("Kata Sandi", style: AppTextStyles.textReguler),
              TextField(
                controller: passwordController,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  hintText: "Masukkan Kata Sandi",
                  hintStyle: AppTextStyles.textPlaceholder,
                  errorText: _passwordError,
                  suffixIcon: passwordController.text.isNotEmpty
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

              const SizedBox(height: 12),
              const Text("Konfirmasi Kata Sandi", style: AppTextStyles.textReguler),
              TextField(
                controller: confirmPasswordController,
                obscureText: !isConfirmPasswordVisible,
                decoration: InputDecoration(
                  hintText: "Konfirmasi Kata Sandi",
                  hintStyle: AppTextStyles.textPlaceholder,
                  errorText: _confirmPasswordError,
                  suffixIcon: confirmPasswordController.text.isNotEmpty
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
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: isFormValid
                      ? () {
                          // TODO: Handle register logic
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Pendaftaran berhasil!"),
                            ),
                          );
                          Navigator.pushReplacementNamed(context, '/step_intro');
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    elevation: 2,
                    shadowColor: Colors.black12,
                  ),
                  child: Text(
                    'Daftar',
                    style: AppTextStyles.textReguler.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("atau"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 10),

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
              Text.rich(
                TextSpan(
                  text: "Dengan mendaftar, Anda menyetujui ",
                  style: AppTextStyles.terms,
                  children: [
                    TextSpan(
                      text: "Persyaratan Layanan dan Kebijakan Privasi",
                      style: AppTextStyles.terms.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
