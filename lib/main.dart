import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machinetest/api/apiservice.dart';
import 'package:machinetest/bloc/product_bloc.dart';
import 'package:machinetest/bloc/product_event.dart';
import 'package:machinetest/view/productscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ProductBloc(ApiService())..add(FetchProducts()),
        child: ProductsView(),
      ),
    );
  }
}
