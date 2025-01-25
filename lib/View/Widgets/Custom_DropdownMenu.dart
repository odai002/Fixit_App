// ignore_for_file: must_be_immutable, use_super_parameters

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownMenuExample extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String>? onSelected;
  String? initialValue;
  DropdownMenuExample({
    Key? key,
    required this.items,
    this.onSelected,
    this.initialValue,
  }) : super(key: key);

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      shadowColor: Colors.black,
      borderRadius: const BorderRadius.all(Radius.circular(11)),
      child: widget.initialValue == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : DropdownButton<String>(
              value: widget.items
                  .where((element) => element == widget.initialValue!)
                  .firstOrNull,
              items: widget.items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      value,
                      style: GoogleFonts.libreCaslonText(
                        textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                  if (widget.onSelected != null) {
                    widget.onSelected!(newValue);
                  }
                }
              },
              underline: Container(),
              hint: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Select',
                  style: GoogleFonts.libreCaslonText(
                    textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              icon: const Icon(Icons.arrow_drop_down),
            ),
    );
  }
}
