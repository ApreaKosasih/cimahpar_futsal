import 'package:flutter/material.dart';

class PanduanScreen extends StatelessWidget {
  const PanduanScreen(
      {super.key,
      required this.title,
      required this.deskripsi,
      required this.catatan});

  final String title;
  final String deskripsi;
  final String catatan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panduan"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title
            Text(
              title,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 21,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 24,
            ),

            //isi
            Text(
              deskripsi,
            ),

            const SizedBox(
              height: 24,
            ),

            //catatan pakai rich text
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  const TextSpan(
                      text: "Catatan : ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: catatan,
                      style: const TextStyle(fontWeight: FontWeight.normal)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
