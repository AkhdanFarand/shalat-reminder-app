import 'package:flutter/material.dart';

class FavouritesPage
    extends StatelessWidget {
  const FavouritesPage({
    super.key,
  });

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
          "Favourites",
          style: TextStyle(
            color: Colors.black,
            fontWeight:
                FontWeight.w600,
          ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment
                  .center,
          children: [

            Container(
              width: 74,
              height: 74,
              decoration:
                  BoxDecoration(
                color: const Color(
                        0xffEFF6FF)
                    .withOpacity(
                        0.9),
                shape:
                    BoxShape.circle,
              ),
              child: const Icon(
                Icons
                    .favorite_border,
                size: 34,
                color: Color(
                    0xff94A3B8),
              ),
            ),

            const SizedBox(
                height: 18),

            const Text(
              "No favourites yet",
              style: TextStyle(
                fontWeight:
                    FontWeight.w700,
                fontSize: 16,
              ),
            ),

            const SizedBox(
                height: 8),

            const Text(
              "Your saved items will appear\nhere",
              textAlign:
                  TextAlign.center,
              style: TextStyle(
                color: Color(
                    0xff94A3B8),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}