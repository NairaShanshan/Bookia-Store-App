class OrderResponse {
  int id;
  String orderCode;
  String orderDate;
  String status;
  String total;

  OrderResponse({
    required this.id,
    required this.orderCode,
    required this.orderDate,
    required this.status,
    required this.total,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      id: json['id'],
      orderCode: json['order_code'],
      orderDate: json['order_date'],
      status: json['status'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'order_code': orderCode,
    'order_date': orderDate,
    'status': status,
    'total': total,
  };
}
