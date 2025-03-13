class ProductResponse {
  final bool success;
  final String message;
  final List<Product> data;

  ProductResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List)
          .map((product) => Product.fromJson(product))
          .toList(),
    );
  }
}

class Product {
  final String id;
  final bool onSale;
  final int salePercent;
  final int sold;
  final bool sliderNew;
  final bool sliderRecent;
  final bool sliderSold;
  final DateTime date;
  final String title;
  final Category categories;
  final SubCategory subcat;
  final Shop shop;
  final String price;
  final String saleTitle;
  final String salePrice;
  final String description;
  final String color;
  final String size;
  final bool inWishlist;
  final List<ImageModel> images;

  Product({
    required this.id,
    required this.onSale,
    required this.salePercent,
    required this.sold,
    required this.sliderNew,
    required this.sliderRecent,
    required this.sliderSold,
    required this.date,
    required this.title,
    required this.categories,
    required this.subcat,
    required this.shop,
    required this.price,
    required this.saleTitle,
    required this.salePrice,
    required this.description,
    required this.color,
    required this.size,
    required this.inWishlist,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] as String,
      onSale: json['on_sale'] as bool,
      salePercent: json['sale_percent'] as int,
      sold: json['sold'] as int,
      sliderNew: json['slider_new'] as bool,
      sliderRecent: json['slider_recent'] as bool,
      sliderSold: json['slider_sold'] as bool,
      date: DateTime.parse(json['date'] as String),
      title: json['title'] as String,
      categories: Category.fromJson(json['categories']),
      subcat: SubCategory.fromJson(json['subcat']),
      shop: Shop.fromJson(json['shop']),
      price: json['price'] as String,
      saleTitle: json['sale_title'] as String,
      salePrice: json['sale_price'] as String,
      description: json['description'] as String,
      color: json['color'] as String,
      size: json['size'] as String,
      inWishlist: json['in_wishlist'] as bool,
      images: (json['images'] as List)
          .map((image) => ImageModel.fromJson(image))
          .toList(),
    );
  }
}

class Category {
  final String id;
  final String type;
  final int salePercent;
  final DateTime date;
  final String name;
  final String image;

  Category({
    required this.id,
    required this.type,
    required this.salePercent,
    required this.date,
    required this.name,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'] as String,
      type: json['type'] as String,
      salePercent: json['sale_percent'] as int,
      date: DateTime.parse(json['date'] as String),
      name: json['name'] as String,
      image: json['image'] as String,
    );
  }
}

class SubCategory {
  final String id;
  final String type;
  final int salePercent;
  final DateTime date;
  final String name;

  SubCategory({
    required this.id,
    required this.type,
    required this.salePercent,
    required this.date,
    required this.name,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['_id'] as String,
      type: json['type'] as String,
      salePercent: json['sale_percent'] as int,
      date: DateTime.parse(json['date'] as String),
      name: json['name'] as String,
    );
  }
}

class Shop {
  final String id;
  final bool isActive;
  final DateTime createdAt;
  final String name;
  final String description;
  final String shopEmail;
  final String shopAddress;
  final String shopCity;
  final String userId;
  final String image;

  Shop({
    required this.id,
    required this.isActive,
    required this.createdAt,
    required this.name,
    required this.description,
    required this.shopEmail,
    required this.shopAddress,
    required this.shopCity,
    required this.userId,
    required this.image,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: json['_id'] as String,
      isActive: json['is_active'] as bool,
      createdAt: DateTime.parse(json['created_At'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
      shopEmail: json['shopemail'] as String,
      shopAddress: json['shopaddress'] as String,
      shopCity: json['shopcity'] as String,
      userId: json['userid'] as String,
      image: json['image'] as String,
    );
  }
}

class ImageModel {
  final String id;
  final String url;

  ImageModel({
    required this.id,
    required this.url,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'] as String,
      url: json['url'] as String,
    );
  }
}
