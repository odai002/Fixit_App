import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Widgets/Custom_App_bar.dart';
import '../../../../Widgets/Custom_Bottom_CON_naf_Bar.dart';
import '../../../../Widgets/Custom_Card_CON_Widget.dart';


class ContractorHomePage extends StatefulWidget {

  @override
  _ContractorHomePageState createState() => _ContractorHomePageState();
}

class _ContractorHomePageState extends State<ContractorHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SnackBarBodyCON(

      ),
      appBar: CustomAppBar(title: '',

      ),

      resizeToAvoidBottomInset: false,
      body:                /* SortingSegmentedControl()*/
      Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,

        ),
        child:   Container(
          width:  double.maxFinite,
          padding: EdgeInsets.all(25.0),
          child: Column  (
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 22,left: 12,top: 12),
                    child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(

                              text:  "Today",
                              style: GoogleFonts.getFont('Libre Caslon Text',
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            ),

                          ]
                      ),
                    ),
                  ),
                ),
                CustomCardCON(image: Image.asset(
                    'assets/U.png'), email: 'omar@gmail.com', desc: 'Iwork', number: '099662259', name: 'omar', category:'elecronic', local: 'Damascus/syria'),
              ]
          ),
        ),

      ),
    );


  }

}


