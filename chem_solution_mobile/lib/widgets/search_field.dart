import 'package:flutter/material.dart';
import 'package:chem_solution_mobile/assets/colors.dart';

Icon searchIcon(bool _isSearch) => Icon(
      _isSearch ? Icons.cancel : Icons.search,
      color: _isSearch ? themeBlue : themeGreen,
    );

InputDecoration searchDecor(String hint) => InputDecoration(
      icon: Icon(
        Icons.search,
        color: themeBlue,
      ),
      hintText: hint,
      hintStyle: TextStyle(
        color: themeBlue,
      ),
    );
