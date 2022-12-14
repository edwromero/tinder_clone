import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:tinder_clone/data/accountJson.dart';

import '../theme/colors.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: grey.withOpacity(0.2),
      body: ClipPath(
        clipper: OvalBottomBorderClipper(),
        child: Container(
          width: size.width,
          height: size.height * 0.6,
          decoration: BoxDecoration(color: white, boxShadow: [
            BoxShadow(
              color: grey.withOpacity(0.1),
              spreadRadius: 10,
              blurRadius: 10,
            )
          ]),
          child: Padding(
            padding: const EdgeInsets.only(right: 30, left: 30, bottom: 40),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(account_json[0]['img']),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                account_json[0]['name'] + " , " + account_json[0]['age'],
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: grey.withOpacity(0.1),
                                blurRadius: 15,
                                spreadRadius: 10,
                              )
                            ]),
                        child: Icon(
                          Icons.settings,
                          size: 35,
                          color: grey.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('SETTINGS',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: grey.withOpacity(0.8),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Container(
                          width: 85,
                          height: 85,
                          child: Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [primary_one, primary_two]),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: grey.withOpacity(0.1),
                                        blurRadius: 15,
                                        spreadRadius: 10,
                                      )
                                    ]),
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 45,
                                  color: white,
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 8,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: grey.withOpacity(0.1),
                                        blurRadius: 15,
                                        spreadRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: primary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('ADD MEDIA',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: grey.withOpacity(0.8),
                            )),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: grey.withOpacity(0.1),
                                blurRadius: 15,
                                spreadRadius: 10,
                              )
                            ]),
                        child: Icon(
                          Icons.edit,
                          size: 35,
                          color: grey.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('EDIT INFO',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: grey.withOpacity(0.8),
                          )),
                    ],
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
