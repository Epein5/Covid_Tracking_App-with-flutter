import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/state_service.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchcontroller = TextEditingController();

  StateServices stateServices = StateServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 184, 183, 183),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 184, 183, 183),
      ),
      body: SafeArea(
          child: Column(
        children: [
          TextFormField(
            onChanged: (value) {
              setState(() {});
            },
            controller: searchcontroller,
            decoration: InputDecoration(
                hintText: "Search by name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          Expanded(
            child: FutureBuilder(
                future: stateServices.fetchCountriesRecords(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade700,
                            highlightColor: Colors.grey.shade100,
                            child: Column(
                              children: [
                                ListTile(
                                    title: Container(
                                      height: 10,
                                      width: 89,
                                      color: Colors.white,
                                    ),
                                    subtitle: Container(
                                      height: 10,
                                      width: 89,
                                      color: Colors.white,
                                    ),
                                    leading: Container(
                                      height: 10,
                                      width: 89,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                          );
                        });
                  } else {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          String existingcountry =
                              snapshot.data![index]['country'];
                          if (searchcontroller.text.isEmpty) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RouteName.detailscreen,
                                        arguments: {
                                          'name': snapshot.data![index]
                                                  ["country"]
                                              .toString(),
                                          'image': snapshot.data![index]
                                                  ["countryInfo"]["flag"]
                                              .toString(),
                                          'totalDeaths': snapshot.data![index]
                                              ["deaths"],
                                          'totalrecoverd': snapshot.data![index]
                                              ["recovered"],
                                          'active': snapshot.data![index]
                                              ["todayCases"],
                                          'critical': snapshot.data![index]
                                              ["cases"],
                                        });
                                  },
                                  child: ListTile(
                                      title: Text(
                                          snapshot.data![index]['country']),
                                      subtitle: Text(snapshot.data![index]
                                              ['cases']
                                          .toString()),
                                      leading: Image(
                                        errorBuilder:
                                            (context, error, staktrace) {
                                          return const Image(
                                              image: AssetImage(
                                                  'assets/splash.png'));
                                        },
                                        height: 50,
                                        width: 50,
                                        image: NetworkImage(
                                            snapshot.data![index]["countryInfo"]
                                                ["flag"]),
                                      )),
                                ),
                              ],
                            );
                          } else if (existingcountry
                              .toLowerCase()
                              .contains(searchcontroller.text.toLowerCase())) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RouteName.detailscreen,
                                        arguments: {
                                          'name': snapshot.data![index]
                                                  ["country"]
                                              .toString(),
                                          'image': snapshot.data![index]
                                                  ["countryInfo"]["flag"]
                                              .toString(),
                                          'totalDeaths': snapshot.data![index]
                                              ["deaths"],
                                          'totalrecoverd': snapshot.data![index]
                                              ["recovered"],
                                          'active': snapshot.data![index]
                                              ["todayCases"],
                                          'critical': snapshot.data![index]
                                              ["cases"],
                                        });
                                  },
                                  child: ListTile(
                                      title: Text(
                                          snapshot.data![index]['country']),
                                      subtitle: Text(snapshot.data![index]
                                              ['cases']
                                          .toString()),
                                      leading: Image(
                                        errorBuilder:
                                            (context, error, staktrace) {
                                          return const Image(
                                              image: AssetImage(
                                                  'assets/splash.png'));
                                        },
                                        height: 40,
                                        width: 50,
                                        image: NetworkImage(
                                            snapshot.data![index]["countryInfo"]
                                                ["flag"]),
                                      )),
                                ),
                              ],
                            );
                          } else {
                            return Container();
                          }
                        });
                  }
                }),
          )
        ],
      )),
    );
  }
}
