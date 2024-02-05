import 'package:flutter/material.dart';
import 'package:grid_view_task2/api.dart';
//import 'package:flutter_rating_bar/flutter_rating_bar.dart';



class ProductScreen extends StatelessWidget {
  final ProductDataModel product;
  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: Image.network(
            product.productImage,
            height: 300,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          product.productName,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Price: ${product.productPrice}',
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Rating: ${product.productRating}',
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[600],
          ),
        ),
        //const SizedBox(height: 5,),
        /*RatingBarIndicator(
          itemBuilder: (context, ind) =>
              const Icon(
                Icons.star,
                color: Colors.amber,
                ),
                rating: DataSource.listOfProduct[index].productRating.toDouble(),  //here
                itemCount: 5,
                itemSize: 15,
                direction: Axis.horizontal,
                ),*/
        const SizedBox(height: 300),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0,0.0,20.0,0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
