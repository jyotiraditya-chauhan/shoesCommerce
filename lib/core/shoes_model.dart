class ShoesModel {
  final String id; // Unique identifier for the shoesModel
  final String name; // Name of the shoesModel (e.g., "Nike Jordan")
  final String brand; // Brand of the shoesModel (e.g., "Nike", "Puma")
  final String category; // Category/Tag (e.g., "Best Seller", "Best Choice")
  final double price; // Price of the shoesModel
  final String imageUrl; // URL or asset path to the shoesModel image
  final String? offer; // Optional offer text (e.g., "Grab the best offer in this 30%")
  final String gender; // Gender category (e.g., "Men", "Women", "Unisex")
  final List<String> availableSizes; // List of available sizes (e.g., ["UK 4.4", "US 5.5"])
  final bool inStock; // Availability status

  ShoesModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.category,
    required this.price,
    required this.imageUrl,
    this.offer,
    required this.gender,
    required this.availableSizes,
    this.inStock = true, // Default to true if not specified
  });

  // Optional: Convert to JSON for storage or API integration
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'category': category,
      'price': price,
      'imageUrl': imageUrl,
      'offer': offer,
      'gender': gender,
      'availableSizes': availableSizes,
      'inStock': inStock,
    };
  }

  // Optional: Create from JSON
  factory ShoesModel.fromJson(Map<String, dynamic> json) {
    return ShoesModel(
      id: json['id'] as String,
      name: json['name'] as String,
      brand: json['brand'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      offer: json['offer'] as String?,
      gender: json['gender'] as String,
      availableSizes: List<String>.from(json['availableSizes'] as List),
      inStock: json['inStock'] as bool? ?? true,
    );
  }
}