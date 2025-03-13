import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/Models/products_model.dart';
import 'dart:convert';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  Future<ProductResponse> fetchProducts() async {
    final response = await http.get(
      Uri.parse(
          'https://cors-anywhere.herokuapp.com/https://webhook.site/https://webhook.site/f9598ec9-6321-4d4b-a3bd-ee76e904ee6a'),
      headers: {
        'user-agent': 'PostmanRuntime/7.43.0',
      },
    );

    print(" Error ${response.statusCode}");
    if (response.statusCode == 200) {
      return ProductResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load productsssssss');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: FutureBuilder<ProductResponse>(
        future: fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Errorrrrr: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.data.isEmpty) {
            return const Center(child: Text('No products available'));
          }

          final products = snapshot.data!.data;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              final shop = product.shop;

              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.network(
                    shop.image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error),
                  ),
                  title: Text(product.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Shop: ${shop.name}'),
                      Text('Price: ${product.price}'),
                      Text('Category: ${product.categories.name}'),
                    ],
                  ),
                  trailing: Icon(
                    product.inWishlist ? Icons.favorite : Icons.favorite_border,
                    color: product.inWishlist ? Colors.red : Colors.grey,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
