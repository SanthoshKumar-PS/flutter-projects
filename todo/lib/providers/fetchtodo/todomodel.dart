
class TodoModel{
  final String id;
  final String userId;
  final String category;
  final String title;
  final String description;
  final String notes;
  final String status;
  TodoModel({required this.id,required this.userId,required this.category,required this.title,required this.description,required this.notes,required this.status});

  factory TodoModel.fromJson(Map<String,dynamic> json){
    return TodoModel(
        id: json['_id'],
        userId: json['userId'],
        category: json['category'],
        title: json['title'],
        description: json['description'],
        notes: json['notes'],
        status: json['status']
    );
  }

    Map<String,dynamic> toJson(){
      return {
        'id': id,
        'userId':userId,
        'category':category,
        'title': title,
        'description': description,
        'notes':notes,
        'status': status
      };
  }
}