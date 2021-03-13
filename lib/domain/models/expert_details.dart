class ExpertDetails {
  final List<ExpertDetailsTime> times;

  ExpertDetails(
      {required List<ExpertDetailsTime> times})
      : this.times = times;
}

class ExpertDetailsTime{
  final String localTime;
  final bool isAvailable;
  ExpertDetailsTime({required String time, required bool available}):
      this.localTime = time,
      this.isAvailable = available;

}
