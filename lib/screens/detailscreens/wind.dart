import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thermometer/widgets/wind_widgets/wind_line_chart.dart';
import '../../widgets/detail_pages_widgets/detail_card_style.dart';
import '../../widgets/detail_pages_widgets/location_atfirst_row.dart';
import '../../widgets/detail_pages_widgets/maindetail_widget.dart';
import '../../provider/allweatherapi_provider.dart';


class WindPage extends StatefulWidget {
  final dynamic weahtherData;
  final String name;
  final Color color;

  const WindPage({Key? key, required this.name, required this.color, required this.weahtherData}) : super(key: key);

  @override
  State<WindPage> createState() => _WindPageState();
}

class _WindPageState extends State<WindPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AllWeatherAPiProvider>(
        builder: (BuildContext context, AllWeatherAPiProvider value, Widget? child) {
          value.MediaQueryy(context);
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DetailWidgetMain(height: value.height, name: widget.name, color: widget.color,),
                Container(
                  decoration: BoxDecoration(
                    color: widget.color,
                  ),
                  child: DetailCardStyle(
                    height: value.height,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          RowgetLocation(value: value,),
                          const SizedBox(height: 30),
                          Text(
                            '${value.wind.toStringAsFixed(01)}  km/h',
                            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: Colors.white,
                              height: MediaQuery.of(context).size.height*0.4,
                              width: MediaQuery.of(context).size.width,
                              child: const LineChartSample2(),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
