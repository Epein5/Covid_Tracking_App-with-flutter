import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/allmodel.dart';
import 'package:flutter_application_1/services/state_service.dart';
import 'package:flutter_application_1/utils/components.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatePage extends StatefulWidget {
  const WorldStatePage({super.key});

  @override
  State<WorldStatePage> createState() => _WorldStatePageState();
}

class _WorldStatePageState extends State<WorldStatePage>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 2), vsync: this)
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
                    future: stateServices.fetchWorldRecords(),
                    builder: (context, AsyncSnapshot<all> snapshot) {
                      if (!snapshot.hasData) {
                        return AnimatedBuilder(
                          animation: _controller,
                          child: Center(
                            child: Container(
                                height: 200,
                                width: 200,
                                child: Image.asset('assets/splash.png')),
                          ),
                          builder: (BuildContext context, Widget? child) {
                            return Transform.scale(
                              scale: _controller.value * 1.5 * pi,
                              child: child,
                            );
                          },
                        );
                      } else {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              PieChart(
                                dataMap: {
                                  "Total": double.parse(
                                      snapshot.data!.cases.toString()),
                                  "Recovered": double.parse(
                                      snapshot.data!.recovered.toString()),
                                  "Deaths": double.parse(
                                      snapshot.data!.deaths.toString()),
                                },
                                animationDuration: const Duration(seconds: 1),
                                chartType: ChartType.ring,
                                chartRadius:
                                    MediaQuery.of(context).size.width / 3.5,
                                legendOptions: const LegendOptions(
                                    legendPosition: LegendPosition.left),
                                chartValuesOptions: const ChartValuesOptions(
                                    showChartValueBackground: false,
                                    showChartValuesInPercentage: true),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.05),
                                child: Card(
                                  child: Column(
                                    children: [
                                      ResuableRow(
                                          title: "Total Cases",
                                          value:
                                              snapshot.data!.cases.toString()),
                                      ResuableRow(
                                          title: "Recoverd Cases",
                                          value: snapshot.data!.recovered
                                              .toString()),
                                      ResuableRow(
                                          title: "Margaya mdarchot",
                                          value:
                                              snapshot.data!.deaths.toString()),
                                      ResuableRow(
                                          title: "Affected Countries",
                                          value: snapshot
                                              .data!.affectedCountries
                                              .toString()),
                                      ResuableRow(
                                          title: "Today Cases",
                                          value: snapshot.data!.todayCases
                                              .toString())
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteName.countryscreen);
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(child: Text("Track Countries")),
                                ),
                              )
                            ],
                          ),
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
