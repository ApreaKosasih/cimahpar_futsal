import 'package:cimahpar_futsal/screen/navigation.dart';
import 'package:cimahpar_futsal/screen/register.dart';
import 'package:cimahpar_futsal/widget/textformfieldcustom.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController conEmail = TextEditingController();
  TextEditingController conPassword = TextEditingController();

  void checkEmailAndPassowrd() async {
    if (_formKey.currentState!.validate()) {
      //JIKA TRUE
      _formKey.currentState!.save(); //MAKA FUNGSI SAVE() DIJALANKAN

      if (conEmail.text.isEmpty || conPassword.text.isEmpty) {
      } else {
        //Berhasil login disini
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const Navigation(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
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
              padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Text(
                        "Selamat Datang !",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),

                    // username
                    TextFormFieldCustom(
                      validator: (value) {
                        if (value != '') {
                          return null;
                        } else {
                          return 'Masukan email anda';
                        }
                      },
                      text: "Email",
                      controller: conEmail,
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
                      controller: conPassword,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      text: 'Password',
                      hintText: 'YourPassword',
                      fillColor: const Color.fromARGB(255, 235, 235, 235),
                    ),
                  ],
                ),
              ),
            ),

            //lupa password
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  TextButton(
                      onPressed: () {
                        ModalBottomSheet._moreModalBottomSheet(context);
                      },
                      child: const Text("LUPA PASSWORD"))
                ],
              ),
            ),

            // login btn
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              width: MediaQuery.of(context).size.width,
              height: 48.0,
              child: ElevatedButton(
                onPressed: () {
                  checkEmailAndPassowrd();
                },
                child: const Text("MASUK"),
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
                  const Text("Belum punya akun ?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement<void, void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text("DAFTAR"))
                ],
              ),
            ),
            // register

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

class ModalBottomSheet {
  static void _moreModalBottomSheet(context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController conEmail = TextEditingController();
    Size size = MediaQuery.of(context).size;

    void checkEmail() async {
      if (formKey.currentState!.validate()) {
        //JIKA TRUE
        formKey.currentState!.save(); //MAKA FUNGSI SAVE() DIJALANKAN

        if (conEmail.text.isEmpty) {
        } else {
          //Sukses Kondisi disini

          // ini untuk tutup
          Navigator.pop(context);
        }
      }
    }

    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: size.height * 0.5,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(24.0),
                topLeft: Radius.circular(24.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
                          child: Text("Masukan Email Anda"),
                        ),

                        // email
                        TextFormFieldCustom(
                          validator: (value) {
                            if (value != '') {
                              return null;
                            } else {
                              return 'Masukan email anda';
                            }
                          },
                          text: "Email",
                          controller: conEmail,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          hintText: "youremail@email.com",
                          fillColor: const Color.fromARGB(255, 235, 235, 235),
                        ),
                        //jarak
                        const SizedBox(
                          height: 24,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 48.0,
                          child: ElevatedButton(
                            child: const Text('Kirim Email'),
                            onPressed: () => checkEmail(),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
