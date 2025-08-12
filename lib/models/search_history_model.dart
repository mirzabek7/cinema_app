class SearchHistoryModel {
  final int id;
  final String title;

  SearchHistoryModel({required this.id, required this.title});

  factory SearchHistoryModel.fromJson(Map<String, dynamic> json) {
    return SearchHistoryModel(id: json['id'], title: json['title']);
  }

  Map<String, dynamic> toJson() {
    return {'title': title};
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SearchHistoryModel && other.title == title;
  }
}
