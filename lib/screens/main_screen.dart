import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/screens/settings_screen.dart';
import 'package:quiz/theme_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
        backgroundColor: themeProvider.themeData.primaryColor, // Header berubah sesuai tema
      ),
      body: Container(
        decoration: BoxDecoration(
          color: themeProvider.themeData.scaffoldBackgroundColor, // Latar belakang berubah sesuai tema
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                'Selamat Datang',
                style: TextStyle(
                  fontSize: 20,
                  color: themeProvider.themeData.primaryColorDark, // Gunakan warna teks dari tema
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingsScreen()),
                  );
                },
                child: const Text('Ganti Tema'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}