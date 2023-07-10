import 'package:cimahpar_futsal/screen/navigation.dart';
import 'package:cimahpar_futsal/widget/theme.dart';
import 'package:flutter/material.dart';

class PemesananScreen extends StatefulWidget {
  const PemesananScreen({super.key});

  @override
  State<PemesananScreen> createState() => _PemesananScreenState();
}

class _PemesananScreenState extends State<PemesananScreen> {
  bool valueCheckBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pemesanan Detail"),
        centerTitle: true,
      ),
      body: ListView(padding: const EdgeInsets.all(16.0), children: [
        Container(
          padding: const EdgeInsets.all(16.0),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Tanggal",
                style: TextStyle(height: 1.5, color: Colors.green),
              ),
              const Text(
                'Minggu, 9 Juli 2023',
                style: titleBlack,
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Text(
                "Jam",
                style: TextStyle(height: 1.5, color: Colors.green),
              ),
              const Text(
                '19:00 - 21:00',
                style: titleBlack,
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Text(
                "Lapangan",
                style: TextStyle(height: 1.5, color: Colors.green),
              ),
              const Text(
                'Lapangan 2',
                style: titleBlack,
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Text(
                "Kategori",
                style: TextStyle(height: 1.5, color: Colors.green),
              ),
              const Text(
                'Umum',
                style: titleBlack,
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Text(
                "Harga",
                style: TextStyle(height: 1.5, color: Colors.green),
              ),
              const Text(
                'Rp. 100.000',
                style: titleBlack,
              ),
              const SizedBox(
                height: 24.0,
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
                title: const Text('Ketentuan'),
                children: <Widget>[
                  ListView.builder(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text("Ketentuan$index"),
                      );
                    },
                  )
                ],
              ),

              //checkbox
              Row(
                children: <Widget>[
                  const Expanded(
                    child: Text(
                      'Saya setuju dengan kebijakan Privasi dan Syarat & Ketentuan Cimahpar Futsal.',
                    ),
                  ),
                  Checkbox(
                    value: valueCheckBox,
                    onChanged: (bool? value) {
                      setState(() {
                        valueCheckBox = value!;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(
                height: 24,
              ),

              // Tombol Pesan
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 48.0,
                child: ElevatedButton(
                  onPressed: () {
                    // disini ngirim indexno 2 karena ketika di klik biar si bottomnav juga berpengaruh ikut pindah
                    Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const Navigation(
                          indexno: 2,
                        ),
                      ),
                    );
                  },
                  child: const Text("PESAN LANGSUNG SEKSARANG"),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ]),
    );
  }
}
