class AppPricingCalculator {
  /// Calculates total price including tax and shipping
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    double shippingCost = getShippingCost(location);
    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  /// Calculates shipping cost as a string with 2 decimals
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  /// Calculates tax as a string with 2 decimals
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  /// Example tax rate lookup function
  static double getTaxRateForLocation(String location) {
    // Placeholder logic — use real lookup/API
    return 0.10; // 10% tax rate
  }

  /// Example shipping cost lookup function
  static double getShippingCost(String location) {
    // Placeholder logic — use real logic/API
    return 5.00; // Flat $5 shipping cost
  }

  /// Calculates total price for all items in a cart
  static double calculateCartTotal(List<double> itemPrices) {
    return itemPrices.fold(0.0, (total, price) => total + price);
  }
}
