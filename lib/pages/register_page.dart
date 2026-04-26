import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F5F7),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(28),
            child: Column(
              children: [

                const SizedBox(height: 20),

                Container(
                  width: 82,
                  height: 82,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 12,
                      )
                    ],
                  ),
                  child: const Icon(
                    Icons.mosque,
                    color: Color(0xff16A34A),
                    size: 38,
                  ),
                ),

                const SizedBox(height: 26),

                const Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  "Sign up to get started",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 34),

                field(Icons.person_outline, "Full Name"),
                const SizedBox(height: 16),
                field(Icons.email_outlined, "Email"),
                const SizedBox(height: 16),
                field(Icons.lock_outline, "Password"),
                const SizedBox(height: 16),
                field(Icons.lock_outline, "Confirm Password"),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff16A34A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Color(0xff16A34A),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget field(IconData icon, String hint) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}