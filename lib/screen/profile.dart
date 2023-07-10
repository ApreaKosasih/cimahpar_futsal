import 'package:cimahpar_futsal/widget/theme.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(24.0)),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                    radius: 32,
                    child: Icon(
                      Icons.account_circle,
                      size: 48,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Aprea Kosasih',
                        style: h1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Terverifikasi',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              "Nomor Telepon",
              style: TextStyle(
                  height: 1.5, color: Theme.of(context).colorScheme.secondary),
            ),
            const Text(
              '087777212721',
              style: titleBlack,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              "Email",
              style: TextStyle(
                  height: 1.5, color: Theme.of(context).colorScheme.secondary),
            ),
            const Text(
              'apreako@gmail.com',
              style: titleBlack,
            ),
            const Divider(
              height: 48,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: OutlinedButton(
                    onPressed: () {}, child: const Text("EDIT PROFILE")))
          ],
        ),
      ),
    );
  }
}
