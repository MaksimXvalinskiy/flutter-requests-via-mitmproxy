import 'package:flutter/material.dart';
import 'package:proxy_interception_requests/app_data/lib/assets/images.dart';
import 'package:proxy_interception_requests/features/model/domain/models/products/product/product_entity.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductCardWidget({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: productEntity.images.firstOrNull != null
              ? NetworkImage(productEntity.images.first!)
              : AppImages().emptyProduct().image,
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
          ),
          child: Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      productEntity.title ?? '',
                      softWrap: true,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.end,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      productEntity.price?.toString() ?? '',
                      softWrap: true,
                      style: const TextStyle(color: Colors.amber),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
