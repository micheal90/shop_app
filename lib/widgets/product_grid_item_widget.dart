import 'package:flutter/material.dart';

class ProductGridItemWidget extends StatelessWidget {
  final String text;
  final imageUrl;

  const ProductGridItemWidget({
    required this.text,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      )),
      child: GridTile(
        
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: Image.network(
            imageUrl,
            fit: BoxFit.fill,
          ),
        ),
        footer: Container(
          color: Colors.black45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_outline,
                    color: Colors.red,
                  )),
              Text(
                text,
                style: Theme.of(context).textTheme.headline3,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_shopping_cart_rounded,
                    color: Colors.red,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
