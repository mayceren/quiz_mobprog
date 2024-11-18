import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Screen'),
        backgroundColor: themeProvider.themeData.primaryColor, // Header berubah sesuai tema
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Ganti Tema',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),

            const Text(
              'Tema',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Dropdown untuk Tema
            DropdownButton<int>(
              value: themeProvider.currentThemeIndex,
              onChanged: (int? index) {
                if (index != null) {
                  themeProvider.setTheme(index);
                }
              },
              items: List.generate(
                themes.length,
                (index) => DropdownMenuItem(
                  value: index,
                  child: Text('Theme ${index + 1}'),
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Font',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Dropdown untuk Font
            DropdownButton<int>(
              value: themeProvider.currentFontIndex,
              onChanged: (int? index) {
                if (index != null) {
                  themeProvider.setFont(index);
                }
              },
              items: List.generate(
                fonts.length,
                (index) => DropdownMenuItem(
                  value: index,
                  child: Text(fonts[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
