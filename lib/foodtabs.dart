import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class FoodTab extends StatefulWidget {
  const FoodTab({super.key});

  @override
  State<FoodTab> createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildListItem('Delicious hot dog', 4.0, '6', 'assets/hotdog.png'),
          _buildListItem('Cheese pizza', 5.0, '12', 'assets/pizza.png')
        ],
      ),
    );
  }

  _buildListItem(String foodName, double rating, String price, String imgPath) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 210,
            child: Row(
              children: [
                Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: const Color(0xffffe3df)),
                  child: Center(
                    child: Image.asset(imgPath, height: 50, width: 50),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodName,
                      style: GoogleFonts.notoSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SmoothStarRating(
                      allowHalfRating: false,
                      onRatingChanged: (v) {},
                      starCount: rating.toInt(),
                      rating: rating,
                      color: const Color(0xffffd143),
                      borderColor: const Color(0xffffd143),
                      size: 15,
                      spacing: 0,
                    ),
                    Row(
                      children: [
                        Text(
                          '\$$price',
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            textStyle: const TextStyle(
                              color: Color(0xfff68d7f),
                            ),
                          ),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '\$' '18',
                          style: GoogleFonts.lato(
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w600,
                            textStyle: TextStyle(
                              color: Colors.grey.withOpacity(0.4),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          FloatingActionButton(
            heroTag: foodName,
            mini: true,
            onPressed: () {},
            backgroundColor: const Color(0xfffe7d6a),
            child: const Center(
              child: Icon(Icons.add, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
