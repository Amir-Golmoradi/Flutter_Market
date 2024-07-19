class HomeModel {
  HomeModel.fromJson(dynamic json) {
    topBanner = json['top_banner'] != null
        ? TopBanner.fromJson(json['top_banner'])
        : null;

    if (json['sliders'] != null) {
      sliders = [];
      json['sliders'].forEach((dynamic value) {
        sliders?.add(Sliders.fromJson(value));
      });
    }
    if (json['category_banner'] != null) {
      categoryBanner = [];
      json['category_banner'].forEach((dynamic value) {
        categoryBanner?.add(CategoryBanner.fromJson(value));
      });
    }
  }
  TopBanner? topBanner;
  List<Sliders>? sliders;
  List<CategoryBanner>? categoryBanner;
}

class TopBanner {
  TopBanner({required this.link, required this.image, required this.type});

  TopBanner.fromJson(dynamic json) {
    link = json['link'].toString();
    image = json['image'].toString();
    type = json['type'].toString();
  }
  String? link;
  String? image;
  String? type;
}

class Sliders {
  Sliders({required this.image, required this.link, required this.id});

  Sliders.fromJson(dynamic json) {
    image = json['image'].toString();
    link = json['link'].toString();
    id = int.parse(json['id'].toString());
  }
  String? image;
  String? link;
  int? id;
}

class CategoryBanner {
  CategoryBanner(this.link, this.image);

  CategoryBanner.fromJson(dynamic json) {
    link = json['link'].toString();
    image = json['image'].toString();
  }
  String? link;
  String? image;
}
