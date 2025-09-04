import 'package:flutter/material.dart';
import 'package:gen_app/theme/text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/google_accounts.dart';

class GoogleAccountDialog extends StatelessWidget {
  const GoogleAccountDialog({super.key});

  // Fungsi untuk menyimpan data user yang dipilih
  Future<void> _saveSelectedUser(String name, String? photo, String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedUserName', name);
    await prefs.setString('selectedUserEmail', email);
    if (photo != null) {
      await prefs.setString('selectedUserPhoto', photo);
    } else {
      await prefs.remove('selectedUserPhoto');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      insetPadding: const EdgeInsets.symmetric(horizontal: 26, vertical: 100),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/icons/google_icon.png', width: 32),
            const SizedBox(height: 12),
            Text(
              "Pilih Akun",
              style: AppTextStyles.textReguler.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              "Untuk melanjutkan ke Gen Parental Control",
              style: AppTextStyles.textReguler,
            ),
            const SizedBox(height: 14),
            ...googleAccounts.map(
              (acc) => ListTile(
                contentPadding: EdgeInsets.zero,
                leading: acc['photo'] != null
                    ? CircleAvatar(backgroundImage: AssetImage(acc['photo']!))
                    : CircleAvatar(
                        backgroundColor: Colors.deepPurple.shade50,
                        child: Text(
                          acc['initials']!,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                title: Text(acc['name']!, style: AppTextStyles.textReguler),
                subtitle: Text(
                  acc['email']!,
                  style: AppTextStyles.textEmail,
                ),
                onTap: () async {
                  // Simpan data user yang dipilih ke SharedPreferences
                  await _saveSelectedUser(
                    acc['name']!,
                    acc['photo'],
                    acc['email']!,
                  );
                  
                  // Navigate ke linked screen
                  Navigator.pushNamed(context, '/linked');
                },
              ),
            ),
            const Divider(height: 22),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.person_add_alt_1_outlined),
              title: const Text("Tambahkan akun lain"),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}