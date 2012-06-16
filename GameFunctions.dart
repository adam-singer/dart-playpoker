

void serveHand(int player){
  List servedCards=new List();
  for(var i = 0;i<5;i++){
    servedCards.add(pickCard());
}
  Hand playerHand=new Hand(1,servedCards[0],servedCards[1],servedCards[2],servedCards[3],servedCards[4]);
  playerHand.lay();
}

Card pickCard(){
  var randGenerator=new Random();
  num randomSuite = randGenerator.nextInt(4);
  num randomRank = randGenerator.nextInt(13);
  Card giveCard = new Card(randomSuite,randomRank);
  return giveCard;
}