import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    // Default value for Dropdowns
    int selectedThemeIndex = themeProvider.currentThemeIndex;
    int selectedFontIndex = themeProvider.currentFontIndex;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Screen'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.blueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const Center(
                child: Text(
                  'Ganti Tema & Font',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Dropdown for Themes
              const Text(
                'Pilih Tema',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<int>(
                value: selectedThemeIndex,
                items: List.generate(themes.length, (index) {
                  return DropdownMenuItem<int>(
                    value: index,
                    child: Text('Theme ${index + 1}'),
                  );
                }),
                onChanged: (value) {
                  if (value != null) {
                    themeProvider.setTheme(value);
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Dropdown for Fonts
              const Text(
                'Pilih Font',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<int>(
                value: selectedFontIndex,
                items: List.generate(fonts.length, (index) {
                  return DropdownMenuItem<int>(
                    value: index,
                    child: Text(fonts[index]),
                  );
                }),
                onChanged: (value) {
                  if (value != null) {
                    themeProvider.setFont(value);
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
