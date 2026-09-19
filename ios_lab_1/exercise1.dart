double processOrder({
  required String orderId,
  required double itemPrice,
  String? promoCode,
  double? deliveryFee,
}) {
  double discount = 0.0;
  if (promoCode == 'SAVE10') {
    discount = itemPrice * 0.10;
  }

  final double fee = deliveryFee ?? 500.0;
  final String promo = promoCode ?? 'none';
  final double total = itemPrice - discount + fee;

  print('Order ID: $orderId');
  print('Item price: $itemPrice ₸');
  print('Promo code: $promo');
  print('Discount: $discount ₸');
  print('Delivery fee: $fee ₸');
  print('Total: $total ₸');
  print('---');

  return total;
}

void main() {
  final double total1 = processOrder(
    orderId: 'ORD-1',
    itemPrice: 10000.0,
    promoCode: 'SAVE10',
  );

  final double total2 = processOrder(
    orderId: 'ORD-2',
    itemPrice: 8000.0,
  );

  final double total3 = processOrder(
    orderId: 'ORDER-3',
    itemPrice: 15000.0,
    promoCode: 'WRONG',
    deliveryFee: 1200.0,
  );

  print('Returned totals: $total1, $total2, $total3');
}