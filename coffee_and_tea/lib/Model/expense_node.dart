import 'dart:math';

abstract class Node{
  String? description;
  String? flavour; //TODO: make Flavour class
  int getDepth();
}

class Expense implements Node{
  double amount = 0;

  @override
  String? description;
  @override
  String? flavour;

  Expense({required this.amount, this.description, this.flavour});

  //TODO: TEST ME
  ExpenseGroup toGroup(){
    Expense newChild = Expense(
      amount: this.amount, 
      description: "${this.description} child",
      flavour: this.flavour
      );
    
    return ExpenseGroup(
      children: [newChild],
      description: this.description,
      flavour: this.flavour
    );
  }

  @override
  int getDepth(){
    return 0;
  }

}

class ExpenseGroup implements Node{
  //children list is non-nullable, why would you make a aggregator if there is no children?
  List children = []; // why List<Node> screw things up?
  @override
  String? description;
  @override
  String? flavour;

  ExpenseGroup({required this.children, this.description, this.flavour});
  
  //TODO: TEST ME
  void addChild(Node child){
    children.add(child);
  }

  //TODO: TEST ME
  @override
  int getDepth(){
    int children_depth = 0;
    for(Node node in this.children){
      children_depth = max(children_depth, node.getDepth());
    }

    return children_depth+1;
  }
  
  //TODO: TEST ME
  double getTotalAmount(){
    double total = 0;

    for(Node node in this.children){
      if (node is Expense){
        total += node.amount;
      }
      else if(node is ExpenseGroup){
        total += node.getTotalAmount();
      }
    }

    return total;
  }

}
