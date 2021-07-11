import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Diseases extends StatefulWidget {
  @override
  _DiseasesState createState() => _DiseasesState();
}

class _DiseasesState extends State<Diseases> {
  String selectedvalue;
  List diseasesName = List();

  Future getAllDiseases() async {
    var url = "http://10.0.2.2/medical/diseases.php";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        diseasesName = jsonData;
      });
    }
    print(diseasesName);
  }

  Future getSympotmsByDiseases() async {
    var url = "http://10.0.2.2/medical/symptoms.php";
    var response = await http.post(url, body: {"diseases_Name": selectedvalue});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return jsonData;
    }
  }

  @override
  void initState() {
    super.initState();
    getAllDiseases();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Know Sympotms of disease",
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton(
                isExpanded: true,
                hint: Text("Select Disease"),
                value: selectedvalue,
                items: diseasesName.map((category) {
                  return DropdownMenuItem(
                    value: category['DiseasesName'],
                    child: Text(category['DiseasesName']),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedvalue = value;
                  });
                },
              ),
            ),
            //Text(selectedvalue),
            selectedvalue != null
                ? Container(
              height: 400,
              child: FutureBuilder(
                  future: getSympotmsByDiseases(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.length == 0) {
                        return Text("No Symptoms for this disease");
                      }
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            var list = snapshot.data[index];
                            return Card(
                              color: Colors.primaries[Random()
                                  .nextInt(Colors.primaries.length)],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Column(
                                    children: [
                                      Text('Disease : $selectedvalue'),
                                      Divider(
                                        endIndent: 2,
                                      ),
                                      Text(list['SymptomsName'],
                                          style: TextStyle(
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                    return Text('No Data Found!');
                  }),
            )
                : Text("Select diseases First"),
          ],
        ),
      ),
    );
  }
}