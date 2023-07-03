import '../models/bubo_category.dart';
///
/// This file provides the original category data
///

/// Original labels in german and bulgarian, english added as last value
const labels = [
  ["1", "AaronWanBissaka", "AaronWanBissaka", "AaronWanBissaka", "AaronWanBissaka"],
  ["2", "AnthonyMartial", "AnthonyMartial", "AnthonyMartial", "AnthonyMartial"],
  ["3", "Antony", "Antony", "Antony", "Antony"],
  ["4", "BrunoFernandes", "BrunoFernandes", "BrunoFernandes", "BrunoFernandes"],
  ["5", "Casemiro", "Casemiro", "Casemiro", "Casemiro"],
  ["6", "ChristianEriksen", "ChristianEriksen", "ChristianEriksen", "ChristianEriksen"],
  ["7", "DavidDeGea", "DavidDeGea", "DavidDeGea", "DavidDeGea"],
  ["8", "JadonSancho", "JadonSancho", "JadonSancho", "JadonSancho"],
  ["9", "LukeShaw", "LukeShaw", "LukeShaw", "LukeShaw"],
  ["10", "RaphaëlVarane", "RaphaëlVarane", "RaphaëlVarane", "RaphaëlVarane"],
  ["11", "VictorLindelöf", "VictorLindelöf", "VictorLindelöf", "VictorLindelöf"],
  ["12", "EricBailly", "EricBailly", "EricBailly", "EricBailly"],
  ["13", "Fred", "Fred", "Fred", "Fred"],
  ["14", "TedenMeng", "TedenMeng", "TedenMeng", "TedenMeng"],
  ["15", "BrandonWiliams", "BrandonWiliams", "BrandonWiliams", "BrandonWiliams"],
  ["16", "Amad", "Amad", "Amad", "Amad"],
  ["17", "ScottMcTominay", "ScottMcTominay", "ScottMcTominay", "ScottMcTominay"],
  ["18", "TomHeaton", "TomHeaton", "TomHeaton", "TomHeaton"]
];

///
/// Labels transformed into BuboCategories
///
/// This list can be used in the application for rendering the categories
///
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