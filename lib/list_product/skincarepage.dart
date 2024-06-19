import 'package:flutter/material.dart';
import 'package:haupcartest/statemanagement/provider/Product_provider.dart';
import 'package:provider/provider.dart';

class SkincarePage extends StatelessWidget {
  final String category;

  SkincarePage({required this.category});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Productprovider>(context, listen: false);
    provider.fetchProductsSkincare();

    return Scaffold(
      appBar: AppBar(
        title: Text('Category $category'),
      ),
      body: Consumer<Productprovider>(
        builder: (context, provider, child) {
          if (provider.productSkinCareList.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: provider.productSkinCareList.length,
              itemBuilder: (context, index) {
                final product = provider.productSkinCareList[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(product.title ?? 'No Title'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.description ?? 'No Description'),
                        Text(
                            'Price: \$${product.price?.toStringAsFixed(2) ?? 'N/A'}'),
                        Text("Rating: ${product.rating}")
                      ],
                    ),
                    leading: Image.network(
                      product.thumbnail ?? '',
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
