import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startup_namer/burderpage.dart';
import 'package:startup_namer/foodtabs.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

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
                const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 6,
                        spreadRadius: 4,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    color: const Color(0xffc6e7fe),
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                        image: AssetImage('assets/tuxedo.png'),
                        fit: BoxFit.contain),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'SEARCH FOR',
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w800, fontSize: 27),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'RECIPES',
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w800, fontSize: 27),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              padding: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: GoogleFonts.notoSans(fontSize: 16),
                    border: InputBorder.none,
                    fillColor: Colors.grey.withOpacity(0.5),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    )),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Recomended',
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildListItem('Hamburg', 'assets/burger.png', '21',
                    const Color(0xffFEE9C4), const Color(0xffD7A976)),
                _buildListItem('Chips', 'assets/fries.png', '15',
                    const Color(0xffc2e3fe), const Color(0xff6a8caa)),
                _buildListItem('Donuts', 'assets/doughnut.png', '15',
                    const Color(0xffd7fada), const Color(0xff56cc7e)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              labelStyle: GoogleFonts.notoSans(
                  fontSize: 16, fontWeight: FontWeight.w700),
              unselectedLabelStyle: GoogleFonts.notoSans(
                  fontSize: 12, fontWeight: FontWeight.w500),
              tabs: const [
                Tab(
                  child: Text('FEATURED'),
                ),
                Tab(
                  child: Text('COMBO'),
                ),
                Tab(
                  child: Text('FAVORITES'),
                ),
                Tab(
                  child: Text('RECOMMENDED'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 450,
            child: TabBarView(controller: tabController, children: const [
              FoodTab(),
              FoodTab(),
              FoodTab(),
              FoodTab(),
            ]),
          )
        ],
      ),
    );
  }

  _buildListItem(String foodName, String imgPath, String price, Color bgColor,
      Color textColor) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BurderPage(
              heroTag: foodName,
              foodName: foodName,
              pricePerItem: price,
              imgPath: imgPath,
            ),
          ));
        },
        child: Container(
          height: 175,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: bgColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: foodName,
                child: Container(
                  height: 75,
                  width: 75,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      imgPath,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                foodName,
                style: GoogleFonts.notoSans(
                  fontSize: 17,
                  color: textColor,
                ),
              ),
              Text(
                '\$$price',
                style: GoogleFonts.notoSans(
                  fontSize: 17,
                  color: textColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
