import 'package:flutter/material.dart';

class CatalogItem {
  final String title;
  final String description;
  final IconData icon;

  const CatalogItem({
    required this.title,
    required this.description,
    required this.icon,
  });
}
