import 'dart:math';

/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

final random = new Random();

final data = new List<OrdinalPrice>.generate(20, (index) {
  var now = DateTime.now().add(Duration(days: index + 1));
  if (now.weekday == 6 || now.weekday == 7) {
    return null;
  }

  return OrdinalPrice(
      '${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}',
      random.nextInt(300) / 100 + 3.00);
}).where((element) => element != null).toList();

class BarChartPricing extends StatefulWidget {
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
  _BarChartPricingState createState() => _BarChartPricingState();

  // data = data.where((element) => element != null).toList();

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalPrice, String>> _createSampleData() {
    return [
      new charts.Series<OrdinalPrice, String>(
        id: 'Prices',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.brown),
        domainFn: (OrdinalPrice price, _) => price.date,
        measureFn: (OrdinalPrice price, _) => price.price,
        data: data,
      )
    ];
  }
}

class _BarChartPricingState extends State<BarChartPricing> {
  String _date;
  double _price;

  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;
    String date;
    double price;

    if (selectedDatum.isNotEmpty) {
      date = selectedDatum.first.datum.date;
      price = selectedDatum.first.datum.price;
    }

    setState(() {
      _date = date;
      _price = price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _date != null
            ? Text("$_date - ${_price.toStringAsPrecision(3)} €")
            : SizedBox(
                height: 18,
              ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 250,
          child: new charts.BarChart(widget.seriesList,
              animate: widget.animate,
              defaultInteractions: true,
              selectionModels: [
                new charts.SelectionModelConfig(
                  type: charts.SelectionModelType.info,
                  changedListener: _onSelectionChanged,
                )
              ],
              behaviors: [
                new charts.SlidingViewport(),
                new charts.PanAndZoomBehavior(),
              ],
              domainAxis: new charts.OrdinalAxisSpec(
                  viewport: new charts.OrdinalViewport(data.first.date, 5)),
              primaryMeasureAxis: new charts.NumericAxisSpec(
                  tickFormatterSpec: new charts.BasicNumericTickFormatterSpec(
                      (num value) => '$value €'))),
        ),
      ],
    );
  }
}

/// Sample ordinal data type.
class OrdinalPrice {
  final String date;
  final double price;

  OrdinalPrice(this.date, this.price);
}
