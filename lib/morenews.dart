// import 'package:flutter/material.dart';
//
//
// class Pagetow extends StatefulWidget {
//   //const Pagetow({super.key});
//
//   final String Image;
//   final String title;
//   final String date;
//   final String des;
//   final String titleGroups;
//
//
//   Pagetow(this.Image, this.title, this.date, this.des, this.titleGroups);
//
//   @override
//   State<Pagetow> createState() => _PagetowState();
// }
//
// class _PagetowState extends State<Pagetow> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //appBar: AppBar(),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//             children: <Widget>[
//               Container(
//                 height: 300,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: NetworkImage(
//                           widget.Image
//                       ),
//                       fit: BoxFit.fill,
//                     )
//                 ),
//                 child: Stack(
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 55, horizontal: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           InkWell(
//                             onTap: () => Navigator.pop(context),
//                             child: Icon(Icons.arrow_back_ios, color: Colors.white,size: 20,),
//                           ),
//                           InkWell(
//                             onTap: () => Navigator.pop(context),
//                             child: Icon(Icons.share, color: Colors.white,size: 23,),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Container(
//                       height: 25,
//                       width: 90,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.grey[300],
//                       ),
//                       child: Center(
//                         child: Text(widget.titleGroups,
//                           style: TextStyle(
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//
//               SizedBox(height: 10,),
//
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
//                 child: Row(
//                   children: <Widget>[
//                     const Icon(
//                       size: 20,
//                       Icons.access_time,
//                       color: Colors.blueGrey,
//                     ),
//                     const SizedBox(width: 4),
//                     Text(
//                       widget.date,
//                       style: TextStyle(
//                         fontFamily: "system-ui",
//                         fontSize: 15,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.grey[500],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 14),
//                 child: Text(widget.title,
//                   maxLines: 2,
//                   style: TextStyle(
//                       letterSpacing: 0.3,
//                       height: 1.5,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18
//                   ),
//                 ),
//               ),
//
//               Divider(
//                 thickness: 2.6,
//                 color: Colors.blue,
//                 endIndent: 300,
//                 indent: 10,
//               ),
//
//               SizedBox(height: 20,),
//
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(widget.des,
//                   style: TextStyle(
//                       letterSpacing: 1.2,
//                       height: 1.6,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 16
//                   ),
//                 ),
//               )
//
//             ]
//         ),
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';


class Morenewsews extends StatefulWidget {
  //const Morenewsews({super.key});
  late final String moreImage;
  late final String moretitle;
  late final String moredate;
  late final String moredes;
  late final String moretitleGroups;


  Morenewsews(this.moreImage, this.moretitle, this.moredate, this.moredes, this.moretitleGroups);

  @override
  State<Morenewsews> createState() => _MorenewsewsState();
}

class _MorenewsewsState extends State<Morenewsews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          widget.moreImage
                      ),
                      fit: BoxFit.fill,
                    )
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 55, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Icon(Icons.arrow_back_ios, color: Colors.white,size: 20,),
                          ),
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Icon(Icons.share, color: Colors.white,size: 23,),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 25,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[300],
                      ),
                      child: Center(
                        child: Text(widget.moretitleGroups,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Row(
                  children: <Widget>[
                    const Icon(
                      size: 20,
                      Icons.access_time,
                      color: Colors.blueGrey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.moredate,
                      style: TextStyle(
                        fontFamily: "system-ui",
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(widget.moretitle,
                  maxLines: 2,
                  style: TextStyle(
                      letterSpacing: 0.3,
                      height: 1.5,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
              ),

              Divider(
                thickness: 2.6,
                color: Colors.blue,
                endIndent: 300,
                indent: 10,
              ),

              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.moredes,
                  style: TextStyle(
                      letterSpacing: 1.2,
                      height: 1.6,
                      fontWeight: FontWeight.w500,
                      fontSize: 16
                  ),
                ),
              )

            ]
        ),
      ),
    );
  }
}
