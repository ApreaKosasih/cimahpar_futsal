import 'package:cimahpar_futsal/screen/booking_detail.dart';
import 'package:cimahpar_futsal/widget/theme.dart';
import 'package:flutter/material.dart';

//list dummy
List datalist = [
  {
    "id": 0,
    "category": "Umum",
    "img": "assets/images/Asset6.png",
    "syarat": ["Syarat 1", "Syarat 2", "Syarat 3", "Syarat 4", "Syarat 5"]
  },
  {
    "id": 1,
    "category": "Sekolah",
    "img": "assets/images/Asset7.png",
    "syarat": ["Syarat 1", "Syarat 2", "Syarat 3", "Syarat 4", "Syarat 5"]
  },
  {
    "id": 2,
    "category": "Turnamen",
    "img": "assets/images/Asset8.png",
    "syarat": ["Syarat 1", "Syarat 2", "Syarat 3", "Syarat 4", "Syarat 5"]
  },
  {
    "id": 3,
    "category": "Anak anak",
    "img": "assets/images/Asset9.png",
    "syarat": ["Syarat 1", "Syarat 2", "Syarat 3", "Syarat 4", "Syarat 5"]
  }
];

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Booking"),
        centerTitle: true,
      ),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        const Text(
          "Pilih Kategori Booking",
          style: subTitleBlack,
        ),
        const SizedBox(
          height: 24,
        ),
        //data dari list dipasing kesini buat ditampilin di widget
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: datalist.length,
          itemBuilder: (BuildContext context, int index) {
            final category = datalist[index]["category"];
            final img = datalist[index]["img"];
            final syaratList = datalist[index]["syarat"] as List<String>;
            return CardSyarat(
              title: category,
              syaratList: syaratList,
              imgLocation: img,
              onTap: () {
                print("Tap${index}");
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => BookingDetailScreen(
                      kategori: category,
                    ),
                  ),
                );
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 16,
          ),
        )
      ]),
    );
  }
}

//ini widget card
class CardSyarat extends StatelessWidget {
  const CardSyarat({
    super.key,
    required this.title,
    required this.syaratList,
    required this.imgLocation,
    required this.onTap,
  });

  final String title;
  final List<String> syaratList;
  final String imgLocation;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(24.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 64,
                  height: 64,
                  child: Image.asset(imgLocation),
                ),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: titleBlack,
                      ),
                      Icon(
                        Icons.arrow_circle_right,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 32,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            ExpansionTile(
              backgroundColor: Colors.yellow[200],
              collapsedBackgroundColor: Colors.yellow[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              title: const Text('Syarat & Ketentuan'),
              children: <Widget>[
                ListView.builder(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: syaratList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(syaratList[index]),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
