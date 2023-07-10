import 'package:cimahpar_futsal/screen/navigation.dart';
import 'package:cimahpar_futsal/widget/theme.dart';
import 'package:flutter/material.dart';

class TiketScreen extends StatefulWidget {
  const TiketScreen({super.key});

  @override
  State<TiketScreen> createState() => _TiketScreenState();
}

class _TiketScreenState extends State<TiketScreen> {
  //sementara pakai boolean ini buat munculin widget empty state jika kondisi ga ada tiket
  bool _emptyState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Tiket"),
        centerTitle: true,
      ),
      body: _emptyState
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Image.asset("assets/images/Asset3.png"),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Text(
                      "Belum ada tiket",
                      style: titleBlack,
                    ),
                  )
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return const CardTiket(
                  harga: 'Rp. 100.000',
                  jam: '16:00 - 17:00',
                  kategori: 'Umum',
                  lapangan: 'Lapangan 2',
                  tanggal: 'Senin, 10 Juli 2023',
                  status: 'Belum main ha ha he he ha he ho he ha',
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 16,
              ),
            ),
    );
  }
}

class CardTiket extends StatelessWidget {
  const CardTiket({
    super.key,
    required this.tanggal,
    required this.lapangan,
    required this.kategori,
    required this.jam,
    required this.harga,
    required this.status,
  });

  final String tanggal;
  final String lapangan;
  final String kategori;
  final String jam;
  final String harga;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
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
          child: Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tanggal,
                  style: const TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
                const Divider(
                  height: 24,
                  thickness: 1,
                ),
                Text(
                  lapangan,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  kategori,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  jam,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  harga,
                  style: subTitleBlack,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
            decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24.0),
                topLeft: Radius.circular(24.0),
              ),
            ),
            child: RotatedBox(
              quarterTurns: 1,
              child: Text(
                status,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        Positioned(
            right: 16,
            bottom: 16,
            child: Row(
              children: [
                CircleAvatar(
                  child: IconButton(
                    onPressed: () {
                      // disini ngirim indexno 1 karena ketika di klik biar si bottomnav juga berpengaruh ikut pindah
                      Navigator.pushReplacement<void, void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const Navigation(
                            indexno: 1,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                CircleAvatar(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.cancel),
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
