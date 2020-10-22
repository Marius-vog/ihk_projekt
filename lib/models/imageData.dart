import 'dart:convert';

import 'package:flutter/material.dart';

class ImageData {
  final String extractedText;
  final List<String> labels;
  final String joyLikelihood;
  final String sorrowLikelihood;
  final String surpriseLikelihood;
  final String angerLikelihood;

  ImageData({
    this.extractedText,
    this.labels,
    this.joyLikelihood,
    this.sorrowLikelihood,
    this.surpriseLikelihood,
    this.angerLikelihood,
  });

  factory ImageData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    // print(map['extractedText']);

    return ImageData(
      extractedText: map['extractedText'],
      labels: List<String>.from(map['labels']),
      joyLikelihood: map['joyLikelihood'],
      sorrowLikelihood: map['sorrowLikelihood'],
      surpriseLikelihood: map['surpriseLikelihood'],
      angerLikelihood: map['angerLikelihood'],
    );
  }
}
