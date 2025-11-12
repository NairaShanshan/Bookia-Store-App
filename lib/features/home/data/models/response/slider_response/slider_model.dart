class SliderResponse {
  final Data? data;
  final String? message;
  final List<dynamic>? error;
  final int? status;

  SliderResponse({this.data, this.message, this.error, this.status});

  factory SliderResponse.fromJson(Map<String, dynamic> json) {
    return SliderResponse(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      message: json['message'],
      error: json['error'], // keep it as-is (null, [], or any list)
      status: json['status'],
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
  final List<SliderItem>? sliders;

  Data({this.sliders});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      sliders: json['sliders'] != null
          ? List<SliderItem>.from(
        json['sliders'].map((v) => SliderItem.fromJson(v)),
      )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sliders': sliders?.map((v) => v.toJson()).toList(),
    };
  }
}

class SliderItem {
  final String? image;

  SliderItem({this.image});

  factory SliderItem.fromJson(Map<String, dynamic> json) {
    return SliderItem(
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
    };
  }
}
