import 'package:flutter/material.dart';
import 'register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F5F7),

      body: SafeArea(
        child: Stack(
          children: [

            /// BACK BUTTON
            Positioned(
              top: 8,
              left: 8,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: 22,
                ),
              ),
            ),

            /// CONTENT
            Center(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.all(28),
                child: Column(
                  children: [

                    const SizedBox(
                        height: 30),

                    /// ICON
                    Container(
                      width: 82,
                      height: 82,
                      decoration:
                          BoxDecoration(
                        color: Colors.white,
                        shape:
                            BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors
                                .black
                                .withOpacity(
                                    0.06),
                            blurRadius: 12,
                          )
                        ],
                      ),
                      child: const Icon(
                        Icons.mosque,
                        color: Color(
                            0xff16A34A),
                        size: 38,
                      ),
                    ),

                    const SizedBox(
                        height: 26),

                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight:
                            FontWeight.w700,
                      ),
                    ),

                    const SizedBox(
                        height: 6),

                    const Text(
                      "Sign in to continue",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(
                        height: 34),

                    field(
                      Icons.email_outlined,
                      "Email",
                    ),

                    const SizedBox(
                        height: 16),

                    field(
                      Icons.lock_outline,
                      "Password",
                    ),

                    const SizedBox(
                        height: 12),

                    Align(
                      alignment:
                          Alignment
                              .centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child:
                            const Text(
                          "Forgot Password?",
                          style:
                              TextStyle(
                            color: Color(
                                0xff64748B),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 12),

                    SizedBox(
                      width:
                          double.infinity,
                      height: 56,
                      child:
                          ElevatedButton(
                        onPressed: () {},
                        style:
                            ElevatedButton
                                .styleFrom(
                          backgroundColor:
                              const Color(
                                  0xff16A34A),
                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(
                                    30),
                          ),
                        ),
                        child:
                            const Text(
                          "Login",
                          style:
                              TextStyle(
                            fontSize: 17,
                            fontWeight:
                                FontWeight
                                    .w700,
                            color: Colors
                                .white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 24),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .center,
                      children: [
                        const Text(
                          "Don't have account? ",
                          style:
                              TextStyle(
                            color: Colors
                                .grey,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const RegisterPage(),
                              ),
                            );
                          },
                          child:
                              const Text(
                            "Register",
                            style:
                                TextStyle(
                              color: Color(
                                  0xff16A34A),
                              fontWeight:
                                  FontWeight
                                      .w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget field(
    IconData icon,
    String hint,
  ) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(
                  18),
          borderSide:
              BorderSide.none,
        ),
      ),
    );
  }
}