import 'package:flutter/material.dart';


class Productcard extends StatelessWidget {

  final String name;
  final String imageUrl;
  final double price;
  final String offerTag;
  final Function onTap;

  Productcard({super.key,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.offerTag,
    required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.maxFinite,
                height: 126,
              ),
              SizedBox(height:5,),
              Text(name,
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,),
              SizedBox(height: 5,),
              Text("Rs : $price",
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,),
              SizedBox(height: 3,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4)
                ),
                child: Text(offerTag,
                style: TextStyle(color: Colors.white,fontSize: 12),

                ),
              ),


            ],
          ),
        ),

      ),
    );
  }
}
