class PaymentMethodModel {
  final String id;
  final String type;
  final String label;
  final String? last4;
  final String? brand;
  final bool isDefault;

  PaymentMethodModel({required this.id, required this.type, required this.label, this.last4, this.brand, this.isDefault = false});
}
