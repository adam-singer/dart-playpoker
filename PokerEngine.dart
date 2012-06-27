void newHand(){
  /*
    nasty workaround (see Hand.dart:8)
  */
  Hand.notInDeck = '';
  
  Hand playerHand = new Hand();
  Hand computerHand = new Hand();
  
  
  
  
  
  playerHand.player = 1;
  playerHand.serveHand();
  playerHand.lay();

  computerHand.player = 0;
  computerHand.serveHand();
  if(debug){
    computerHand.lay();
  }

  playerHand.evaluate();

  computerHand.evaluate();
  
  
  
}

void unitTestNewHand(){
  
  Hand.notInDeck = '';
  
  Hand playerHand = new Hand();
  Hand computerHand = new Hand();
  
  playerHand.player = 1;

  Card diamonds1 = new Card(1,1);
  
  Card diamonds2 = new Card(1,13);
  
  Card diamonds3 = new Card(1,10);
  
  Card diamonds4 = new Card(1,12);
  
  Card diamonds5 = new Card(1,11);
  
  playerHand.slot1=diamonds1;
  playerHand.slot2=diamonds2;
  playerHand.slot3=diamonds3;
  playerHand.slot4=diamonds4;
  playerHand.slot5=diamonds5;
  
  playerHand.lay();

  computerHand.player = 0;
  computerHand.serveHand();
  if(debug){
    computerHand.lay();
  }

  playerHand.evaluate();

  computerHand.evaluate();
  
}