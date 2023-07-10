import 'package:cimahpar_futsal/screen/pemesanan.dart';
import 'package:cimahpar_futsal/widget/theme.dart';
import 'package:flutter/material.dart';

class BookingDetailScreen extends StatefulWidget {
  const BookingDetailScreen({super.key, required this.kategori});

  final String kategori;

  @override
  State<BookingDetailScreen> createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends State<BookingDetailScreen> {
  int selectedIdx = -1;

  int stock = 0;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking ${widget.kategori}"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pilih Lapangan",
                    style: subTitleBlack,
                  ),
                  Text(
                    "lapangan terpilih dengan ada tanda ceklis",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
            ),

            // widget list lapangan
            SizedBox(
              height: 200,
              child: ListView.separated(
                padding: const EdgeInsets.all(16.0),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  final isSelected = selectedIdx == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        // Update selectedIdx sesuai dengan index yang di-klik
                        if (isSelected) {
                          selectedIdx =
                              -1; // Membatalkan pemilihan jika item sudah dipilih sebelumnya
                        } else {
                          selectedIdx = index; // Memilih item yang di-klik
                        }
                      });
                    },
                    child: Stack(children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.network(
                            "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(24.0),
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(24.0),
                          ),
                        ),
                        child: Text(
                          'Lapangan ${index + 1}',
                          style: title,
                        ),
                      ),
                      //Icon penanda selected
                      // Icon penanda selected
                      isSelected
                          ? const Positioned(
                              top: 16,
                              right: 16,
                              child: Icon(
                                Icons.check_circle,
                                size: 32,
                                color: Colors.orange,
                              ),
                            )
                          : const SizedBox(),
                    ]),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  width: 16,
                ),
              ),
            ),

            const SizedBox(
              height: 24,
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 0, 16),
              child: Text(
                "Pilih Waktu",
                style: subTitleBlack,
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey)),
              child: ListTile(
                //kasih fungsi buat nampilin date picker di onTap dan balikin nilainya
                onTap: () {},
                title: const Text("Tanggal"),
                trailing: Icon(
                  Icons.date_range,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey)),
              child: ListTile(
                //kasih fungsi buat nampilin date picker di onTap dan balikin nilainya
                onTap: () {},
                title: const Text("Jam"),
                trailing: Icon(
                  Icons.schedule,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Durasi Jam :"),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          int currentValue = int.tryParse(controller.text) ?? 0;
                          controller.text =
                              (currentValue > 0) ? "${currentValue - 1}" : "0";
                        },
                        icon: Icon(
                          Icons.remove_circle,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: TextField(
                          controller: controller,
                          maxLength: 3,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            hintText: "0",
                            border: InputBorder.none,
                            counterText: "",
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          int currentValue = int.tryParse(controller.text) ?? 0;
                          controller.text = "${currentValue + 1}";
                        },
                        icon: Icon(
                          Icons.add_circle,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(),

            //harga

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Total harga :"),
                      Text(
                        "Rp. 100.000",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const PemesananScreen(),
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text("PESAN"),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
