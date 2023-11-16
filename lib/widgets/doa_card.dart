import 'package:doa_zikir_app/models/doa_models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class DoaCard extends StatelessWidget {
 
  final DoaModel doa;
  DoaCard(this.doa);

  @override
  
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doa.doa!,
            style: GoogleFonts.poppins(
              color: Color(0xff000000),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            
            padding: EdgeInsets.all(
              30
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xffF9FAFA)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      doa.ayat!,
                      style: GoogleFonts.poppins(
                        color: Color(0xff000000),
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  doa.artinya!,
                  style: GoogleFonts.poppins(
                    color: Color(0xff0000000),
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}