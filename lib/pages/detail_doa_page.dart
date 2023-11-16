import 'package:doa_zikir_app/models/doa_models.dart';
import 'package:doa_zikir_app/pages/home_page.dart';
import 'package:doa_zikir_app/providers/doa_provider.dart';
import 'package:doa_zikir_app/widgets/doa_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';


class DetailDoaPage extends StatefulWidget {
  const DetailDoaPage({super.key});

  @override
  State<DetailDoaPage> createState() => _DetailDoaPageState();
}

class _DetailDoaPageState extends State<DetailDoaPage> {

  List<String> images = [
    'assets/banner.png',
    'assets/banner.png',
    'assets/banner.png',
  ];
  
  @override
  void initState() {
    super.initState();
    Provider.of<DoaProvider>(context, listen: false).getDoas();
  }
  Widget build(BuildContext context) {
    
    DoaProvider doaProvider = Provider.of<DoaProvider>(context);
    
    PreferredSizeWidget header(){
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
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
            },
            child: Icon(
              Icons.arrow_back
            )
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

    Widget content(){
      return Expanded(
        child: Container(
          color: Color(0xffFFFFFF),
          child: ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: 20
            ),
            itemCount:  doaProvider.doas.length,
            itemBuilder: (context, index){
              DoaModel doa = doaProvider.doas[index];
              return DoaCard(doa);
          })
        ),
      );
    }
 
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: header(),
      body: Column(
      
        children: [
          carousel(),
          content(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}