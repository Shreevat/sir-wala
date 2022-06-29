import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api/models/apiModel.dart';
import 'package:flutter_api/services/network_helper.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var posts;

  var isLoading = false;

  @override
  void initState() {
    getAPIData();
    // TODO: implement initState
    super.initState();
  }

  getAPIData() async {
    posts = await NetworkHelper().getAPIResponse();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: posts != null
            ? ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(posts[index].title),
                    subtitle: Text(posts[index].body),
                  );
                })
            : Center(child: CircularProgressIndicator()));
  }
}
