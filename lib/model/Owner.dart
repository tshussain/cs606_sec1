

class Owner {
  int id;
  String name;

  Owner(this.name, this.id);

  Owner.generate(this.name) {
    DateTime now = DateTime.now();
    this.id = now.hashCode;
  }
}