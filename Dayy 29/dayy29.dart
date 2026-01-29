class Prefect {
  final String name;
  int dutiesDone = 0;

  Prefect(this.name);
}

class Duty {
  final String name;

  Duty(this.name);
}

class DutyManager {
  final List<Prefect> _prefects = [];
  final List<Duty> _duties = [];
  final Map<String, String> _todayAssignments = {};

  void addPrefect(String name) {
    _prefects.add(Prefect(name));
  }

  void addDuty(String name) {
    _duties.add(Duty(name));
  }

  void assignDuties() {
    _todayAssignments.clear();

    _prefects.sort((a, b) => a.dutiesDone.compareTo(b.dutiesDone));

    int index = 0;
    for (var duty in _duties) {
      Prefect prefect = _prefects[index];
      _todayAssignments[duty.name] = prefect.name;
      prefect.dutiesDone++;
      index = (index + 1) % _prefects.length;
    }
  }

  void printAssignments() {
    for (var entry in _todayAssignments.entries) {
      print("${entry.key}: ${entry.value}");
    }
  }
}

void main() {
  DutyManager manager = DutyManager();

  manager.addPrefect("Ama");
  manager.addPrefect("Yaw");
  manager.addPrefect("Kojo");

  manager.addDuty("Assembly Ground");
  manager.addDuty("Dining Hall");
  manager.addDuty("Library");

  manager.assignDuties();
  manager.printAssignments();
}