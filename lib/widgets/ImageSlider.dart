import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentSlide = 0;
  void setSlide(int slide) {
    setState(() {
      _currentSlide = slide;
    });
  }

  void _previousSlide() {
    _currentSlide != 0
        ? setSlide(_currentSlide - 1)
        : setSlide(_imageURLs.length - 1);
  }

  void _nextSlide() {
    _currentSlide < _imageURLs.length - 1
        ? setSlide(_currentSlide + 1)
        : setSlide(0);
  }

  final List<String> _imageURLs = [
    'https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQO2u8W5qVZNrIoftM59MYbafwVqTF6DgSsjw&usqp=CAU',
    'https://helpx.adobe.com/content/dam/help/en/stock/how-to/visual-reverse-image-search/jcr_content/main-pars/image/visual-reverse-image-search-v2_intro.jpg'
  ];
  final double _iconSize = 40;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.red,
          height: 200,
          child: Image.network(
            _imageURLs[_currentSlide],
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.all(16),
            child: GestureDetector(
              onTap: _previousSlide,
              child: Icon(
                Icons.chevron_left,
                size: _iconSize,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.all(16),
            child: GestureDetector(
              onTap: _nextSlide,
              child: Icon(
                Icons.chevron_right,
                size: _iconSize,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _imageURLs.asMap().keys.map(
                (index) {
                  return Container(
                    height: 10,
                    width: 10,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _currentSlide == index ? Colors.black : Colors.white,
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        )
      ],
    );
  }
}
