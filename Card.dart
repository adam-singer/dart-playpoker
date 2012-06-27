class Card {
  num s, r;
  Card(this.s,this.r){
    fdb('Served a ${this.nameOfCard()}');
  }

  String nameOfCard(){
    var suiteNames = ['Clubs','Diamonds','Hearts','Spades'];
    var rankNames = ['None','None', '2', '3', '4', '5', '6', '7','8', '9', '10', 'Jack', 'Queen', 'King','Ace'];
    return '${rankNames[this.r]} of ${suiteNames[this.s]}';
  }
}