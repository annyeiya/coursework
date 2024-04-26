class Building {
  static final Map<String, String> jsonFiles = {
    'start' : "start",
    '3б' : "ThirdB",
    '3а' : "ThirdA"
 };

  static final Map<String, List<Object>> naming = {
    '3б' : [ "Корпус 3бв", thirdB ],
    '3а': [ "Корпус 3а", thirdA]
  };

  static const String start = 'assets/img/вся_карта.jpg';

  static final Map<String, String> thirdB = {
    '1': 'Без_имени',
    '2': '2-3б',
    '3': '3-3б',
    '4': 'пригодится',
    '5': 'пригодится',
    '6': 'пригодится',
    '7': 'пригодится',
    '8': 'пригодится',
    '9': 'пригодится',
    '10': 'пригодится',
  };

  static final Map<String, String> thirdA = {
    '1': 'три_а',
    '2': '2-3а',
    '3': '3-3а',
    '4': 'пригодится',
    '5': 'пригодится',
    '6': 'пригодится',
  };

  //TODO
}