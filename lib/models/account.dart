class Account {
  final String name;
  final String address;
  final bool isSelected;

  Account({
    required this.name,
    required this.address,
    this.isSelected = false,
  });

  Account copyWith({
    String? name,
    String? email,
    bool? isSelected,
  }) {
    return Account(
      name: name ?? this.name,
      address: address,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
