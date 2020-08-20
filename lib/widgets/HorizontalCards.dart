import 'package:flutter/material.dart';

class HorizontalCards extends StatelessWidget {
  final List<String> imgURLs = [
    "https://cdn1.sph.harvard.edu/wp-content/uploads/sites/30/2012/09/vegetables-and-fruits-farmers-market.jpg",
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR7xQBSoM_pwUapOnzn8eRRcQ9q0g-1Zhyhlg&usqp=CAU',
    'https://image.made-in-china.com/202f0j00wmeQYCEdSApM/Chinese-Dried-Fruit-Wholesale-Low-Price-Healthy-Food-Organic-High-Quality-Jujube-Red-Date.jpg',
    "https://cdn1.sph.harvard.edu/wp-content/uploads/sites/30/2012/09/vegetables-and-fruits-farmers-market.jpg",
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR7xQBSoM_pwUapOnzn8eRRcQ9q0g-1Zhyhlg&usqp=CAU',
    'https://image.made-in-china.com/202f0j00wmeQYCEdSApM/Chinese-Dried-Fruit-Wholesale-Low-Price-Healthy-Food-Organic-High-Quality-Jujube-Red-Date.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        children: [
          Row(
            children: [
              Text('TRENDING TIKTOKWITH'),
            ],
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: imgURLs.map((imgURL) {
                return Container(
                  width: 120,
                  color: Colors.blue,
                  child: Image.network(
                    imgURL,
                    fit: BoxFit.cover,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 1),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
