enum UserRole{
  CLIENT,
  CONTRACTOR
}

enum ServiceType{
  plumbing,
  electrical,
  cleaning,
  painting,
  carpentry,
  applianceRepair,
}

extension ServiceTypeX on ServiceType {
  /// For UI
  String get label {
    switch (this) {
      case ServiceType.plumbing:
        return 'Plumbing';
      case ServiceType.electrical:
        return 'Electrical';
      case ServiceType.cleaning:
        return 'Cleaning';
      case ServiceType.painting:
        return 'Painting';
      case ServiceType.carpentry:
        return 'Carpentry';
      case ServiceType.applianceRepair:
        return 'Appliance Repair';
    }
  }

  /// For backend / API
  String get value => name; // matches Spring EnumType.STRING
}