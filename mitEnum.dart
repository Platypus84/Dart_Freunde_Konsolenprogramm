import "dart:io";

//Enum für die Reiseroute
enum Transportmittel { auto, zug, fahrrad, bus }

void main() {
  // Reiseroute mit Distanzen
  Map<String, int> reiseroute = {
    "Max": 120,
    "Peter": 90,
    "Anna": 270,
    "Lena": 85,
  };

  // Transportmittel-Geschwindigkeiten
  Map<String, int> transportSpeeds = {
    Transportmittel.auto.name: 90,
    Transportmittel.zug.name: 120,
    Transportmittel.fahrrad.name: 20,
    Transportmittel.bus.name: 60,
  };

  // Distanzen zwischen den Freunden
  Map<String, Map> distances = {
    'Max': {'Ich': 120, 'Peter': 80, 'Anna': 70, 'Lena': 30},
    'Peter': {'Ich': 90, 'Max': 80, 'Anna': 45, 'Lena': 50},
    'Anna': {'Ich': 270, 'Peter': 45, 'Max': 70, 'Lena': 25},
    'Lena': {'Ich': 85, 'Peter': 50, 'Anna': 25, 'Max': 30},
  };

  final String? typeOfTransport;
  int? speed = 0;

  // Auswahl des Transportmittels
  // Transportmittel mittel = Transportmittel.fahrrad; // Standardwert
  // Geschwindigkeit fest int geschwindigkeit = 0; // km/h

  // Eingabe der Entfernung zu einem Freund
  print("Gib deinen Namen an:");

  String? inputUserName = stdin.readLineSync();

  // Eingabe der Entfernung zu einem Freund
  print(
    "Gib einen Namen deiner Freunde (Max, Peter, Anna, Lena) ein, um die Entfernung anzuzeigen:",
  );
  String? inputName = stdin.readLineSync();

  bool nameExists = distances.containsKey(inputName);
  if (nameExists) {
    String? friendName = inputName;
    int distance = distances[friendName][inputUserName];
    print(
      "Die Distanz zwischen dir ($inputUserName) und $friendName beträgt $distance km/h.",
    );
  } else {
    print(
      "Deine Eingabe ist nicht korrekt. Es können nur Max, Peter, Anna oder Lena als Begriff eingegeben werden.",
    );
  }

  // Eingabe der Geschwindigkeit
  print("Bitte gib die Geschwindigkeit in km/h ein:");
  String? eingabe = stdin.readLineSync();

  int geschwindigkeit = int.parse(eingabe ?? "90");

  // Eingabe des Verkehrsmittel
  print(
    "Bitte gib dein gewünschtes Verkehrsmittel ein (Auto/Zug/Fahrrad/Bus):",
  );

  String? inputTypeOfTransport = stdin.readLineSync();

  // for (var transportType in transportSpeeds.entries) {
  //   print(
  //     "Transportmittel: ${transportType.key} und Transportgeschwindigkeit: ${transportType.value}",
  //   );
  // }

  bool keyExists = transportSpeeds.containsKey(inputTypeOfTransport);
  if (keyExists) {
    typeOfTransport = inputTypeOfTransport;
    speed = transportSpeeds[typeOfTransport];
    print(
      "Du fährst mit dem $typeOfTransport und seine Geschwindigkeit ist $speed km/h.",
    );
  } else {
    print(
      "Deine Eingabe ist nicht korrekt. Es können nur Auto, Zug, Fahrrad oder Bus als Begriff eingegeben werden.",
    );
  }

  //Eingabe der Geschwindigkeit
  //print("Bitte gib die Geschwindigkeit in km/h ein:");
  //String? eingabe = stdin.readLineSync();
  //int geschwindigkeit = int.parse(eingabe ?? "90");

  //Fahrzeitberechnung
  double zeitMax = reiseroute["Max"]! / speed!; // Zeit für Max
  double zeitPeter = reiseroute["Peter"]! / speed!; // Zeit für Peter
  double zeitAnna = reiseroute["Anna"]! / speed!; // Zeit für Anna

  //Gesamtdistanz und Fahrzeit
  int gesamtKm =
      reiseroute["Max"]! +
      reiseroute["Peter"]! +
      reiseroute["Anna"]!; // Gesamtdistanz
  double gesamtZeit = zeitMax + zeitPeter + zeitAnna;
  //Ausgabe der Ergebnisse
  print("Deine Reiseroute bei $speed km/h:");
  // print(
  //   "Transportmittel: ${Transportmittel[0].toUpperCase() + typeOfTransport.substring(1)}",
  // );
  print("1. Max: ${reiseroute["Max"]} km, Zeit: ${zeitMax} Stunden");
  print(
    "2. Peter: ${reiseroute["Peter"]} km, Zeit: ${zeitPeter.toStringAsFixed(2)} Stunden",
  );
  print(
    "3. Anna: ${reiseroute["Anna"]} km, Zeit: ${zeitAnna.toStringAsFixed(2)} Stunden",
  );
  print("Gesamtdistanz: $gesamtKm km");
  print("Gesamtfahrzeit: ${gesamtZeit.toStringAsFixed(2)} Stunden");
}
