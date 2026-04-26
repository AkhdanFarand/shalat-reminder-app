import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String selected = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F4F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Language",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          tile("English"),
          tile("Bahasa Indonesia"),
        ],
      ),
    );
  }

  Widget tile(String text) {
    final active = selected == text;

    return InkWell(
      onTap: () {
        setState(() {
          selected = text;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: active
              ? const Color(0xffF0FDF4)
              : Colors.white,
          border: const Border(
            bottom: BorderSide(
              color: Color(0xffE5E7EB),
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(
              active
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: active
                  ? const Color(0xff16A34A)
                  : Colors.grey,
            ),
            const SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(
                color: active
                    ? const Color(0xff16A34A)
                    : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}