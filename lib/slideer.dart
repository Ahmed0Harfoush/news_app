// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/cupertino.dart';
// import 'package:sports_news/pageTow.dart';
//
// class SliderPage extends StatefulWidget {
//   const SliderPage({super.key});
//
//   @override
//   State<SliderPage> createState() => _SliderPageState();
// }
//
// class _SliderPageState extends State<SliderPage> {
//   ValueNotifier<int> dotsIndex = ValueNotifier(0);
//
//   late Map<String, dynamic> data;
//   late List<dynamic> news;
//   late Future<void> x;
//
//   Future<void> getNews() async {
//     http.Response response = await http.get(Uri.parse('https://newsapi.org/v2/everything?q=tesla&from=2024-07-29&sortBy=publishedAt&apiKey=e6b98642439f44a48764fe3e3cacf782'));
//
//     // origenal
//
//     // main => https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=e6b98642439f44a48764fe3e3cacf782
//     // https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e6b98642439f44a48764fe3e3cacf782
//     // https://newsapi.org/v2/everything?q=tesla&from=2024-07-26&sortBy=publishedAt&apiKey=e6b98642439f44a48764fe3e3cacf782
//     // https://newsapi.org/v2/everything?q=apple&from=2024-08-25&to=2024-08-25&sortBy=popularity&apiKey=e6b98642439f44a48764fe3e3cacf782
//     // https://newsapi.org/v2/everything?domains=wsj.com&apiKey=e6b98642439f44a48764fe3e3cacf782
//     // https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=API_KEY
//     // https://newsapi.org/v2/everything?q=tesla&from=2024-07-29&sortBy=publishedAt&apiKey=e6b98642439f44a48764fe3e3cacf782
//
//     // sport:
//
//     // https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=e6b98642439f44a48764fe3e3cacf782        egypt
//     // https://newsapi.org/v2/top-headlines?country=gb&category=sports&apiKey=e6b98642439f44a48764fe3e3cacf782        english
//
//     data = jsonDecode(response.body);
//
//     setState((){
//       news = data['articles'];
//     });
//   }
//
//   // @override
//   // void initState(){
//   //   super.initState();
//   //   x = getNews();
//   // }
//
//
//  // ----------------------------
//
//   // sport
//   late Map<String, dynamic> sportdata;
//   late List<dynamic> sportnews;
//   late Future<void> y;
//
//   Future<void> getsportNews() async {
//     http.Response sportresponses = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=gb&category=sports&apiKey=e6b98642439f44a48764fe3e3cacf782'));
//     sportdata = jsonDecode(sportresponses.body);
//
//     setState(() {
//       sportnews = sportdata['articles'];
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     x = getNews();
//     y = getsportNews();
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           const SizedBox(height: 10),
//           Padding(              //    First card scroll
//             padding: const EdgeInsets.all(8.0),
//             child: SizedBox(
//               height: 240,
//               child: PageView.builder(
//                 itemCount: 6,
//                 onPageChanged: (index) {
//                   dotsIndex.value = index;
//                 },
//                 itemBuilder: (context, i) {
//                   return InkWell(
//                     onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context){
//                       return Pagetow(news[i]['urlToImage'],news[i]['title'],news[i]['publishedAt'], news[i]['description'], news[i]['source']['name']);
//                     })),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         height: 200,
//                         width: MediaQuery.of(context).size.width * 0.94,
//                         decoration: BoxDecoration(
//                           color: Colors.grey[300], // Background color
//                           borderRadius: BorderRadius.circular(20), // Border radius
//                           image: DecorationImage(
//                             image: NetworkImage(news[i]['urlToImage']),
//                             fit: BoxFit.fill, // Image fit
//                           ),
//                         ),
//                         child: Stack(
//                           children: <Widget>[
//                             Container(
//                               width: MediaQuery.of(context).size.width * 0.94,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                                 gradient: LinearGradient(
//                                   end: Alignment.topCenter,
//                                   begin: Alignment.bottomCenter,
//                                   colors: [
//                                     Colors.black.withOpacity(0.3),
//                                     Colors.grey[700]!.withOpacity(0.1),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: <Widget>[
//                                 Container(
//                                   width: double.infinity,
//                                   height: 100,
//                                   decoration: const BoxDecoration(
//                                     borderRadius: BorderRadius.only(
//                                       bottomLeft: Radius.circular(8),
//                                       bottomRight: Radius.circular(8),
//                                     ),
//                                     gradient: LinearGradient(
//                                       colors: [
//                                         Colors.black,
//                                         Colors.black38,
//                                       ],
//                                     ),
//                                   ),
//                                   child: Column(
//                                     children: <Widget>[
//                                       Padding(
//                                         padding: EdgeInsets.all(8.0),
//                                         child: Text(
//                                           news[i]['title'],
//                                           maxLines: 3,
//                                           style: TextStyle(
//                                             fontFamily: "system-ui",
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ),
//
//                                       Row(
//                                         children: <Widget>[
//                                           const Icon(
//                                             Icons.access_time,
//                                             color: Colors.blueGrey,
//                                           ),
//                                           const SizedBox(width: 4),
//                                           Text(
//                                             news[i]['publishedAt'],
//                                             style: TextStyle(
//                                               fontFamily: "system-ui",
//                                               fontSize: 15,
//                                               fontWeight: FontWeight.w600,
//                                               color: Colors.grey[100],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(14.0),
//                               child: Container(
//                                 height: 30,
//                                 width: 80,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   gradient: const LinearGradient(
//                                     colors: [
//                                       Colors.deepPurple,
//                                       Colors.deepPurple,
//                                     ],
//                                   ),
//                                 ),
//                                 child:  Center(
//                                   child: Text(
//                                     news[i]['source']['name'],
//                                     maxLines: 1,
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//
//               ),
//             ),
//           ),
//           ValueListenableBuilder(
//             valueListenable: dotsIndex,
//             builder: (context, value, _) {
//               return slider(value);
//             },
//           ),
//           SizedBox(height: 10,),
//
//           // Popular news
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
//                 child: Text("Popular News",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               IconButton(onPressed: () => print("press button"),
//                   icon: Icon(Icons.arrow_forward_ios,
//                     color: Colors.black,
//                     size: 18,
//                   )
//               )
//             ],
//           ),
//           SizedBox(
//             height: 550,
//             width: MediaQuery.of(context).size.width*0.98,
//             child: ListView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: 3,
//                 itemBuilder: (context, i){
//                   return SizedBox(
//                     height: 175,
//                     width: double.infinity,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.vertical(top: Radius.circular(30), bottom: Radius.circular(30)),
//                       child: Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: Card(
//                           elevation: 4,
//                           color: Colors.white,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Row(
//                                 children: [
//                                   SizedBox(
//                                     height: 155,
//                                     width: MediaQuery.of(context).size.width*0.69,
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       children: <Widget>[
//                                         Padding(
//                                           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//                                           child: Text(news[i]['title'],
//                                             maxLines: 3,
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.w400,
//                                               fontSize: 17,
//                                               letterSpacing: 1,
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.symmetric(horizontal: 8,),
//                                           child: Container(
//                                             width: 120,
//                                             height: 20,
//                                             decoration: BoxDecoration(
//                                               borderRadius: BorderRadius.circular(20),
//                                               color: Colors.grey[700],
//                                             ),
//                                             child: Center(
//                                               child: Text(news[i]['source']['name'],
//                                                 style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 14,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(height: 8,),
//                                         Padding(
//                                           padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
//                                             child: Row(
//                                               children: <Widget>[
//                                                 Icon(Icons.access_time, size: 18,),
//                                                 SizedBox(width: 4,),
//                                                 Center(
//                                                   child: Text(news[i]['publishedAt'],
//                                                     style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontSize: 14,
//                                                       fontWeight: FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(width: 1,),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
//                                     child: Container(
//                                       height: 100,
//                                       width: MediaQuery.of(context).size.width*0.20,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(15),
//                                         gradient: LinearGradient(
//                                           colors: [
//                                             Colors.grey[400]!,
//                                               Colors.grey[400]!,
//                                           ]
//                                         ),
//                                           image: DecorationImage(
//                                             image: NetworkImage(
//                                               news[i]['urlToImage']
//                                             ), fit: BoxFit.fill,
//                                           )
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }
//             ),
//           ),
//
//           //  more news
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
//                 child: Text("More News",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               IconButton(onPressed: () => print("press button"),
//                   icon: Icon(Icons.arrow_forward_ios,
//                     color: Colors.black,
//                     size: 18,
//                   )
//               )
//             ],
//           ),
//           SizedBox(
//             height: 1104,
//             width: MediaQuery.of(context).size.width*0.98,
//             child: ListView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: 6,
//                 itemBuilder: (context, i){
//                   return InkWell(
//                     onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context){
//                       return Pagetow(news[i+7]['urlToImage'],news[i+7]['title'],news[i+7]['publishedAt'], news[i+7]['description'], news[i+7]['source']['name']);
//                     })),
//                     child: SizedBox(
//                       height: 175,
//                       width: double.infinity,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.vertical(top: Radius.circular(30), bottom: Radius.circular(30)),
//                         child: Padding(
//                           padding: const EdgeInsets.all(3.0),
//                           child: Card(
//                             elevation: 4,
//                             color: Colors.white,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Row(
//                                   children: [
//                                     SizedBox(
//                                       height: 155,
//                                       width: MediaQuery.of(context).size.width*0.69,
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: <Widget>[
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//                                             child: Text(news[i+7]['title'],
//                                               maxLines: 3,
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.w400,
//                                                 fontSize: 17,
//                                                 letterSpacing: 1,
//                                                 color: Colors.black,
//                                               ),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(horizontal: 8,),
//                                             child: Container(
//                                               width: 120,
//                                               height: 20,
//                                               decoration: BoxDecoration(
//                                                 borderRadius: BorderRadius.circular(20),
//                                                 color: Colors.grey[700],
//                                               ),
//                                               child: Center(
//                                                 child: Text(news[i+7]['source']['name'],
//                                                   style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(height: 8,),
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
//                                             child: Row(
//                                               children: <Widget>[
//                                                 Icon(Icons.access_time, size: 18,),
//                                                 SizedBox(width: 4,),
//                                                 Center(
//                                                   child: Text(news[i+7]['publishedAt'],
//                                                     style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontSize: 14,
//                                                       fontWeight: FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(width: 1,),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
//                                       child: Container(
//                                         height: 100,
//                                         width: MediaQuery.of(context).size.width*0.20,
//                                         decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(15),
//                                             gradient: LinearGradient(
//                                                 colors: [
//                                                   Colors.grey[400]!,
//                                                   Colors.grey[400]!,
//                                                 ]
//                                             ),
//                                             image: DecorationImage(
//                                               image:
//                                               NetworkImage(news[i+7]['urlToImage']),
//                                               fit: BoxFit.fill,
//                                             )
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }
//             ),
//           ),
//
//           //  sports news
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
//                 child: Text("Sports News",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               IconButton(onPressed: () => print("press button"),
//                   icon: Icon(Icons.arrow_forward_ios,
//                     color: Colors.black,
//                     size: 18,
//                   )
//               )
//             ],
//           ),
//           SizedBox(
//             height: 550,
//             width: MediaQuery.of(context).size.width*0.98,
//             child: ListView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: 3,
//                 itemBuilder: (context, i){
//                   return InkWell(
//                     onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context){
//                       return Pagetow(sportnews[i]['urlToImage'],sportnews[i]['title'],sportnews[i]['publishedAt'], sportnews[i]['description'], sportnews[i]['source']['name']);
//                     })),
//                     child: SizedBox(
//                       height: 175,
//                       width: double.infinity,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.vertical(top: Radius.circular(30), bottom: Radius.circular(30)),
//                         child: Padding(
//                           padding: const EdgeInsets.all(3.0),
//                           child: Card(
//                             elevation: 4,
//                             color: Colors.white,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Row(
//                                   children: [
//                                     SizedBox(
//                                       height: 155,
//                                       width: MediaQuery.of(context).size.width*0.69,
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: <Widget>[
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//                                             child: Text(sportnews[i]['title'],
//                                               maxLines: 3,
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.w400,
//                                                 fontSize: 17,
//                                                 letterSpacing: 1,
//                                                 color: Colors.black,
//                                               ),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(horizontal: 8,),
//                                             child: Container(
//                                               width: 120,
//                                               height: 20,
//                                               decoration: BoxDecoration(
//                                                 borderRadius: BorderRadius.circular(20),
//                                                 color: Colors.grey[700],
//                                               ),
//                                               child: Center(
//                                                 child: Text(sportnews[i]['source']['name'],
//                                                   style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(height: 8,),
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
//                                             child: Row(
//                                               children: <Widget>[
//                                                 Icon(Icons.access_time, size: 18,),
//                                                 SizedBox(width: 4,),
//                                                 Center(
//                                                   child: Text(sportnews[i]['publishedAt'],
//                                                     style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontSize: 14,
//                                                       fontWeight: FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(width: 1,),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
//                                       child: Container(
//                                         height: 100,
//                                         width: MediaQuery.of(context).size.width*0.20,
//                                         decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(15),
//                                             gradient: LinearGradient(
//                                                 colors: [
//                                                   Colors.grey[400]!,
//                                                   Colors.grey[400]!,
//                                                 ]
//                                             ),
//                                             image: DecorationImage(
//                                               image:
//                                               NetworkImage(sportnews[i]['urlToImage']),
//                                               fit: BoxFit.fill,
//                                             )
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }
//             ),
//           ),
//
//           SizedBox(height: 30,),
//         ],
//       ),
//     );
//   }
// }
//
// Widget slider(int value) => Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: <Widget>[
//     for (int i = 0; i < 6; i++)
//       AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         margin: const EdgeInsets.symmetric(horizontal: 3),
//         width: i == value ? 30 : 8,
//         height: i == value ? 8 : 8,
//         decoration: BoxDecoration(
//           borderRadius: i == value ? BorderRadius.circular(20) : BorderRadius.circular(50),
//           color: i == value ? Colors.grey[800] : Colors.grey[500],
//         ),
//       ),
//   ],
// );




























// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/cupertino.dart';
// import 'package:sports_news/pageTow.dart';
//
// class SliderPage extends StatefulWidget {
//   const SliderPage({super.key});
//
//   @override
//   State<SliderPage> createState() => _SliderPageState();
// }
//
// class _SliderPageState extends State<SliderPage> {
//   ValueNotifier<int> dotsIndex = ValueNotifier(0);
//
//   late Map<String, dynamic> data;
//   late List<dynamic> news;
//   late Future<void> x;
//
//   Future<void> getNews() async {
//     http.Response response = await http.get(Uri.parse('https://newsapi.org/v2/everything?q=tesla&from=2024-07-25&sortBy=publishedAt&apiKey=e6b98642439f44a48764fe3e3cacf782'));
//
//     data = jsonDecode(response.body);
//
//     setState((){
//       news = data['articles'];
//     });
//   }
//
//   @override
//   void initState(){
//     super.initState();
//     x = getNews();
//   }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           const SizedBox(height: 10),
//           Padding(              //    First card scroll
//             padding: const EdgeInsets.all(8.0),
//             child: SizedBox(
//               height: 240,
//               child: PageView.builder(
//                 itemCount: 4,
//                 onPageChanged: (index) {
//                   dotsIndex.value = index;
//                 },
//                 itemBuilder: (context, i) {
//                   return InkWell(
//                     onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context){
//                       return Pagetow();
//                     })),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         height: 200,
//                         width: MediaQuery.of(context).size.width * 0.94,
//                         decoration: BoxDecoration(
//                           color: Colors.grey[300],
//                           borderRadius: BorderRadius.circular(20),
//                           image: const DecorationImage(
//                             image: AssetImage("images/mosalah.png"),
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         child: Stack(
//                           children: <Widget>[
//                             Container(
//                               width: MediaQuery.of(context).size.width * 0.94,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                                 gradient: LinearGradient(
//                                   end: Alignment.topCenter,
//                                   begin: Alignment.bottomCenter,
//                                   colors: [
//                                     Colors.black.withOpacity(0.3),
//                                     Colors.grey[700]!.withOpacity(0.1),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: <Widget>[
//                                 Container(
//                                   width: double.infinity,
//                                   height: 100,
//                                   decoration: const BoxDecoration(
//                                     borderRadius: BorderRadius.only(
//                                       bottomLeft: Radius.circular(8),
//                                       bottomRight: Radius.circular(8),
//                                     ),
//                                     gradient: LinearGradient(
//                                       colors: [
//                                         Colors.black12,
//                                         Colors.black12,
//                                       ],
//                                     ),
//                                   ),
//                                   child: Column(
//                                     children: <Widget>[
//                                       const Padding(
//                                         padding: EdgeInsets.all(8.0),
//                                         child: Text(
//                                           "Mohamed Salah becomes the Premier League's all-time top scorer on opening day.",
//                                           style: TextStyle(
//                                             fontFamily: "system-ui",
//                                             fontSize: 17,
//                                             fontWeight: FontWeight.w500,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ),
//                                       Row(
//                                         children: <Widget>[
//                                           const Icon(
//                                             Icons.access_time,
//                                             color: Colors.blueGrey,
//                                           ),
//                                           const SizedBox(width: 4),
//                                           Text(
//                                             " Saturday 17 Aug 2024",
//                                             style: TextStyle(
//                                               fontFamily: "system-ui",
//                                               fontSize: 15,
//                                               fontWeight: FontWeight.w600,
//                                               color: Colors.grey[100],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(14.0),
//                               child: Container(
//                                 height: 30,
//                                 width: 80,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   gradient: const LinearGradient(
//                                     colors: [
//                                       Colors.deepPurple,
//                                       Colors.deepPurple,
//                                     ],
//                                   ),
//                                 ),
//                                 child: const Center(
//                                   child: Text(
//                                     "API",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//
//               ),
//             ),
//           ),
//           ValueListenableBuilder(
//             valueListenable: dotsIndex,
//             builder: (context, value, _) {
//               return slider(value);
//             },
//           ),
//           SizedBox(height: 10,),
//
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
//                 child: Text("Popular News",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               IconButton(onPressed: () => print("press button"),
//                   icon: Icon(Icons.arrow_forward_ios,
//                     color: Colors.black,
//                     size: 18,
//                   )
//               )
//             ],
//           ),
//           SizedBox(
//             height: 550,
//             width: MediaQuery.of(context).size.width*0.98,
//             child: ListView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: 3,
//                 itemBuilder: (context, i){
//                   return SizedBox(
//                     height: 175,
//                     width: double.infinity,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.vertical(top: Radius.circular(30), bottom: Radius.circular(30)),
//                       child: Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: Card(
//                           elevation: 4,
//                           color: Colors.white,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Row(
//                                 children: [
//                                   SizedBox(
//                                     height: 155,
//                                     width: MediaQuery.of(context).size.width*0.69,
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       children: <Widget>[
//                                         Padding(
//                                           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//                                           child: Text("Coming Title From Api Coming Title From Api Coming Title From Api",
//                                             maxLines: 3,
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.w400,
//                                               fontSize: 17,
//                                               letterSpacing: 1,
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.symmetric(horizontal: 8,),
//                                           child: Container(
//                                             width: 120,
//                                             height: 20,
//                                             decoration: BoxDecoration(
//                                               borderRadius: BorderRadius.circular(20),
//                                               color: Colors.grey[700],
//                                             ),
//                                             child: Center(
//                                               child: Text("sport",
//                                                 style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 14,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(height: 8,),
//                                         Padding(
//                                           padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
//                                           child: Row(
//                                             children: <Widget>[
//                                               Icon(Icons.access_time, size: 18,),
//                                               SizedBox(width: 4,),
//                                               Center(
//                                                 child: Text("20/8/2024",
//                                                   style: TextStyle(
//                                                     color: Colors.black,
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(width: 1,),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
//                                     child: Container(
//                                       height: 100,
//                                       width: MediaQuery.of(context).size.width*0.20,
//                                       decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(15),
//                                           gradient: LinearGradient(
//                                               colors: [
//                                                 Colors.grey[400]!,
//                                                 Colors.grey[400]!,
//                                               ]
//                                           ),
//                                           image: DecorationImage(
//                                             image: AssetImage('images/images (10).jpeg'), fit: BoxFit.fill,
//                                           )
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
//                 child: Text("Sports News",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               IconButton(onPressed: () => print("press button"),
//                   icon: Icon(Icons.arrow_forward_ios,
//                     color: Colors.black,
//                     size: 18,
//                   )
//               )
//             ],
//           ),
//           SizedBox(
//             height: 550,
//             width: MediaQuery.of(context).size.width*0.98,
//             child: ListView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: 3,
//                 itemBuilder: (context, i){
//                   return SizedBox(
//                     height: 175,
//                     width: double.infinity,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.vertical(top: Radius.circular(30), bottom: Radius.circular(30)),
//                       child: Padding(
//                         padding: const EdgeInsets.all(3.0),
//                         child: Card(
//                           elevation: 4,
//                           color: Colors.white,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Row(
//                                 children: [
//                                   SizedBox(
//                                     height: 155,
//                                     width: MediaQuery.of(context).size.width*0.69,
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       children: <Widget>[
//                                         Padding(
//                                           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//                                           child: Text("Coming Title From Api Coming Title From Api Coming Title From Api",
//                                             maxLines: 3,
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.w400,
//                                               fontSize: 17,
//                                               letterSpacing: 1,
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.symmetric(horizontal: 8,),
//                                           child: Container(
//                                             width: 120,
//                                             height: 20,
//                                             decoration: BoxDecoration(
//                                               borderRadius: BorderRadius.circular(20),
//                                               color: Colors.grey[700],
//                                             ),
//                                             child: Center(
//                                               child: Text("sport",
//                                                 style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 14,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(height: 8,),
//                                         Padding(
//                                           padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
//                                           child: Row(
//                                             children: <Widget>[
//                                               Icon(Icons.access_time, size: 18,),
//                                               SizedBox(width: 4,),
//                                               Center(
//                                                 child: Text("20/8/2024",
//                                                   style: TextStyle(
//                                                     color: Colors.black,
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(width: 1,),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
//                                     child: Container(
//                                       height: 100,
//                                       width: MediaQuery.of(context).size.width*0.20,
//                                       decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(15),
//                                           gradient: LinearGradient(
//                                               colors: [
//                                                 Colors.grey[400]!,
//                                                 Colors.grey[400]!,
//                                               ]
//                                           ),
//                                           image: DecorationImage(
//                                             image: AssetImage('images/AlAhlymercto.png'), fit: BoxFit.fill,
//                                           )
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }
//             ),
//           ),
//           SizedBox(height: 30,),
//         ],
//       ),
//     );
//   }
// }
//
// Widget slider(int value) => Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: <Widget>[
//     for (int i = 0; i < 4; i++)
//       AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         margin: const EdgeInsets.symmetric(horizontal: 3),
//         width: i == value ? 30 : 8,
//         height: i == value ? 8 : 8,
//         decoration: BoxDecoration(
//           borderRadius: i == value ? BorderRadius.circular(20) : BorderRadius.circular(50),
//           color: i == value ? Colors.grey[800] : Colors.grey[500],
//         ),
//       ),
//   ],
// );






































// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class SliderPage extends StatefulWidget {
//   const SliderPage({super.key});
//
//   @override
//   State<SliderPage> createState() => _SliderPageState();
// }
//
// class _SliderPageState extends State<SliderPage> {
//   ValueNotifier<int> dotsIndex = ValueNotifier(0);
//   List<dynamic> popularNews = [];
//   List<dynamic> sportsNews = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchNews();
//   }
//
//   Future<void> fetchNews() async {
//     final popularNewsResponse = await http.get(Uri.parse('https://api.example.com/popular-news'));
//     final sportsNewsResponse = await http.get(Uri.parse('https://api.example.com/sports-news'));
//
//     if (popularNewsResponse.statusCode == 200 && sportsNewsResponse.statusCode == 200) {
//       setState(() {
//         popularNews = json.decode(popularNewsResponse.body);
//         sportsNews = json.decode(sportsNewsResponse.body);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           const SizedBox(height: 10),
//           _buildPageView(),
//           ValueListenableBuilder(
//             valueListenable: dotsIndex,
//             builder: (context, value, _) {
//               return _buildSliderIndicator(value);
//             },
//           ),
//           const SizedBox(height: 10),
//           _buildSectionHeader("Popular News"),
//           _buildNewsList(popularNews),
//           _buildSectionHeader("Sports News"),
//           _buildNewsList(sportsNews),
//           const SizedBox(height: 30),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildPageView() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SizedBox(
//         height: 240,
//         child: PageView.builder(
//           itemCount: 4,
//           onPageChanged: (index) {
//             dotsIndex.value = index;
//           },
//           itemBuilder: (context, i) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 height: 200,
//                 width: MediaQuery.of(context).size.width * 0.94,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(20),
//                   image: const DecorationImage(
//                     image: AssetImage("images/mosalah.png"),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 child: Stack(
//                   children: <Widget>[
//                     Container(
//                       width: MediaQuery.of(context).size.width * 0.94,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         gradient: LinearGradient(
//                           end: Alignment.topCenter,
//                           begin: Alignment.bottomCenter,
//                           colors: [
//                             Colors.black.withOpacity(0.3),
//                             Colors.grey[700]!.withOpacity(0.1),
//                           ],
//                         ),
//                       ),
//                     ),
//                     _buildPageViewContent(),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPageViewContent() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: <Widget>[
//         Container(
//           width: double.infinity,
//           height: 100,
//           decoration: const BoxDecoration(
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(8),
//               bottomRight: Radius.circular(8),
//             ),
//             gradient: LinearGradient(
//               colors: [
//                 Colors.black12,
//                 Colors.black12,
//               ],
//             ),
//           ),
//           child: Column(
//             children: <Widget>[
//               const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text(
//                   "Mohamed Salah becomes the Premier League's all-time top scorer on opening day.",
//                   style: TextStyle(
//                     fontFamily: "system-ui",
//                     fontSize: 17,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               Row(
//                 children: <Widget>[
//                   const Icon(
//                     Icons.access_time,
//                     color: Colors.blueGrey,
//                   ),
//                   const SizedBox(width: 4),
//                   Text(
//                     " Saturday 17 Aug 2024",
//                     style: TextStyle(
//                       fontFamily: "system-ui",
//                       fontSize: 15,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.grey[100],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(14.0),
//           child: Container(
//             height: 30,
//             width: 80,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               gradient: const LinearGradient(
//                 colors: [
//                   Colors.deepPurple,
//                   Colors.deepPurple,
//                 ],
//               ),
//             ),
//             child: const Center(
//               child: Text(
//                 "API",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 12,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildSliderIndicator(int value) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         for (int i = 0; i < 4; i++)
//           AnimatedContainer(
//             duration: const Duration(milliseconds: 300),
//             margin: const EdgeInsets.symmetric(horizontal: 3),
//             width: i == value ? 30 : 8,
//             height: i == value ? 8 : 8,
//             decoration: BoxDecoration(
//               borderRadius: i == value ? BorderRadius.circular(20) : BorderRadius.circular(50),
//               color: i == value ? Colors.grey[800] : Colors.grey[500],
//             ),
//           ),
//       ],
//     );
//   }
//
//   Widget _buildSectionHeader(String title) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
//           child: Text(
//             title,
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//             ),
//           ),
//         ),
//         IconButton(
//           onPressed: () => print("press button"),
//           icon: const Icon(
//             Icons.arrow_forward_ios,
//             color: Colors.black,
//             size: 18,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildNewsList(List<dynamic> newsList) {
//     return SizedBox(
//       height: 340,
//       width: MediaQuery.of(context).size.width * 0.95,
//       child: ListView.builder(
//         physics: const NeverScrollableScrollPhysics(),
//         itemCount: newsList.length,
//         itemBuilder: (context, i) {
//           final newsItem = newsList[i];
//           return SizedBox(
//             height: 175,
//             width: double.infinity,
//             child: ClipRRect(
//               borderRadius: BorderRadius.vertical(top: Radius.circular(30), bottom: Radius.circular(30)),
//               child: Padding(
//                 padding: const EdgeInsets.all(3.0),
//                 child: Card(
//                   elevation: 4,
//                   color: Colors.white,
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         height: 155,
//                         width: MediaQuery.of(context).size.width * 0.69,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: <Widget>[
//                             Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//                               child: Text(
//                                 newsItem['title'] ?? "No Title",
//                                 maxLines: 3,
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 17,
//                                   letterSpacing: 1,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 8),
//                               child: Container(
//                                 width: 120,
//                                 height: 20,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: Colors.grey[700],
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     newsItem['category'] ?? "Category",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 2),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
//                               child: Row(
//                                 children: <Widget>[
//                                   const Icon(Icons.access_time, size: 18),
//                                   const SizedBox(width: 4),
//                                   Text(
//                                     newsItem['date'] ?? "Date",
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(width: 1),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
//                         child: Container(
//                           height: 100,
//                           width: MediaQuery.of(context).size.width * 0.20,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             gradient: LinearGradient(
//                               colors: [
//                                 Colors.grey[400]!,
//                                 Colors.grey[400]!,
//                               ],
//                             ),
//                             image: DecorationImage(
//                               image: AssetImage(newsItem['image'] ?? 'images/default.jpg'),
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }












































// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/cupertino.dart';
// import 'package:sports_news/pageTow.dart';
//
// class SliderPage extends StatefulWidget {
//   const SliderPage({super.key});
//
//   @override
//   State<SliderPage> createState() => _SliderPageState();
// }
//
// class _SliderPageState extends State<SliderPage> {
//   ValueNotifier<int> dotsIndex = ValueNotifier(0);
//
//   late Map<String, dynamic> data;
//   late List<dynamic> news;
//   late Future<void> x;
//
//   Future<void> getNews() async {
//     http.Response response = await http.get(Uri.parse('https://newsapi.org/v2/everything?q=tesla&from=2024-07-26&sortBy=publishedAt&apiKey=e6b98642439f44a48764fe3e3cacf782'));
//     data = jsonDecode(response.body);
//
//     setState(() {
//       news = data['articles'];
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     x = getNews();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           const SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SizedBox(
//               height: 240,
//               child: PageView.builder(
//                 itemCount: 4,
//                 onPageChanged: (index) {
//                   dotsIndex.value = index;
//                 },
//                 itemBuilder: (context, i) {
//                   return InkWell(
//                     onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
//                       return Pagetow(news[i]['urlToImage'], news[i]['title'], news[i]['publishedAt'], news[i]['description'], news[i]['source']['name']);
//                     })),
//                     child: _buildSliderCard(
//                       news[i]['urlToImage'],
//                       news[i]['title'],
//                       news[i]['publishedAt'],
//                       news[i]['source']['name'],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           ValueListenableBuilder(
//             valueListenable: dotsIndex,
//             builder: (context, value, _) {
//               return slider(value);
//             },
//           ),
//           const SizedBox(height: 10),
//           _buildNewsSection("Popular News", 3),
//           _buildNewsSection("Sports News", 3),
//           const SizedBox(height: 30),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSliderCard(String imageUrl, String title, String publishedAt, String sourceName) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: 200,
//         width: MediaQuery.of(context).size.width * 0.94,
//         decoration: BoxDecoration(
//           color: Colors.grey[300],
//           borderRadius: BorderRadius.circular(20),
//           image: DecorationImage(
//             image: NetworkImage(imageUrl),
//             fit: BoxFit.fill,
//           ),
//         ),
//         child: Stack(
//           children: <Widget>[
//             Container(
//               width: MediaQuery.of(context).size.width * 0.94,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 gradient: LinearGradient(
//                   end: Alignment.topCenter,
//                   begin: Alignment.bottomCenter,
//                   colors: [
//                     Colors.black.withOpacity(0.3),
//                     Colors.grey[700]!.withOpacity(0.1),
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 8,
//               left: 8,
//               child: _buildSourceBadge(sourceName),
//             ),
//             _buildCardBottomContent(title, publishedAt),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCardBottomContent(String title, String publishedAt) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: <Widget>[
//         Container(
//           width: double.infinity,
//           height: 100,
//           decoration: const BoxDecoration(
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(8),
//               bottomRight: Radius.circular(8),
//             ),
//             gradient: LinearGradient(
//               colors: [
//                 Colors.black,
//                 Colors.black38,
//               ],
//             ),
//           ),
//           child: Column(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   title,
//                   maxLines: 3,
//                   style: const TextStyle(
//                     fontFamily: "system-ui",
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               Row(
//                 children: <Widget>[
//                   const Icon(
//                     Icons.access_time,
//                     color: Colors.blueGrey,
//                   ),
//                   const SizedBox(width: 4),
//                   Text(
//                     publishedAt,
//                     style: const TextStyle(
//                       fontFamily: "system-ui",
//                       fontSize: 15,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildSourceBadge(String sourceName) {
//     return Padding(
//       padding: const EdgeInsets.all(14.0),
//       child: Container(
//         height: 30,
//         width: 80,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           gradient: const LinearGradient(
//             colors: [
//               Colors.deepPurple,
//               Colors.deepPurple,
//             ],
//           ),
//         ),
//         child: Center(
//           child: Text(
//             sourceName,
//             maxLines: 1,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 11,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNewsSection(String title, int itemCount) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
//               child: Text(
//                 title,
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//             IconButton(
//               onPressed: () => print("press button"),
//               icon: const Icon(
//                 Icons.arrow_forward_ios,
//                 color: Colors.black,
//                 size: 18,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 550,
//           width: MediaQuery.of(context).size.width * 0.98,
//           child: ListView.builder(
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: itemCount,
//             itemBuilder: (context, i) {
//               return SizedBox(
//                 height: 175,
//                 width: double.infinity,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(30), bottom: Radius.circular(30)),
//                   child: Padding(
//                     padding: const EdgeInsets.all(3.0),
//                     child: Card(
//                       elevation: 4,
//                       color: Colors.white,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Row(
//                             children: [
//                               SizedBox(
//                                 height: 155,
//                                 width: MediaQuery.of(context).size.width * 0.69,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: <Widget>[
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//                                       child: Text(
//                                         "",
//                                         //news[i][title],
//                                         maxLines: 3,
//                                         style: const TextStyle(
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 15,
//                                           letterSpacing: 1,
//                                           color: Colors.black,
//                                         ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(horizontal: 8),
//                                       child: Container(
//                                         width: 120,
//                                         height: 20,
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(20),
//                                           color: Colors.grey[700],
//                                         ),
//                                         child:  Center(
//                                           child: Text(
//                                             news[i]["source"]["name"],
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(height: 8),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
//                                       child: Row(
//                                         children:  <Widget>[
//                                           Icon(Icons.access_time, size: 18),
//                                           SizedBox(width: 4),
//                                           Center(
//                                             child: Text(
//                                               news[i]["publishedAt"],
//                                               // "20/8/2024",
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               const SizedBox(width: 1),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
//                                 child: Container(
//                                   height: 100,
//                                   width: MediaQuery.of(context).size.width * 0.20,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                     color: Colors.grey[300],
//                                   ),
//                                   child: Image(
//                                     image: NetworkImage(news[i]["urlToImage"]),
//                                     fit: BoxFit.fill,
//                                   )
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget slider(int value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 12),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: List<Widget>.generate(
//           4,
//               (index) => AnimatedContainer(
//             duration: const Duration(milliseconds: 400),
//             height: 9,
//             width: (value == index) ? 30 : 9,
//             margin: const EdgeInsets.symmetric(horizontal: 5),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: (value == index) ? Colors.blue : Colors.blue.withOpacity(0.5),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
















































// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/cupertino.dart';
// import 'package:sports_news/pageTow.dart';
//
// class SliderPage extends StatefulWidget {
//   const SliderPage({super.key});
//
//   @override
//   State<SliderPage> createState() => _SliderPageState();
// }
//
// class _SliderPageState extends State<SliderPage> {
//   ValueNotifier<int> dotsIndex = ValueNotifier(0);
//
//   late Map<String, dynamic> data;
//   late List<dynamic> news;
//   late Future<void> x;
//
//   Future<void> getNews() async {
//     http.Response response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&apiKey=e6b98642439f44a48764fe3e3cacf782'));
//     data = jsonDecode(response.body);
//
//     setState(() {
//       news = data['articles'];
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     x = getNews();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           const SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SizedBox(
//               height: 240,
//               child: PageView.builder(
//                 itemCount: news.length,
//                 onPageChanged: (index) {
//                   dotsIndex.value = index;
//                 },
//                 itemBuilder: (context, i) {
//                   return InkWell(
//                     onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
//                       return Pagetow(news[i]['urlToImage'], news[i]['title'], news[i]['publishedAt'], news[i]['description'], news[i]['source']['name']);
//                     })),
//                     child: _buildSliderCard(
//                       news[i]['urlToImage'],
//                       news[i]['title'],
//                       news[i]['publishedAt'],
//                       news[i]['source']['name'],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           ValueListenableBuilder(
//             valueListenable: dotsIndex,
//             builder: (context, value, _) {
//               return slider(value);
//             },
//           ),
//           const SizedBox(height: 10),
//           _buildNewsSection("Popular News", 3),
//           _buildNewsSection("Sports News", 3),
//           const SizedBox(height: 30),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSliderCard(String imageUrl, String title, String publishedAt, String sourceName) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: 200,
//         width: MediaQuery.of(context).size.width * 0.94,
//         decoration: BoxDecoration(
//           color: Colors.grey[300],
//           borderRadius: BorderRadius.circular(20),
//           image: DecorationImage(
//             image: NetworkImage(imageUrl),
//             fit: BoxFit.fill,
//           ),
//         ),
//         child: Stack(
//           children: <Widget>[
//             Container(
//               width: MediaQuery.of(context).size.width * 0.94,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 gradient: LinearGradient(
//                   end: Alignment.topCenter,
//                   begin: Alignment.bottomCenter,
//                   colors: [
//                     Colors.black.withOpacity(0.3),
//                     Colors.grey[700]!.withOpacity(0.1),
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 8,
//               left: 8,
//               child: _buildSourceBadge(sourceName),
//             ),
//             _buildCardBottomContent(title, publishedAt),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCardBottomContent(String title, String publishedAt) {
//     return Positioned(
//       bottom: 0,
//       left: 0,
//       right: 0,
//       child: Container(
//         width: double.infinity,
//         height: 100,
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(8),
//             bottomRight: Radius.circular(8),
//           ),
//           gradient: LinearGradient(
//             colors: [
//               Colors.black,
//               Colors.black38,
//             ],
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 title,
//                 maxLines: 3,
//                 style: const TextStyle(
//                   fontFamily: "system-ui",
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
//               child: Row(
//                 children: <Widget>[
//                   const Icon(
//                     Icons.access_time,
//                     color: Colors.blueGrey,
//                   ),
//                   const SizedBox(width: 4),
//                   Text(
//                     publishedAt,
//                     style: const TextStyle(
//                       fontFamily: "system-ui",
//                       fontSize: 15,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSourceBadge(String sourceName) {
//     return Padding(
//       padding: const EdgeInsets.all(14.0),
//       child: Container(
//         height: 30,
//         width: 80,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           gradient: const LinearGradient(
//             colors: [
//               Colors.deepPurple,
//               Colors.deepPurple,
//             ],
//           ),
//         ),
//         child: Center(
//           child: Text(
//             sourceName,
//             maxLines: 1,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 11,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNewsSection(String title, int itemCount) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
//               child: Text(
//                 title,
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//             IconButton(
//               onPressed: () => print("press button"),
//               icon: const Icon(
//                 Icons.arrow_forward_ios,
//                 color: Colors.black,
//                 size: 18,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 550,
//           width: MediaQuery.of(context).size.width * 0.98,
//           child: ListView.builder(
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: itemCount,
//             itemBuilder: (context, i) {
//               final article = news[i];
//               return SizedBox(
//                 height: 175,
//                 width: double.infinity,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(30), bottom: Radius.circular(30)),
//                   child: Padding(
//                     padding: const EdgeInsets.all(3.0),
//                     child: Card(
//                       elevation: 4,
//                       color: Colors.white,
//                       child: Row(
//                         children: [
//                           SizedBox(
//                             height: 155,
//                             width: MediaQuery.of(context).size.width * 0.69,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: <Widget>[
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//                                   child: Text(
//                                     article["title"] ?? "",
//                                     maxLines: 3,
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 15,
//                                       letterSpacing: 1,
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 8),
//                                   child: Container(
//                                     width: 120,
//                                     height: 20,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       color: Colors.grey[700],
//                                     ),
//                                     child: Center(
//                                       child: Text(
//                                         article["source"]["name"] ?? "",
//                                         style: const TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
//                                   child: Row(
//                                     children: <Widget>[
//                                       const Icon(Icons.access_time, size: 18),
//                                       const SizedBox(width: 4),
//                                       Text(
//                                         article["publishedAt"] ?? "",
//                                         style: const TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(width: 1),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
//                             child: Container(
//                               height: 100,
//                               width: MediaQuery.of(context).size.width * 0.20,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.grey[300],
//                               ),
//                               child: Image(
//                                 image: NetworkImage(article["urlToImage"] ?? ""),
//                                 fit: BoxFit.fill,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget slider(int value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 12),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: List<Widget>.generate(
//           news.length,
//               (index) => AnimatedContainer(
//             duration: const Duration(milliseconds: 400),
//             height: 9,
//             width: (value == index) ? 30 : 9,
//             margin: const EdgeInsets.symmetric(horizontal: 5),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: (value == index) ? Colors.blue : Colors.blue.withOpacity(0.5),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
































// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/cupertino.dart';
// import 'package:sports_news/pageTow.dart';
//
// class SliderPage extends StatefulWidget {
//   const SliderPage({super.key});
//
//   @override
//   State<SliderPage> createState() => _SliderPageState();
// }
//
// class _SliderPageState extends State<SliderPage> {
//   ValueNotifier<int> dotsIndex = ValueNotifier(0);
//
//   late List<dynamic> popularNews;
//   late List<dynamic> moreNews;
//   late Future<void> popularNewsFuture;
//   late Future<void> moreNewsFuture;
//
//   Future<void> fetchPopularNews() async {
//     final response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=e6b98642439f44a48764fe3e3cacf782'));
//     final data = jsonDecode(response.body);
//     setState(() {
//       popularNews = data['articles'];
//     });
//   }
//
//   Future<void> fetchMoreNews() async {
//     final response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e6b98642439f44a48764fe3e3cacf782'));
//     final data = jsonDecode(response.body);
//     setState(() {
//       moreNews = data['articles'];
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     popularNewsFuture = fetchPopularNews();
//     moreNewsFuture = fetchMoreNews();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           const SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SizedBox(
//               height: 240,
//               child: FutureBuilder(
//                 future: popularNewsFuture,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   }
//                   if (snapshot.hasError) {
//                     return Center(child: Text('Error: ${snapshot.error}'));
//                   }
//                   return PageView.builder(
//                     itemCount: popularNews.length,
//                     onPageChanged: (index) {
//                       dotsIndex.value = index;
//                     },
//                     itemBuilder: (context, i) {
//                       return InkWell(
//                         onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
//                           return Pagetow(
//                               popularNews[i]['urlToImage'],
//                               popularNews[i]['title'],
//                               popularNews[i]['publishedAt'],
//                               popularNews[i]['description'],
//                               popularNews[i]['source']['name']
//                           );
//                         })),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             height: 200,
//                             width: MediaQuery.of(context).size.width * 0.94,
//                             decoration: BoxDecoration(
//                               color: Colors.grey[300],
//                               borderRadius: BorderRadius.circular(20),
//                               image: DecorationImage(
//                                 image: NetworkImage(popularNews[i]['urlToImage']),
//                                 fit: BoxFit.fill,
//                               ),
//                             ),
//                             child: Stack(
//                               children: <Widget>[
//                                 Container(
//                                   width: MediaQuery.of(context).size.width * 0.94,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(12),
//                                     gradient: LinearGradient(
//                                       end: Alignment.topCenter,
//                                       begin: Alignment.bottomCenter,
//                                       colors: [
//                                         Colors.black.withOpacity(0.3),
//                                         Colors.grey[700]!.withOpacity(0.1),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: <Widget>[
//                                     Container(
//                                       width: double.infinity,
//                                       height: 100,
//                                       decoration: const BoxDecoration(
//                                         borderRadius: BorderRadius.only(
//                                           bottomLeft: Radius.circular(8),
//                                           bottomRight: Radius.circular(8),
//                                         ),
//                                         gradient: LinearGradient(
//                                           colors: [
//                                             Colors.black,
//                                             Colors.black38,
//                                           ],
//                                         ),
//                                       ),
//                                       child: Column(
//                                         children: <Widget>[
//                                           Padding(
//                                             padding: EdgeInsets.all(8.0),
//                                             child: Text(
//                                               popularNews[i]['title'],
//                                               maxLines: 3,
//                                               style: TextStyle(
//                                                 fontFamily: "system-ui",
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w500,
//                                                 color: Colors.white,
//                                               ),
//                                             ),
//                                           ),
//                                           Row(
//                                             children: <Widget>[
//                                               const Icon(
//                                                 Icons.access_time,
//                                                 color: Colors.blueGrey,
//                                               ),
//                                               const SizedBox(width: 4),
//                                               Text(
//                                                 popularNews[i]['publishedAt'],
//                                                 style: TextStyle(
//                                                   fontFamily: "system-ui",
//                                                   fontSize: 15,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: Colors.grey[100],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(14.0),
//                                   child: Container(
//                                     height: 30,
//                                     width: 80,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       gradient: const LinearGradient(
//                                         colors: [
//                                           Colors.deepPurple,
//                                           Colors.deepPurple,
//                                         ],
//                                       ),
//                                     ),
//                                     child: Center(
//                                       child: Text(
//                                         popularNews[i]['source']['name'],
//                                         maxLines: 1,
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ),
//           ValueListenableBuilder(
//             valueListenable: dotsIndex,
//             builder: (context, value, _) {
//               return slider(value);
//             },
//           ),
//           SizedBox(height: 10,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
//                 child: Text("Popular News",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               IconButton(
//                 onPressed: () => print("press button"),
//                 icon: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 18),
//               )
//             ],
//           ),
//           FutureBuilder(
//             future: popularNewsFuture,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               }
//               if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               }
//               return SizedBox(
//                 height: 550,
//                 width: MediaQuery.of(context).size.width * 0.98,
//                 child: ListView.builder(
//                   physics: NeverScrollableScrollPhysics(),
//                   itemCount: popularNews.length,
//                   itemBuilder: (context, i) {
//                     return SizedBox(
//                       height: 175,
//                       width: double.infinity,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.vertical(top: Radius.circular(30), bottom: Radius.circular(30)),
//                         child: Padding(
//                           padding: const EdgeInsets.all(3.0),
//                           child: Card(
//                             elevation: 4,
//                             color: Colors.white,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Row(
//                                   children: [
//                                     SizedBox(
//                                       height: 155,
//                                       width: MediaQuery.of(context).size.width * 0.69,
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: <Widget>[
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//                                             child: Text(
//                                               popularNews[i]['title'],
//                                               maxLines: 3,
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.w400,
//                                                 fontSize: 17,
//                                                 letterSpacing: 1,
//                                                 color: Colors.black,
//                                               ),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(horizontal: 8,),
//                                             child: Container(
//                                               width: 120,
//                                               height: 20,
//                                               decoration: BoxDecoration(
//                                                 borderRadius: BorderRadius.circular(20),
//                                                 color: Colors.grey[700],
//                                               ),
//                                               child: Center(
//                                                 child: Text(
//                                                   popularNews[i]['source']['name'],
//                                                   style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(height: 8,),
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
//                                             child: Row(
//                                               children: <Widget>[
//                                                 Icon(Icons.access_time, size: 18,),
//                                                 SizedBox(width: 4,),
//                                                 Center(
//                                                   child: Text(
//                                                     popularNews[i]['publishedAt'],
//                                                     style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontSize: 14,
//                                                       fontWeight: FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(width: 1,),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
//                                       child: Container(
//                                         height: 100,
//                                         width: MediaQuery.of(context).size.width * 0.20,
//                                         decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(15),
//                                             gradient: LinearGradient(
//                                                 colors: [
//                                                   Colors.grey[400]!,
//                                                   Colors.grey[400]!,
//                                                 ]
//                                             ),
//                                             image: DecorationImage(
//                                               image: NetworkImage(popularNews[i]['urlToImage']),
//                                               fit: BoxFit.fill,
//                                             )
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               );
//             },
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
//                 child: Text("More News",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               IconButton(
//                 onPressed: () => print("press button"),
//                 icon: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 18),
//               )
//             ],
//           ),
//           FutureBuilder(
//             future: moreNewsFuture,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               }
//               if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               }
//               return SizedBox(
//                 height: 550,
//                 width: MediaQuery.of(context).size.width * 0.98,
//                 child: ListView.builder(
//                   physics: NeverScrollableScrollPhysics(),
//                   itemCount: moreNews.length,
//                   itemBuilder: (context, i) {
//                     return SizedBox(
//                       height: 175,
//                       width: double.infinity,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.vertical(top: Radius.circular(30), bottom: Radius.circular(30)),
//                         child: Padding(
//                           padding: const EdgeInsets.all(3.0),
//                           child: Card(
//                             elevation: 4,
//                             color: Colors.white,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Row(
//                                   children: [
//                                     SizedBox(
//                                       height: 155,
//                                       width: MediaQuery.of(context).size.width * 0.69,
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: <Widget>[
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//                                             child: Text(
//                                               moreNews[i]['title'],
//                                               maxLines: 3,
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.w400,
//                                                 fontSize: 17,
//                                                 letterSpacing: 1,
//                                                 color: Colors.black,
//                                               ),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(horizontal: 8,),
//                                             child: Container(
//                                               width: 120,
//                                               height: 20,
//                                               decoration: BoxDecoration(
//                                                 borderRadius: BorderRadius.circular(20),
//                                                 color: Colors.grey[700],
//                                               ),
//                                               child: Center(
//                                                 child: Text(
//                                                   moreNews[i]['source']['name'],
//                                                   style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(height: 8,),
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
//                                             child: Row(
//                                               children: <Widget>[
//                                                 Icon(Icons.access_time, size: 18,),
//                                                 SizedBox(width: 4,),
//                                                 Center(
//                                                   child: Text(
//                                                     moreNews[i]['publishedAt'],
//                                                     style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontSize: 14,
//                                                       fontWeight: FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(width: 1,),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
//                                       child: Container(
//                                         height: 100,
//                                         width: MediaQuery.of(context).size.width * 0.20,
//                                         decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(15),
//                                             gradient: LinearGradient(
//                                                 colors: [
//                                                   Colors.grey[400]!,
//                                                   Colors.grey[400]!,
//                                                 ]
//                                             ),
//                                             image: DecorationImage(
//                                               image: NetworkImage(moreNews[i]['urlToImage']),
//                                               fit: BoxFit.fill,
//                                             )
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               );
//             },
//           ),
//           SizedBox(height: 30,),
//         ],
//       ),
//     );
//   }
// }
//
// Widget slider(int value) => Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: <Widget>[
//     for (int i = 0; i < 6; i++)
//       AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         margin: const EdgeInsets.symmetric(horizontal: 3),
//         width: i == value ? 30 : 8,
//         height: i == value ? 8 : 8,
//         decoration: BoxDecoration(
//           borderRadius: i == value ? BorderRadius.circular(20) : BorderRadius.circular(50),
//           color: i == value ? Colors.grey[800] : Colors.grey[500],
//         ),
//       ),
//   ],
// );









































































import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sports_news/Matches.dart';
import 'package:sports_news/pageTow.dart';
import 'animation_button.dart';
import 'morenews.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  ValueNotifier<int> dotsIndex = ValueNotifier(0);

  List<dynamic> news = [];
  List<dynamic> sportnews = [];
  late Future<void> x;
  late Future<void> y;

  Future<void> getNews() async {
    try {
      final response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e6b98642439f44a48764fe3e3cacf782'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          news = data['articles'] ?? [];
        });
      } else {
        print('Failed to load news. Status code: ${response.statusCode}');
        throw Exception('Failed to load news');
      }
    } catch (e) {
      print('Error fetching news: $e');
      setState(() {
        news = []; // Ensure news is set to an empty list on error
      });
    }
  }

  Future<void> getsportNews() async {
    try {
      final response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=e6b98642439f44a48764fe3e3cacf782'));
       //  main => https://gnews.io/api/v4/top-headlines?country=gb&category=sports&apikey=API_KEY
       //  https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=e6b98642439f44a48764fe3e3cacf782
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          sportnews = data['articles'] ?? [];
        });
      } else {
        print('Failed to load sports news. Status code: ${response.statusCode}');
        throw Exception('Failed to load sports news');
      }
    } catch (e) {
      print('Error fetching sports news: $e');
      setState(() {
        sportnews = [];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    x = getNews();
    y = getsportNews();
  }

  @override
  void dispose() {
    dotsIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 240,
              child: FutureBuilder(
                future: x,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (news.isEmpty) {
                    return Center(child: Text('No news available.'));
                  } else {
                    return PageView.builder(
                      itemCount: news.length,
                      onPageChanged: (index) {
                        dotsIndex.value = index;
                      },
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return Pagetow(news[i]['urlToImage'], news[i]['title'], news[i]['publishedAt'], news[i]['description'], news[i]['source']['name']);
                          })),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width * 0.94,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(news[i]['urlToImage'] ?? ''),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.94,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      gradient: LinearGradient(
                                        end: Alignment.topCenter,
                                        begin: Alignment.bottomCenter,
                                        colors: [
                                          Colors.black.withOpacity(0.3),
                                          Colors.grey[700]!.withOpacity(0.1),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        width: double.infinity,
                                        height: 100,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(8),
                                            bottomRight: Radius.circular(8),
                                          ),
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.black,
                                              Colors.black38,
                                            ],
                                          ),
                                        ),
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                news[i]['title'] ?? 'No title',
                                                maxLines: 3,
                                                style: TextStyle(
                                                  fontFamily: "system-ui",
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                const Icon(
                                                  Icons.access_time,
                                                  color: Colors.blueGrey,
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  news[i]['publishedAt'] ?? 'No date',
                                                  style: TextStyle(
                                                    fontFamily: "system-ui",
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey[100],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Container(
                                      height: 30,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Colors.deepPurple,
                                            Colors.deepPurple,
                                          ],
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          news[i]['source']['name'] ?? 'Unknown Source',
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: dotsIndex,
            builder: (context, value, _) {
              return slider(value);
            },
          ),
          SizedBox(height: 10,),

          // Popular news
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                child: Text("Popular News",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              IconButton(onPressed: () => print("press button"),
                  icon: Icon(Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 18,
                  )
              )
            ],
          ),
          SizedBox(
            height: 530,
            width: MediaQuery.of(context).size.width * 0.98,
            child: FutureBuilder(
              future: y,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (sportnews.isEmpty) {
                  return Center(child: Text('No sports news available.'));
                } else {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: sportnews.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Pagetow(news[i]['urlToImage'] ?? '', news[i]['title'] ?? 'No title', news[i]['publishedAt'] ?? 'No date', news[i]['description'] ?? 'No description', news[i]['source']['name'] ?? 'Unknown Source');
                        })),
                        child: SizedBox(
                          height: 175,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(30), bottom: Radius.circular(30)),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Card(
                                elevation: 4,
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 155,
                                          width: MediaQuery.of(context).size.width * 0.69,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                                child: Text(
                                                  news[i]['title'] ?? 'No title',
                                                  maxLines: 3,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 17,
                                                    letterSpacing: 1,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                                child: Container(
                                                  width: 120,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20),
                                                    color: Colors.grey[700],
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      news[i]['source']['name'] ?? 'Unknown Source',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                                                child: Row(
                                                  children: <Widget>[
                                                    Icon(Icons.access_time, size: 18),
                                                    SizedBox(width: 4),
                                                    Center(
                                                      child: Text(
                                                        news[i]['publishedAt'] ?? 'No date',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 1),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
                                          child: Container(
                                            height: 100,
                                            width: MediaQuery.of(context).size.width * 0.20,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.grey[400]!,
                                                  Colors.grey[400]!,
                                                ],
                                              ),
                                              image: DecorationImage(
                                                image: NetworkImage(news[i]['urlToImage'] ?? ''),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),

          SizedBox(height: 5,),

          //  more news
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                child: Text("More News",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              IconButton(onPressed: () => print("press button"),
                  icon: Icon(Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 18,
                  )
              )
            ],
          ),
          SizedBox(
            height: 1050,
            width: MediaQuery.of(context).size.width * 0.98,
            child: FutureBuilder(
              future: y,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (sportnews.isEmpty) {
                  return Center(child: Text('No sports news available.'));
                } else {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: sportnews.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Pagetow(news[i+7]['urlToImage'] ?? '', news[i+7]['title'] ?? 'No title', news[i+7]['publishedAt'] ?? 'No date', news[i+7]['description'] ?? 'No description', news[i+7]['source']['name'] ?? 'Unknown Source');
                        })),
                        child: SizedBox(
                          height: 175,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(30), bottom: Radius.circular(30)),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Card(
                                elevation: 4,
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 155,
                                          width: MediaQuery.of(context).size.width * 0.69,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                                child: Text(
                                                  news[i+7]['title'] ?? 'No title',
                                                  maxLines: 3,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 17,
                                                    letterSpacing: 1,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                                child: Container(
                                                  width: 120,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20),
                                                    color: Colors.grey[700],
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      news[i+7]['source']['name'] ?? 'Unknown Source',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                                                child: Row(
                                                  children: <Widget>[
                                                    Icon(Icons.access_time, size: 18),
                                                    SizedBox(width: 4),
                                                    Center(
                                                      child: Text(
                                                        news[i+7]['publishedAt'] ?? 'No date',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 1),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
                                          child: Container(
                                            height: 100,
                                            width: MediaQuery.of(context).size.width * 0.20,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.grey[400]!,
                                                  Colors.grey[400]!,
                                                ],
                                              ),
                                              image: DecorationImage(
                                                image: NetworkImage(news[i+7]['urlToImage'] ?? ''),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),

          SizedBox(height: 5,),

          // sports news
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                child: Text(
                  "Sports News",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => print("press button"),
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 18,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 630,
            width: MediaQuery.of(context).size.width * 0.98,
            child: FutureBuilder(
              future: y,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (sportnews.isEmpty) {
                  return Center(child: Text('No sports news available.'));
                } else {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: sportnews.length,
                          itemBuilder: (context, i) {
                            return InkWell(
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return Pagetow(
                                  sportnews[i]['urlToImage'] ?? '',
                                  sportnews[i]['title'] ?? 'No title',
                                  sportnews[i]['publishedAt'] ?? 'No date',
                                  sportnews[i]['description'] ?? 'No description',
                                  sportnews[i]['source']['name'] ?? 'Unknown Source',
                                );
                              })),
                              child: SizedBox(
                                height: 175,
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(30), bottom: Radius.circular(30)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Card(
                                      elevation: 4,
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: 155,
                                                width: MediaQuery.of(context).size.width * 0.69,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                                      child: Text(
                                                        sportnews[i]['title'] ?? 'No title',
                                                        maxLines: 3,
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 17,
                                                          letterSpacing: 1,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                                      child: Container(
                                                        width: 120,
                                                        height: 20,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(20),
                                                          color: Colors.grey[700],
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            sportnews[i]['source']['name'] ?? 'Unknown Source',
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 8),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Icon(Icons.access_time, size: 18),
                                                          SizedBox(width: 4),
                                                          Center(
                                                            child: Text(
                                                              sportnews[i]['publishedAt'] ?? 'No date',
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 1),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
                                                child: Container(
                                                  height: 100,
                                                  width: MediaQuery.of(context).size.width * 0.20,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(15),
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Colors.grey[400]!,
                                                        Colors.grey[400]!,
                                                      ],
                                                    ),
                                                    image: DecorationImage(
                                                      image: NetworkImage(sportnews[i]['urlToImage'] ?? ''),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: AnimatedButton(), // Replacing the standard button with the animated one
                      ),
                    ],
                  );
                }
              },
            ),
          ),


          SizedBox(height: 30),
        ],
      ),
    );
  }
}

Widget slider(int value) => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    for (int i = 0; i < 6; i++)
      AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 3),
        width: i == value ? 30 : 8,
        height: i == value ? 8 : 8,
        decoration: BoxDecoration(
          borderRadius: i == value ? BorderRadius.circular(20) : BorderRadius.circular(50),
          color: i == value ? Colors.grey[800] : Colors.grey[500],
        ),
      ),
  ],
);




