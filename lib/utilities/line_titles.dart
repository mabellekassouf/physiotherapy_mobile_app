import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData() {
    final style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );

    return FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 30,
        getTextStyles: (_) => style,
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return 'MON';
            case 2:
              return 'TUE';
            case 3:
              return 'WED';
            case 4:
              return 'THU';
            case 5:
              return 'FRI';
            case 6:
              return 'SAT';
            case 7:
              return 'SUN';
          }
          return '';
        },
        //margin: 8,
      ),
      rightTitles: SideTitles(showTitles: false),
      leftTitles: SideTitles(
        showTitles: true,
        getTextStyles: (_) => style,
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '1';
            case 2:
              return '2';
            case 3:
              return '3';
            case 4:
              return '4';
            case 5:
              return '5';
            case 6:
              return '6';
            case 7:
              return '7';
            case 8:
              return '8';
            case 9:
              return '9';
            case 10:
              return '10';
          }
          return '';
        },
        //reservedSize: 40,
        //margin: 24,
      ),
    );
  }
}