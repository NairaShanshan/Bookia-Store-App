class BestSellerResponse {
  final Data? data;
  final String? message;
  final List<dynamic>? error;
  final int? status;

  BestSellerResponse({
    this.data,
    this.message,
    this.error,
    this.status,
  });

  factory BestSellerResponse.fromJson(Map<String, dynamic> json) {
    return BestSellerResponse(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      message: json['message'] as String?,
      error: json['error'] != null ? List<dynamic>.from(json['error']) : [],
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.toJson(),
      'message': message,
      'error': error,
      'status': status,
    };
  }
}

class Data {
  final List<Product>? products;

  Data({this.products});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      products: json['products'] != null
          ? (json['products'] as List)
          .map((e) => Product.fromJson(e))
          .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products?.map((e) => e.toJson()).toList(),
    };
  }
}

class Product {
  final int? id;
  final String? name;
  final String? description;
  final String? price;
  final int? discount;
  final double? priceAfterDiscount;
  final int? stock;
  final int? bestSeller;
  final String? image;
  final String? category;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.priceAfterDiscount,
    this.stock,
    this.bestSeller,
    this.image,
    this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      discount: json['discount'] as int?,
      priceAfterDiscount:
      (json['price_after_discount'] as num?)?.toDouble(),
      stock: json['stock'] as int?,
      bestSeller: json['best_seller'] as int?,
      image: json['image'] as String?,
      category: json['category'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'price_after_discount': priceAfterDiscount,
      'stock': stock,
      'best_seller': bestSeller,
      'image': image,
      'category': category,
    };
  }
}
