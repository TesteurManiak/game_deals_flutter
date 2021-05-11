import 'package:maniak_game_deals/extensions/extensions.dart' show IntModifier;

class _StoreImages {
  final String? banner;
  final String? logo;
  final String? icon;

  String? get bannerUrl => banner != null ? 'assets$banner' : null;

  String? get logoUrl => logo != null ? 'assets$logo' : null;

  String? get iconUrl => icon != null ? 'assets$icon' : null;

  _StoreImages({required this.banner, required this.logo, required this.icon});

  factory _StoreImages.fromJson(Map<String, dynamic> json) => _StoreImages(
        banner: json['banner'],
        logo: json['logo'],
        icon: json['icon'],
      );
}

class StoreModel {
  final String storeID;
  final String storeName;
  final bool isActive;
  final _StoreImages? images;

  StoreModel({
    required this.storeID,
    required this.storeName,
    required this.isActive,
    required this.images,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        storeID: json['storeID'],
        storeName: json['storeName'],
        isActive: (json['isActive'] as int).toBool(),
        images: _StoreImages.fromJson(json['images']),
      );
}
