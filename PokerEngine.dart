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
  Hand playerHand=new Hand(1,servedCards[0],servedCards[1],servedCards[2],servedCards[3],servedCards[4],'Not set');
}

Card pickCard(){
  int rnd, randomSuite, randomRank;
  rnd = new Date.now().value;
  randomSuite = ((rnd/(255*Math.random())).toInt()) %4;
  rnd = new Date.now().value;
  randomRank = ((rnd/(255*Math.random())).toInt()) %14;
      if(randomRank==0){randomRank++;}
  Card giveCard = new Card(randomSuite,randomRank);
  return giveCard;
}