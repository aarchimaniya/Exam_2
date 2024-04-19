class StudentData {
  String std_name;
  String std_grid;
  String std_standard;
  String std_image;

  StudentData({
    required this.std_name,
    required this.std_grid,
    required this.std_standard,
    required this.std_image,
  });

  factory StudentData.fromMap(Map<String, dynamic> data) {
    return StudentData(
      std_name: data['name'],
      std_grid: data['grid'],
      std_standard: data['std'],
      std_image: data['image'],
    );
  }
}
