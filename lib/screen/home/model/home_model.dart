class HomeModel {
  int? id;
  String? category;
  List? quotes =[];
  List? authors =[];

  HomeModel({
    this.id,
    this.category,
    this.quotes,
    this.authors,
  });

  factory HomeModel.mapToModel(Map m1) {
    return HomeModel(
      id: m1['id'],
      category: m1['category'],
      quotes: m1['quotes'],
      authors: m1['author'],
    );
  }
}
