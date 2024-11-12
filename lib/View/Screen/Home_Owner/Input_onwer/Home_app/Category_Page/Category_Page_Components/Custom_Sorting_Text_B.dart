// ignore_for_file: file_names, unused_import, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SortingSegmentedControl extends StatefulWidget {
  final String title;
  final String buttonCaption;
    final Function(int) onSelectionChanged; // Callback for notifying the parent

  const SortingSegmentedControl({super.key, 
    required this.title,
    required this.buttonCaption,
    required this.onSelectionChanged,
  });

  @override
  _SortingSegmentedControlState createState() => _SortingSegmentedControlState();
}

class _SortingSegmentedControlState extends State<SortingSegmentedControl> {
    List<bool> _isSelected = [true, false]; // Keep track of selected button

  void _sortItems(int index) {
    setState(() {
      for (int buttonIndex = 0; buttonIndex < _isSelected.length; buttonIndex++) {
        _isSelected[buttonIndex] = buttonIndex == index;
      }

      // Notify the parent about the selection
      widget.onSelectionChanged(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Title Text
        Padding(
          padding: const EdgeInsets.only(right: 12,top: 10),
          child: Text(
            widget.title, // Title passed from parent
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),

        // Toggle Buttons
        ToggleButtons(
          borderColor: const Color(0xff59308E),
          selectedBorderColor: const Color(0xff59308E),
          borderWidth: 1,
          selectedColor: Colors.white,
          color: const Color(0xff59308E),
          fillColor: const Color(0xff59308E),
          borderRadius: BorderRadius.circular(10),
          onPressed: (int index) {
            _sortItems(index);
          },
          isSelected: _isSelected,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text('None'), 
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(widget.buttonCaption), 
            ),
          ],
        ),
      ],
    );
  }
}
