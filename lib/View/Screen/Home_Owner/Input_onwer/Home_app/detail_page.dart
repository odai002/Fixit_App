import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContractorProfilePage extends StatefulWidget {
  @override
  _ContractorProfilePageState createState() => _ContractorProfilePageState();
}

class _ContractorProfilePageState extends State<ContractorProfilePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _imageList = [
    'assets/9.jpg',
    'assets/8.jpg',
    'assets/7.jpg',
    // Add more images here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Icon(Icons.location_on, color: Color(0xFF59308E)),
            SizedBox(width: 8),
            Text(
              "Syria / Rif Damashq / 55666 Olive Viaduct",
              style: GoogleFonts.roboto(fontSize: 10),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Carousel with PageView
              Container(
                height: 200,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _imageList.length,
                  onPageChanged: (int index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        _imageList[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              // Animated Pagination Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_imageList.length, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 30 : 10,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index ? Color(0xFF59308E) : Colors.grey[300],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
              SizedBox(height: 24),
              // Contractor Info
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile_placeholder.png'), // Profile image
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mhamad Alshame",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Electrician",
                        style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey),
                      ),
                      Row(
                        children: [
                          Icon(Icons.phone, color: Color(0xFF59308E), size: 10),
                          SizedBox(width: 4),
                          Text("0945113366", style: GoogleFonts.roboto(fontSize: 10)),
                          SizedBox(width: 16),
                          Icon(Icons.email, color: Color(0xFF59308E), size: 10),
                          SizedBox(width: 4),
                          Text("Mh233@gmail.com", style: GoogleFonts.roboto(fontSize: 10)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Description
              Text(
                "Description:",
                style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "I'm dedicated, professional, and highly experienced electrical engineer with nearly 20 years in the field.",
                style: GoogleFonts.roboto(fontSize: 12),
              ),
              SizedBox(height: 24),
              // Reviews Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Reviews (25)",
                    style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to reviews page
                    },
                    child: Text(
                      "See more.",
                      style: GoogleFonts.roboto(color: Color(0xFF59308E), fontSize: 12),
                    ),
                  ),
                ],
              ),
              Row(
                children: List.generate(4, (index) {
                  return Icon(Icons.star, color: Colors.amber, size: 20);
                })..add(Icon(Icons.star_half, color: Colors.amber, size: 20)),
              ),
              SizedBox(height: 16),
              // Single review
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/reviewer_placeholder.png'), // Replace with actual image
                ),
                title: Text(
                  "Jhon Lemon",
                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: List.generate(3, (index) {
                        return Icon(Icons.star, color: Colors.amber, size: 16);
                      })..addAll([
                        Icon(Icons.star_half, color: Colors.amber, size: 16),
                        Icon(Icons.star_border, color: Colors.grey, size: 16),
                      ]),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "He fixed my electric problem in time but the price was a bit expensive.",
                      style: GoogleFonts.roboto(fontSize: 10),
                    ),
                  ],
                ),
                trailing: Text(
                  "Today",
                  style: GoogleFonts.roboto(color: Colors.grey, fontSize: 10),
                ),
              ),
              SizedBox(height: 24),
              // Hire Now Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Hire action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF59308E),
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Hire Now",
                    style: GoogleFonts.roboto(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
