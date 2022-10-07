import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:tinder_clone/data/exploreJson.dart';
import 'package:tinder_clone/data/icons.dart';
import '../theme/colors.dart';
import '../data/icons.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List itemsTemp = [];
  int itemLength = 0;
  @override
  void initState() {
    super.initState();
    setState(() {
      itemsTemp = explore_json;
      itemLength = explore_json.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 120),
        child: Container(
          height: size.height,
          child: TinderSwapCard(
            totalNum: itemLength,
            maxWidth: size.width,
            maxHeight: size.height * 0.75,
            minHeight: size.height * 0.6,
            minWidth: size.width * 0.75,
            cardBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 2,
                    )
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(itemsTemp[index]['img']),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      width: size.width,
                      height: size.height,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            black.withOpacity(0.25),
                            black.withOpacity(0)
                          ],
                              end: Alignment.topCenter,
                              begin: Alignment.bottomCenter)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: size.width * 0.72,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Row(
                                        children: [
                                          Text(
                                            itemsTemp[index]['name'],
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            itemsTemp[index]['age'],
                                            style: TextStyle(
                                              fontSize: 22,
                                              color: white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                                color: green,
                                                shape: BoxShape.circle),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Recently Active',
                                            style: TextStyle(
                                                fontSize: 16, color: white),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 12, bottom: 15),
                                      child: Row(
                                        children: [
                                          ...List.generate(
                                              itemsTemp[index]['likes'].length,
                                              (indexLikes) {
                                            if (indexLikes == 0) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: white
                                                          .withOpacity(0.4),
                                                      border: Border.all(
                                                        width: 2,
                                                        color: white,
                                                      )),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 10,
                                                            bottom: 3,
                                                            top: 3),
                                                    child: Text(
                                                      itemsTemp[index]['likes']
                                                          [indexLikes],
                                                      style: TextStyle(
                                                          color: white),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: white.withOpacity(0.2),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10,
                                                          right: 10,
                                                          bottom: 3,
                                                          top: 3),
                                                  child: Text(
                                                    itemsTemp[index]['likes']
                                                        [indexLikes],
                                                    style:
                                                        TextStyle(color: white),
                                                  ),
                                                ),
                                              ),
                                            );
                                          })
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                width: size.width * 0.2,
                                child: Center(
                                  child: Icon(
                                    Icons.info,
                                    color: white,
                                    size: 28,
                                  ),
                                ),
                              ))
                            ],
                          )
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
      bottomSheet: Container(
        width: size.width,
        height: 120,
        decoration: BoxDecoration(color: white),
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ...List.generate(item_icons.length, (index) {
                  return Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: white,
                        boxShadow: [
                          BoxShadow(
                            color: grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 10,
                          )
                        ]),
                    child: Center(
                      child: SvgPicture.asset(
                        item_icons[index]['icon'].toString(),
                        width: item_icons[index]['icon_size'],
                      ),
                    ),
                  );
                })
              ]),
        ),
      ),
    );
  }
}
