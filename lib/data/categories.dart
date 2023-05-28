import '../models/bubo_category.dart';


const labels = [
  ["1", "DavidDeGea", "DavidDeGea", "DavidDeGea",],
  ["2", "VictorLindelöf", "VictorLindelöf", "VictorLindelöf"],
  ["3", "RaphaëlVarane", "RaphaëlVarane", "RaphaëlVarane"],
  ["4", "LukeShaw", "LukeShaw", "LukeShaw"],
  ["5", "AaronWanBissaka", "AaronWanBissaka", "AaronWanBissaka"],
  ["6", "BrunoFernandes", "BrunoFernandes", "BrunoFernandes"],
  ["7", "ChristianEriksen", "ChristianEriksen", "ChristianEriksen"],
  ["8", "Casemiro", "Casemiro", "Casemiro"],
  ["9", "Antony", "Antony", "Antony"],
  ["10", "JadonSancho", "JadonSancho", "JadonSancho"],
  ["11", "AnthonyMartial", "AnthonyMartial", "AnthonyMartial"],
];

List<BuboCategory> buboCategories = labels.map((categoryLabels) {
  return BuboCategory(
      int.parse(categoryLabels[0]),
      'assets/categories/player_${categoryLabels[1].toLowerCase().replaceAll(' ', '_')}@3x.png',
      {
        'us': categoryLabels[3],
        'de': categoryLabels[1],
        'bg': categoryLabels[2]
      });
}).toList();
