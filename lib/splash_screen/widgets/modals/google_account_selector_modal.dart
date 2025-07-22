import 'package:flutter/material.dart';

class GoogleAccountSelectorModal extends StatelessWidget {
  const GoogleAccountSelectorModal({super.key});

  @override
  Widget build(BuildContext context) {
    final accounts = [
      {
        'initials': 'PS',
        'name': 'Prabowo Subianto',
        'email': 'prabowo@gmail.com',
      },
      {
        'initials': 'GR',
        'name': 'Gibran Rakabuming',
        'email': 'fufufafa@gmail.com',
      },
      {'initials': 'TA', 'name': 'Tiara Andini', 'email': 'tiaraa@gmail.com'},
      {'initials': 'BE', 'name': 'Billie Ellish', 'email': 'billie@gmail.com'},
    ];

    return DraggableScrollableSheet(
      initialChildSize: 0.45,
      maxChildSize: 0.7,
      minChildSize: 0.3,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.all(20),
          child: ListView(
            controller: scrollController,
            children: [
              Column(
                children: [
                  Image.asset('assets/icons/google_icon.png', width: 30),
                  const SizedBox(height: 8),
                  const Text(
                    "Pilih Akun",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Untuk melanjutkan ke Gen Parental Control",
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ...accounts.map(
                (acc) => ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepPurple.shade50,
                    child: Text(
                      acc['initials']!,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  title: Text(acc['name']!),
                  subtitle: Text(acc['email']!),
                  onTap: () {
                    // handle login simulation here
                    Navigator.pop(context);
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person_add_alt_1_outlined),
                title: const Text("Tambahkan akun lain"),
                onTap: () {
                  // Tambahkan akun baru
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
