import 'package:flutter/material.dart';

class HorizontalCards extends StatelessWidget {
  final List<String> imgURLs = [
    "",
    "https://cdn1.sph.harvard.edu/wp-content/uploads/sites/30/2012/09/vegetables-and-fruits-farmers-market.jpg",
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR7xQBSoM_pwUapOnzn8eRRcQ9q0g-1Zhyhlg&usqp=CAU',
    'https://image.made-in-china.com/202f0j00wmeQYCEdSApM/Chinese-Dried-Fruit-Wholesale-Low-Price-Healthy-Food-Organic-High-Quality-Jujube-Red-Date.jpg',
    "https://cdn1.sph.harvard.edu/wp-content/uploads/sites/30/2012/09/vegetables-and-fruits-farmers-market.jpg",
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR7xQBSoM_pwUapOnzn8eRRcQ9q0g-1Zhyhlg&usqp=CAU',
    'https://image.made-in-china.com/202f0j00wmeQYCEdSApM/Chinese-Dried-Fruit-Wholesale-Low-Price-Healthy-Food-Organic-High-Quality-Jujube-Red-Date.jpg',
    "",
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
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 0,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: Text(
                    '#',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  margin: EdgeInsets.only(right: 8),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TikTokWithAlexa',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Trending',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  child: Text(
                    '361.0M>',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: imgURLs.map((imgURL) {
                if (imgURL == '') {
                  // beginning or end
                  return SizedBox(
                    width: 25,
                  );
                }
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
