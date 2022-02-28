import 'package:belli/providers/hotel_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HotelDetailsAppBar extends StatelessWidget {
  const HotelDetailsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _hotel = Provider.of<HotelProvider>(context);
    double rating = _hotel.storedetails['hotel_rating'].toDouble();

    mapLauncher() async {
      GeoPoint location = _hotel.storedetails['hotel_location'];
      final availableMaps = await MapLauncher.installedMaps;
      await availableMaps.first.showMarker(
        coords: Coords(location.latitude, location.longitude),
        title: "${_hotel.storedetails['hotel_name']} is here",
      );
    }

    return SliverAppBar(
      floating: true,
      snap: true,
      expandedHeight: 280,
      flexibleSpace: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(top: 86),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(_hotel.storedetails['hotel_image']),
                  ),
                ),
                child: Container(
                  color: Colors.grey.withOpacity(.7),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomScrollView(
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 7,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _hotel.storedetails['hotel_name'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      _hotel.storedetails['hotel_address'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      _hotel.storedetails['hotel_email'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      _hotel.storedetails['hotel_phone']
                                          .toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          rating < 0
                                              ? Icons.star_outline
                                              : rating > 0 && rating < 1
                                                  ? Icons.star_half
                                                  : Icons.star,
                                          color: Colors.white,
                                        ),
                                        Icon(
                                          rating < 1
                                              ? Icons.star_outline
                                              : rating > 0 && rating < 2
                                                  ? Icons.star_half
                                                  : Icons.star,
                                          color: Colors.white,
                                        ),
                                        Icon(
                                          rating < 2
                                              ? Icons.star_outline
                                              : rating > 0 && rating < 3
                                                  ? Icons.star_half
                                                  : Icons.star,
                                          color: Colors.white,
                                        ),
                                        Icon(
                                          rating < 3
                                              ? Icons.star_outline
                                              : rating > 0 && rating < 4
                                                  ? Icons.star_half
                                                  : Icons.star,
                                          color: Colors.white,
                                        ),
                                        Icon(
                                          rating < 4
                                              ? Icons.star_outline
                                              : rating > 0 && rating < 5
                                                  ? Icons.star_half
                                                  : Icons.star,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          _hotel.storedetails['hotel_rating']
                                              .toString(),
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.phone,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            onPressed: () {
                                              launch(
                                                  'tel:${_hotel.storedetails['hotel_phone']}');
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.map,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            onPressed: () {
                                              mapLauncher();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(CupertinoIcons.search),
        ),
      ],
      title: Text(
        _hotel.storedetails['hotel_name'],
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
