import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleFour extends StatefulWidget {
  const ExampleFour({Key? key}) : super(key: key);

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {
  var data;

  Future<void> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {
      //data=  jsonDecode(response.body.toString());

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Fourth Example Rest Api'),
        ),
        body: Column(
          children: [
            Expanded(
                child: FutureBuilder(
              future: getUserApi(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: Text("Loading"));
                } else {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            ReuseRow(
                                title: "ID:",
                                value: data[index]['id'].toString()),
                            ReuseRow(
                                title: "Name:",
                                value: data[index]['name'].toString()),
                            ReuseRow(
                                title: "UserName:",
                                value: data[index]['username'].toString()),
                            ReuseRow(
                                title: "Email:",
                                value: data[index]['email'].toString()),
                            ReuseRow(
                                title: "City",
                                value:
                                    data[index]['address']['city'].toString()),
                            ReuseRow(
                                title: "Zipcode:",
                                value: data[index]['address']['zipcode']
                                    .toString()),
                            ReuseRow(
                                title: "Lat:",
                                value: data[index]['address']['geo']['lat']
                                    .toString()),
                            ReuseRow(
                                title: "Lng:",
                                value: data[index]['address']['geo']['lng']
                                    .toString()),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ))
          ],
        ));
  }
}

class ReuseRow extends StatelessWidget {
  final String title, value;

  const ReuseRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
