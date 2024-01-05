// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as chartS;
// import 'package:firebase_database/firebase_database.dart';

// class FirebaseGraph extends StatefulWidget {
//   @override
//   _FirebaseGraphState createState() => _FirebaseGraphState();
// }

// class _FirebaseGraphState extends State<FirebaseGraph> {
//   late List<charts.Series> seriesList;
//   final DatabaseReference dbRef = FirebaseDatabase.instance.reference().child("data");

//   _generateData(snapshot) {
//     List<Data> data = [];
//     snapshot.value.forEach((key, value) {
//       Data item = Data(val: int.parse(value.toString()), cat: key);
//       data.add(item);
//     });
//     seriesList = [
//       charts.Series(
//         id: 'Data',
//         data: data,
//         domainFn: (Data sales, _) => sales.cat,
//         measureFn: (Data sales, _) => sales.val,
//         labelAccessorFn: (Data sales, _) => '${sales.cat}: ${sales.val}',
//       ),
//     ];
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     dbRef.once().then((DataSnapshot snapshot) {
//       _generateData(snapshot);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 250,
//       child: seriesList != null
//           ? charts.BarChart(
//               seriesList,
//               animate: true,
//               barGroupingType: charts.BarGroupingType.grouped,
//             )
//           : CircularProgressIndicator(),
//     );
//   }
// }

// class Data {
//   String cat;
//   int val;
//   Data({this.cat, this.val});
// }