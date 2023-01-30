String? validateValueIsEmpty(
  String? value, {
  String errorMessage = 'This field is required',
}) {
  if (value == null || value.isEmpty) {
    return errorMessage;
  }
  return null;
}
