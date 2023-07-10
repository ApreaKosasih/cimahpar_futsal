import 'package:cimahpar_futsal/screen/login.dart';
import 'package:cimahpar_futsal/widget/textformfieldcustom.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(64, 56, 64, 48),
                child: Image.asset("assets/images/new_logo.png"),
              ),
            ),

            const SizedBox(
              height: 48,
            ),

            // form
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Text(
                        "Daftar Akun",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),

                    // nama
                    TextFormFieldCustom(
                      validator: (value) {
                        if (value != '') {
                          return null;
                        } else {
                          return 'Masukan nama anda';
                        }
                      },
                      text: "Nama Depan",
                      controller: TextEditingController(),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      hintText: "nama depan",
                      fillColor: const Color.fromARGB(255, 235, 235, 235),
                    ),
                    //jarak
                    const SizedBox(
                      height: 24,
                    ),
                    // nama belakang
                    TextFormFieldCustom(
                      validator: (value) {
                        if (value != '') {
                          return null;
                        } else {
                          return 'Masukan nama lengkap anda';
                        }
                      },
                      text: "Nama Belakang",
                      controller: TextEditingController(),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      hintText: "nama belakang",
                      fillColor: const Color.fromARGB(255, 235, 235, 235),
                    ),
                    //jarak
                    const SizedBox(
                      height: 24,
                    ),
                    // no telepon
                    TextFormFieldCustom(
                      validator: (value) {
                        if (value != '') {
                          return null;
                        } else {
                          return 'Masukan nomor telepon';
                        }
                      },
                      text: "Nomor Telepon",
                      controller: TextEditingController(),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      hintText: "Nomor Telepon",
                      fillColor: const Color.fromARGB(255, 235, 235, 235),
                    ),
                    //jarak
                    const SizedBox(
                      height: 24,
                    ),
                    // email
                    TextFormFieldCustom(
                      validator: (value) {
                        if (value != '') {
                          return null;
                        } else {
                          return 'Masukan email';
                        }
                      },
                      text: "Email",
                      controller: TextEditingController(),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      hintText: "youremail@email.com",
                      fillColor: const Color.fromARGB(255, 235, 235, 235),
                    ),
                    //jarak
                    const SizedBox(
                      height: 24,
                    ),
                    // password
                    TextFormFieldCustom(
                      isPassword: true,
                      obscure: true,
                      validator: (value) {
                        if (value != '') {
                          return null;
                        } else {
                          return 'Masukan password anda';
                        }
                      },
                      controller: TextEditingController(),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      text: 'Password',
                      hintText: 'YourPassword',
                      fillColor: const Color.fromARGB(255, 235, 235, 235),
                    ),
                    //jarak
                    const SizedBox(
                      height: 24,
                    ),
                    // re-password
                    TextFormFieldCustom(
                      isPassword: true,
                      obscure: true,
                      validator: (value) {
                        if (value != '') {
                          return null;
                        } else {
                          return 'Masukan password anda kembali';
                        }
                      },
                      controller: TextEditingController(),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      text: 'Konfirmasi Password',
                      hintText: 'YourPassword',
                      fillColor: const Color.fromARGB(255, 235, 235, 235),
                    ),
                    //jarak
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),

            // login btn
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              width: MediaQuery.of(context).size.width,
              height: 48.0,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("DAFTAR"),
              ),
            ),
            //jarak
            const SizedBox(
              height: 24,
            ),
            // register
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Sudah punya akun ?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement<void, void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text("MASUK"))
                ],
              ),
            ),
            //jarak
            const SizedBox(
              height: 48,
            ),
          ],
        ),
      ),
    );
  }
}
