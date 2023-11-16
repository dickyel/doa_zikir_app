import 'package:doa_zikir_app/widgets/doa_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'detail_doa_page.dart';
import 'detail_zikir_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> images = [
    'assets/banner.png',
    'assets/banner.png',
    'assets/banner.png',
  ];
  @override
  Widget build(BuildContext context) {
    
    
    PreferredSizeWidget header(){
      return PreferredSize(
        child: AppBar(
          backgroundColor: Color(0xff3899A7),
          centerTitle: true,
          title: Text(
            'Menu',
            style: GoogleFonts.poppins(
              color: Color(0xffFFFFFF),
              fontSize: 28,
              fontWeight: FontWeight.bold,

            ),
          ),
          
        ), 
        preferredSize: Size.fromHeight(60),
      );
    }

    Widget carousel(){
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
                borderRadius: BorderRadius.circular(16)
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
        )
      );
    }

    Widget doa(){
      return GestureDetector(
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DetailDoaPage(),));
        },
        child: Container(
          margin: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xffE9E9EA),
      
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  'assets/icon.png'
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                children: [
                    Text(
                      'Bacaan Doa Sehari-hari',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff000000),
      
                      ),
                    
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Untuk anda yang ingin\nmengingat kembali doa sehari-hari',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000),
      
                      ),
                      textAlign: TextAlign.center,                  
                    )
                  ],
                ),
              )
            ]
          ),
        ),
      );
    }

    Widget zikir(){
      return GestureDetector(
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DetailZikirPage(),));
        },
        child: Container(
          margin: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xffE9E9EA),
      
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  'assets/icon1.png'
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                children: [
                    Text(
                      'Mulai Zikir',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff000000),
      
                      ),
                    
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Untuk anda yang ingin\nberzikir kepada Allah SWT',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000),
      
                      ),
                      textAlign: TextAlign.center,                  
                    )
                  ],
                ),
              )
            ]
          ),
        ),
      );
    }

    Widget sholat(){
      return Container(
        margin: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffE9E9EA),

        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                'assets/icon3.png'
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
              children: [
                  Text(
                    'Bacaan Sholat',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff000000),

                    ),
                  
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Untuk anda yang ingin mengingat\nkembali bacaan sholat',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000),

                    ),
                    textAlign: TextAlign.center,                  
                  )
                ],
              ),
            )
          ]
        ),
      );
    }

     
    
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: header(),
      body: ListView(
      
        children: [
          carousel(),
          doa(),
          zikir(),
          sholat(),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}