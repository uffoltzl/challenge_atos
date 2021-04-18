/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class BarChartPricing extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  BarChartPricing(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory BarChartPricing.withSampleData() {
    return new BarChartPricing(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('19/04', 5.80),
      new OrdinalSales('20/04', 6.40),
      new OrdinalSales('21/04', 5.00),
      new OrdinalSales('22/04', 4.80),
      new OrdinalSales('23/04', 6.17),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Prices',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final double sales;

  OrdinalSales(this.year, this.sales);
}
