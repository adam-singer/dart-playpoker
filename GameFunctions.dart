void serveHand(int player){
  List servedCards=new List();
  List servedPlainCards =  new List();
  while(servedCards.length<5){
    Card receivedCard = pickCard();
    if(servedPlainCards.indexOf('${receivedCard.s},${receivedCard.r}')==-1){
      servedPlainCards.add('${receivedCard.s},${receivedCard.r}');
      servedCards.add(receivedCard);
      }
    }

  Hand playerHand=new Hand(1,servedCards[0],servedCards[1],servedCards[2],servedCards[3],servedCards[4]);
  playerHand.lay();
}

Card pickCard(){
  int randGenerator=new Random();
  int randomSuite = randGenerator.nextInt(4);
  int randomRank = randGenerator.nextInt(13);
  Card giveCard = new Card(randomSuite,randomRank);
  return giveCard;
}