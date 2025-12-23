enum CategoryFieldType {
  select,
  number,
  text,
  unknown;

  static CategoryFieldType fromString(String? value) {
    switch (value) {
      case 'select':
        return CategoryFieldType.select;
      case 'number':
        return CategoryFieldType.number;
      case 'text':
        return CategoryFieldType.text;
      default:
        return CategoryFieldType.unknown;
    }
  }
}
