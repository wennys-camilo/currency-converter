class Currencies {
  double dolar;
  double euro;
  Currencies({
    required this.dolar,
    required this.euro,
  });

  factory Currencies.fromMap(Map<String, dynamic> map) {
    return Currencies(
      dolar: map['USD']['buy']?.toDouble() ?? 0.0,
      euro: map['EUR']['buy']?.toDouble() ?? 0.0,
    );
  }

  @override
  String toString() => 'Currencies(dolar: $dolar, euro: $euro)';
}
