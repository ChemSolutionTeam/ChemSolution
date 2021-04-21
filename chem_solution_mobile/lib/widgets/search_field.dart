import 'package:flutter/material.dart';

Icon searchIcon(bool _isSearch) => Icon(
      _isSearch ? Icons.cancel : Icons.search,
      color: _isSearch ? Color(0xff1dcdfe) : Color(0xff21D0B2),
    );

InputDecoration searchDecor(String hint) => InputDecoration(
      icon: Icon(
        Icons.search,
        color: Color(0xff1dcdfe),
      ),
      hintText: hint,
      hintStyle: TextStyle(
        color: Color(0xff1dcdfe),
      ),
    );
