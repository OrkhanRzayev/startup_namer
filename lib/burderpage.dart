import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BurderPage extends StatefulWidget {
  const BurderPage(
      {super.key,
      this.imgPath,
      this.foodName,
      this.pricePerItem,
      this.heroTag});

  final imgPath, foodName, pricePerItem, heroTag;

  @override
  State<BurderPage> createState() => _BurderPageState();
}

class _BurderPageState extends State<BurderPage> {
  var netPrice = 0;
  var quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.menu, color: Colors.black),
                Stack(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      color: Colors.transparent,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xfffe7d6a).withOpacity(0.3),
                              blurRadius: 6,
                              spreadRadius: 4,
                              offset: const Offset(0, 4),
                            )
                          ],
                          color: const Color(0xfffe7d6a),
                          shape: BoxShape.circle),
                      child: const Center(
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 1,
                      right: 4,
                      child: Container(
                        height: 12,
                        width: 12,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '1',
                            style: GoogleFonts.notoSans(
                                fontSize: 7,
                                textStyle: const TextStyle(color: Colors.red)),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'SUPER',
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w800, fontSize: 27),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'HAMBURGER',
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w800, fontSize: 27),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Hero(
                tag: widget.heroTag,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.imgPath), fit: BoxFit.cover),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 45,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xfffe7d6a).withOpacity(0.1),
                              blurRadius: 6,
                              spreadRadius: 6,
                              offset: const Offset(5, 11),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: const Center(
                          child: Icon(
                            Icons.favorite_border,
                            color: Color(0xfffe7d6a),
                            size: 25,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 35),
                  Stack(
                    children: [
                      Container(
                        height: 45,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xfffe7d6a).withOpacity(0.1),
                              blurRadius: 6,
                              spreadRadius: 6,
                              offset: const Offset(5, 11),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: const Center(
                          child: Icon(
                            Icons.restore,
                            color: Color(0xfffe7d6a),
                            size: 25,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 70,
                width: 125,
                color: Colors.white,
                child: Center(
                  child: Text(
                    '\$${int.parse(widget.pricePerItem) * quantity}',
                    style: GoogleFonts.notoSans(
                        fontSize: 40,
                        color: const Color(0xff5e6166),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 225,
                decoration: const BoxDecoration(
                  color: Color(0xfffe7d6a),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40,
                      width: 105,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              adJustQuantity('MINUS');
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Color(0xfffe7d6a),
                            ),
                          ),
                          Text(
                            netPrice.toString(),
                            style: GoogleFonts.notoSans(
                                fontSize: 14,
                                color: const Color(0xfffe7d6a),
                                fontWeight: FontWeight.w400),
                          ),
                          IconButton(
                            onPressed: () {
                              adJustQuantity('PLUS');
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Color(0xfffe7d6a),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Add to cart',
                      style: GoogleFonts.notoSans(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'FEATURED',
              style: GoogleFonts.notoSans(
                  fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            height: 225,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildListItem('1'),
                _buildListItem('2'),
              ],
            ),
          )
        ],
      ),
    );
  }

  adJustQuantity(pressed) {
    switch (pressed) {
      case 'PLUS':
        setState(() {
          quantity += 1;
        });
        return;
      case 'MINUS':
        setState(() {
          if (quantity != 0) {
            quantity -= 1;
          }
        });
        return;
    }
  }
}

_buildListItem(String columNumber) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Column(
      children: [
        if (columNumber == '1')
          _buildColumnItem('assets/cheese.png', 'Sweet cheese', '11',
              const Color(0xfffbd6f5)),
        if (columNumber == '1')
          const SizedBox(
            height: 15,
          ),
        if (columNumber == '1')
          _buildColumnItem('assets/popcorn.png', 'Sweet popcorn', '11',
              const Color(0xfffbd6f5)),
        if (columNumber == '2')
          _buildColumnItem(
              'assets/taco.png', 'Tacos', '6', const Color(0xffc2e3fe)),
        if (columNumber == '2')
          _buildColumnItem(
              'assets/sandwich.png', 'Sandwich', '6', const Color(0xfffbd6f5)),
      ],
    ),
  );
}

_buildColumnItem(String imgPath, String foodName, String price, Color bgColor) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: 210,
        child: Row(
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7), color: bgColor),
              child: Center(
                child: Image.asset(
                  imgPath,
                  height: 50,
                  width: 50,
                ),
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
                Text(
                  '\$' + price,
                  style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      textStyle: const TextStyle(color: Color(0xfffe7d6a))),
                )
              ],
            )
          ],
        ),
      )
    ],
  );
}
