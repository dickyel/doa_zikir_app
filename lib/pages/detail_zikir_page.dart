import 'package:doa_zikir_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailZikirPage extends StatefulWidget {
  const DetailZikirPage({Key? key}) : super(key: key);

  @override
  State<DetailZikirPage> createState() => _DetailZikirPageState();
}

class _DetailZikirPageState extends State<DetailZikirPage> {
  int zikirCount = 0; // Initial zikir count

  List<String> images = [
    'assets/banner.png',
    'assets/banner.png',
    'assets/banner.png',
  ];

  PreferredSizeWidget header() {
    return PreferredSize(
      child: AppBar(
        backgroundColor: Color(0xff3899A7),
        centerTitle: true,
        title: Text(
          'Detail Doa',
          style: GoogleFonts.poppins(
            color: Color(0xffFFFFFF),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Icon(Icons.arrow_back)),
      ),
      preferredSize: Size.fromHeight(60),
    );
  }

  Widget carousel() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: CarouselSlider(
        items: images.map((image) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          );
        }).toList(),
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.7, // Adjust this value for image width
          aspectRatio: 2.0, // Adjust this value for image height
          autoPlayInterval: Duration(seconds: 2),
        ),
      ),
    );
  }

  Widget zikir() {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 218,
            height: 218,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              color: Color(0xffF9FAFA),
            ),
            child: Center(
              child: Text(
                '$zikirCount',
                style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    // Reset zikir count to 1
                    zikirCount = 0;
                  });
                },
                child: Text(
                  'Reset',
                  style: GoogleFonts.poppins(
                    color: Color(0xff000000),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xffD9D9D9),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    // Increment zikir count
                    zikirCount++;
                  });
                },
                child: Text(
                  'Tambah',
                  style: GoogleFonts.poppins(
                    color: Color(0xffFFFFFF),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xff3899A7),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: header(),
      body: Column(
        children: [
          carousel(),
          zikir(),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
