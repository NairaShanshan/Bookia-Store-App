class CartResponse {
  CartResponse({
    this.data,
    this.message,
    this.error,
    this.status,
  });

  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  CartResponse.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    error = json['error'] != null ? List<dynamic>.from(json['error']) : [];
    status = json['status'] as int?;
  }

  CartResponse copyWith({
    Data? data,
    String? message,
    List<dynamic>? error,
    int? status,
  }) =>
      CartResponse(
        data: data ?? this.data,
        message: message ?? this.message,
        error: error ?? this.error,
        status: status ?? this.status,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data!.toJson();
    }
    map['message'] = message;
    if (error != null) {
      map['error'] = error;
    }
    map['status'] = status;
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.user,
    this.total,
    this.cartItems,
  });

  num? id;
  User? user;
  dynamic total;
  List<CartItems>? cartItems;

  Data.fromJson(dynamic json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    total = json['total'];
    if (json['cart_items'] != null) {
      cartItems = [];
      json['cart_items'].forEach((v) {
        cartItems!.add(CartItems.fromJson(v));
      });
    }
  }

  Data copyWith({
    num? id,
    User? user,
    String? total,
    List<CartItems>? cartItems,
  }) =>
      Data(
        id: id ?? this.id,
        user: user ?? this.user,
        total: total ?? this.total,
        cartItems: cartItems ?? this.cartItems,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (user != null) {
      map['user'] = user!.toJson();
    }
    map['total'] = total;
    if (cartItems != null) {
      map['cart_items'] = cartItems!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CartItems {
  CartItems({
    this.itemId,
    this.itemProductId,
    this.itemProductName,
    this.itemProductImage,
    this.itemProductPrice,
    this.itemProductDiscount,
    this.itemProductPriceAfterDiscount,
    this.itemProductStock,
    this.itemQuantity,
    this.itemTotal,
  });

  int? itemId;
  int? itemProductId;
  String? itemProductName;
  String? itemProductImage;
  String? itemProductPrice;
  int? itemProductDiscount;
  double? itemProductPriceAfterDiscount;
  int? itemProductStock;
  int? itemQuantity;
  double? itemTotal;

  CartItems.fromJson(dynamic json) {
    itemId = json['item_id'];
    itemProductId = json['item_product_id'];
    itemProductName = json['item_product_name'];
    itemProductImage = json['item_product_image'];
    itemProductPrice = json['item_product_price'];
    itemProductDiscount = json['item_product_discount'];

    // ✅ تحويل آمن للـ double
    itemProductPriceAfterDiscount =
    json['item_product_price_after_discount'] != null
        ? (json['item_product_price_after_discount'] as num).toDouble()
        : null;

    itemProductStock = json['item_product_stock'];
    itemQuantity = json['item_quantity'];

    // ✅ تحويل آمن للـ double
    itemTotal = json['item_total'] != null
        ? (json['item_total'] as num).toDouble()
        : null;
  }

  CartItems copyWith({
    int? itemId,
    int? itemProductId,
    String? itemProductName,
    String? itemProductImage,
    String? itemProductPrice,
    int? itemProductDiscount,
    double? itemProductPriceAfterDiscount,
    int? itemProductStock,
    int? itemQuantity,
    double? itemTotal,
  }) =>
      CartItems(
        itemId: itemId ?? this.itemId,
        itemProductId: itemProductId ?? this.itemProductId,
        itemProductName: itemProductName ?? this.itemProductName,
        itemProductImage: itemProductImage ?? this.itemProductImage,
        itemProductPrice: itemProductPrice ?? this.itemProductPrice,
        itemProductDiscount: itemProductDiscount ?? this.itemProductDiscount,
        itemProductPriceAfterDiscount:
        itemProductPriceAfterDiscount ?? this.itemProductPriceAfterDiscount,
        itemProductStock: itemProductStock ?? this.itemProductStock,
        itemQuantity: itemQuantity ?? this.itemQuantity,
        itemTotal: itemTotal ?? this.itemTotal,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_id'] = itemId;
    map['item_product_id'] = itemProductId;
    map['item_product_name'] = itemProductName;
    map['item_product_image'] = itemProductImage;
    map['item_product_price'] = itemProductPrice;
    map['item_product_discount'] = itemProductDiscount;
    map['item_product_price_after_discount'] = itemProductPriceAfterDiscount;
    map['item_product_stock'] = itemProductStock;
    map['item_quantity'] = itemQuantity;
    map['item_total'] = itemTotal;
    return map;
  }
}

class User {
  User({
    this.userId,
    this.userName,
  });

  num? userId;
  String? userName;

  User.fromJson(dynamic json) {
    userId = json['user_id'];
    userName = json['user_name'];
  }

  User copyWith({
    num? userId,
    String? userName,
  }) =>
      User(
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['user_name'] = userName;
    return map;
  }
}
