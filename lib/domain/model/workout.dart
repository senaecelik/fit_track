

class Workout {
  final String id;
  final String name;
  final String time;
  final String day;

  Workout({
    required this.id,
    required this.name,
    required this.time,
    required this.day,
  });

  factory Workout.fromJson(Map<String, dynamic> json) {
    return Workout(
      id: json['id'],
      name: json["workoutName"],
      time: json["workoutTime"],
      day: json['day'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "workoutName": name,
        "workoutTime": time,
        "day": day,
      };
}
