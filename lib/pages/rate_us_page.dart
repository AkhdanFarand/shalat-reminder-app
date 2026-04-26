import 'package:flutter/material.dart';

class RateUsPage extends StatefulWidget {
  const RateUsPage({super.key});

  @override
  State<RateUsPage> createState() =>
      _RateUsPageState();
}

class _RateUsPageState
    extends State<RateUsPage> {
  int selectedStar = 0;

  Widget starItem(int index) {
    final active =
        selectedStar >= index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedStar = index;
        });
      },
      child: Padding(
        padding:
            const EdgeInsets.symmetric(
          horizontal: 6,
        ),
        child: Icon(
          active
              ? Icons.star
              : Icons.star_border,
          size: 34,
          color: active
              ? const Color(
                  0xffFACC15)
              : const Color(
                  0xffCBD5E1),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xffF3F4F6),

      appBar: AppBar(
        backgroundColor:
            Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme:
            const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          "Rate Us",
          style: TextStyle(
            color: Colors.black,
            fontWeight:
                FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding:
            const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment
                  .center,
          children: [

            Row(
              mainAxisAlignment:
                  MainAxisAlignment
                      .center,
              children: [
                starItem(1),
                starItem(2),
                starItem(3),
                starItem(4),
                starItem(5),
              ],
            ),

            const SizedBox(
                height: 26),

            const Text(
              "How was your experience?",
              style: TextStyle(
                fontSize: 15,
                fontWeight:
                    FontWeight.w600,
              ),
            ),

            const SizedBox(
                height: 28),

            SizedBox(
              width:
                  double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(
                          context)
                      .showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Thanks for your feedback!",
                      ),
                    ),
                  );
                },
                style:
                    ElevatedButton
                        .styleFrom(
                  backgroundColor:
                      const Color(
                          0xff16A34A),
                  elevation: 0,
                  padding:
                      const EdgeInsets
                          .symmetric(
                    vertical: 15,
                  ),
                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius
                            .circular(
                                30),
                  ),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    fontWeight:
                        FontWeight
                            .w700,
                    color:
                        Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}