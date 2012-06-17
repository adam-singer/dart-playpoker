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
  playerHand.evaluate();

  computerHand.player = 0;
  computerHand.serveHand();
  if(debug){
    computerHand.lay();
  }
  computerHand.evaluate();
}