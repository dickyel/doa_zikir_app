import 'package:doa_zikir_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override

  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 3), (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),),
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3899A7),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 286,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Aplikasi\nZikir & Doa',
              style: GoogleFonts.poppins(
                color: Color(0xffFFFFFF),
                fontSize: 28,
                
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}