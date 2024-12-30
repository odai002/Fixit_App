import 'package:flutter/material.dart';

class ReviewPopup extends StatefulWidget {
  const ReviewPopup({super.key});

  @override
  State<ReviewPopup> createState() => _ReviewPopupState();
}

class _ReviewPopupState extends State<ReviewPopup> {
  int selectedRating = 4; // Default rating

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Write A Review",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  "Rate the Service :",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                const SizedBox(width: 10),
                Row(
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedRating = index + 1;
                        });
                      },
                      child: Icon(
                        index < selectedRating
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.amber,
                        size: 30,
                      ),
                    );
                  }),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Your Review :",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 10),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Type Something....",
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  // Handle review submission
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6A3BA8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white), // Button text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Function to show the popup
void showReviewPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const ReviewPopup(),
  );
}
