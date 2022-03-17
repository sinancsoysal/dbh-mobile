class SubExpenseDeckModel {
  final double rentedConstructionTools;
  final double rentedConstructionMachines;
  final double rentedConstructionMachines2;
  SubExpenseDeckModel({
    required this.rentedConstructionTools,
    required this.rentedConstructionMachines,
    required this.rentedConstructionMachines2,
  });

  double get sum =>
      rentedConstructionTools +
      rentedConstructionMachines +
      rentedConstructionMachines2;
}
