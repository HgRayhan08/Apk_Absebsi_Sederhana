import 'package:absensi/presentasi/misc/build_context_alert_information.dart';
import 'package:absensi/presentasi/provider/login_provider/user_data.dart';
import 'package:absensi/presentasi/provider/router/router_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool _obscureText = true;

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pesan'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Aplikasi ini menggunakan Full Local Storage'),
                Text(
                  "Login akan disimpan di local, User harus memasukkan email ,password dan nama",
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OKE'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    print("object");
    // Memastikan dialog ditampilkan setelah build selesai
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showMyDialog();
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    ref.listen(
      userDataProvider,
      (previous, next) {
        if (next is AsyncData) {
          if (next.value == true) {
            ref.read(routerProvider).goNamed("home");
          }
        }
      },
    );

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.02,
        ),
        children: [
          SizedBox(height: height * 0.1),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Login",
              style: GoogleFonts.lato().copyWith(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          const Text("Email"),
          TextFormField(
            controller: emailController,
          ),
          SizedBox(height: height * 0.03),
          const Text("Password"),
          TextFormField(
            controller: passwordController,
            obscureText: _obscureText,
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText == false
                        ? Icons.visibility_off
                        : Icons.visibility,
                  )),
            ),
          ),
          SizedBox(height: height * 0.03),
          const Text("Name"),
          TextFormField(
            controller: nameController,
          ),
          SizedBox(height: height * 0.05),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              backgroundColor: const Color(0xff7BD3EA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              if (emailController.text != "" ||
                  passwordController.text != "" ||
                  nameController.text != "") {
                ref.read(userDataProvider.notifier).login(
                    email: emailController.text,
                    password: passwordController.text,
                    name: nameController.text);
              } else {
                context.buildAlertInformation(
                    title: "Pesan",
                    subTitle: "Please enter the data completely");
              }
            },
            child: const Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
