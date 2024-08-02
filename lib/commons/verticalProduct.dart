// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class VerticalProductCard extends StatefulWidget {
  VerticalProductCard({
    super.key,
    required this.image,
    required this.companyName,
    this.isVerified = false,
    this.price,
  });
  final String image;
  final String companyName;
  bool isVerified;
  int? price;

  @override
  State<VerticalProductCard> createState() => _VerticalProductCardState();
}

class _VerticalProductCardState extends State<VerticalProductCard> {
  bool clickd = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          //height: TSize.productCardHeight,
          width: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.withOpacity(0.1),
              border: Border.all(
                color: Colors.grey.withOpacity(0.1),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 50,
                    spreadRadius: 7,
                    offset: const Offset(0, 2)),
              ]), //BoxShadow
          //
          //
          //

          child: Stack(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.all(1),
                  //child:Image(image:AssetImage())
                ),
                Row(
                  children: [
                    Text(
                      widget.companyName,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: Colors.grey),
                    ),
                    SizedBox(width: 5),
                    Container(
                      child: widget.isVerified
                          ? Icon(
                              Icons.verified,
                              color: Colors.blue,
                              size: 23,
                            )
                          : null,
                    )
                  ],
                ),
                SizedBox(
                  height: 280 * 0.2,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "RS ${widget.price}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(width: 5),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ]),
              Positioned(
                  right: 2,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        clickd = !clickd;
                      });
                    },
                    icon: ImageIcon(
                      AssetImage("assets/images/Heart.png"),
                      color:
                          clickd ? Colors.red : Colors.white.withOpacity(0.2),
                    ),
                  ))
            ],
          )),
    );
  }
}
