import 'package:belli/constants.dart';
import 'package:belli/models/hotel_services.dart';
import 'package:belli/providers/hotel_provider.dart';
import 'package:belli/screens/home/sub_screens/home_screen/product_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class HotelsList extends StatefulWidget {
  const HotelsList({Key? key}) : super(key: key);

  @override
  _HotelsListState createState() => _HotelsListState();
}

class _HotelsListState extends State<HotelsList> {
  HotelServices _hotelServices = HotelServices();

  @override
  Widget build(BuildContext context) {
    final _hotelData = Provider.of<HotelProvider>(context);
    return Container(
      color: Colors.white,
      child: StreamBuilder<QuerySnapshot>(
        stream: _hotelServices.hotels,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 20),
                        child: Text(
                          "All Available Hotels",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 10, top: 3),
                        child: Text(
                          "Explore variety of dishes",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: snapshot.data!.docs.map((DocumentSnapshot document) {
                      return InkWell(
                        onTap: () {
                          _hotelData.getSelectedHotel(document);
                          pushNewScreen(
                            context,
                            screen: ProductScreen(),
                            withNavBar: true,
                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Container(
                            width: width(context),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 100,
                                  height: 110,
                                  child: Card(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.network(
                                        document['hotel_image'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                IntrinsicHeight(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 8,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                document['hotel_name'],
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            SizedBox(height: 3),
                                            SizedBox(
                                              width: width(context) - 126,
                                              child: Text(
                                                document['hotel_address'],
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: kStoreCardStyle,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // SizedBox(height: 15),
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: 12,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              document['hotel_rating'].toString(),
                                              style: kStoreCardStyle,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          }
          return SizedBox(
              height: 30, width: 30, child: CircularProgressIndicator());
        },
      ),
    );
  }
}
