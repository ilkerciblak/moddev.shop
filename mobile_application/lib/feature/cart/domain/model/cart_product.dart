final class CartProduct {
  final int identifier;
  final String title;
  final double price;
  final int quantity;
  final double totalPrice;
  final double discountPercentage;
  final int discountedTotalPrice;
  final String thumbnail;

  CartProduct({
    required this.identifier,
    required this.title,
    required this.price,
    required this.quantity,
    required this.totalPrice,
    required this.discountPercentage,
    required this.discountedTotalPrice,
    required this.thumbnail,
  });
}
