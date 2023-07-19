import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/components.dart';

class DetailScreen extends StatefulWidget {

  dynamic data;
  DetailScreen({Key? key,  required this.data,
}  // }
  );

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(widget.data['image']),
          ),
          Card(
            child: Column(
              children: [
                ResuableRow(title: "Name", value: widget.data["name"]),
                ResuableRow(
                    title: "Recoverd Cases",
                    value: widget.data["totalrecoverd"].toString()),
                ResuableRow(
                    title: "Margaya mdarchot",
                    value: widget.data["totalDeaths"].toString()),
                ResuableRow(title: "Active", value: widget.data["active"].toString()),
                ResuableRow(
                    title: "Criticals", value: widget.data["critical"].toString())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
