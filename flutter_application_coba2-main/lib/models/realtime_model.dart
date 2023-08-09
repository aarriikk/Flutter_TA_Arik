class Downtime {
  final int machineId;
  final int status;
  DateTime? downTimeStartTime;

  Downtime(
      {required this.machineId, required this.status, this.downTimeStartTime});

  factory Downtime.fromMap(Map<String, dynamic> map) {
    return Downtime(
        machineId: map['machine_id'],
        status: map['status'],
        downTimeStartTime: map['downTimeStartTime']);
  }
}

class Quantity {
  final int machineId;
  final int value;

  Quantity({
    required this.machineId,
    required this.value,
  });

  factory Quantity.fromMap(Map<String, dynamic> map) {
    return Quantity(
      machineId: map['machine_id'],
      value: map['value'],
    );
  }
}

class Energy {
  final double value;
  final String createdAt;

  Energy({
    required this.value,
    required this.createdAt,
  });

  factory Energy.fromMap(Map<String, dynamic> map) {
    return Energy(
      value: map['machine_id'],
      createdAt: map['value'],
    );
  }
}

class Kwh {
  final double value;
  final String createdAt;

  Kwh({
    required this.value,
    required this.createdAt,
  });

  factory Kwh.fromMap(Map<String, dynamic> map) {
    return Kwh(
      value: map['machine_id'],
      createdAt: map['value'],
    );
  }
}
