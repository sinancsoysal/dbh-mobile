class CostControlCardModel {
  final String text;
  final double cost;
  final double direction;

  CostControlCardModel({
    required this.text,
    required this.cost,
    required this.direction,
  });

  static List<CostControlCardModel> get mockCardList => [
        CostControlCardModel(
          text: "Rental Equipment",
          cost: 1250,
          direction: -5.1,
        ),
        CostControlCardModel(
          text: "Fixture Equipment",
          cost: 3450,
          direction: -5.1,
        ),
        CostControlCardModel(
          text: "Market Purchases",
          cost: 2500,
          direction: -5.1,
        ),
        CostControlCardModel(
          text: "Construction Site Expenses",
          cost: 2500,
          direction: -5.1,
        )
      ];
}
