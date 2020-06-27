void disphome() {
  fill(255);  
  //ボタン
  rect(50, 150, 340, 300);
  rect(0, 500, 240, 70);
  rect(240, 500, 240, 70);
  rect(0, 570, 240, 70);
  rect(240, 570, 240, 70);
  //ボタン上テキスト
  fill(0);
  text("Calender", 45, 550);
  text("Timer", 300, 550);
  text("Weather", 55, 620);
  text("ShutDown", 280, 620);
  //年月日時間
  textSize(52);
  text(now(), 30, 120);
  text(nowday(), 20, 70); 
  //todoリスト
  textSize(32);
  text("ToDo", 70, 190);
  todo();
  if (hour()==0&&minute()==0&&second()==0) {
    for (int i=0; i<=todo.length; i++) {
      doflag[i]=false;
    }
  }
}

//todoリスト//////////////////////////////
int todo() {
  textSize(32);
  int i;
  for (i=0; i<=todo.length-1; i++) {
    fill(0);
    text(todo[i], 100, 40*(i+1)+190);
    fill(255);
    rect(70, 40*(i+1)+170, 20, 20);
    if (doflag[i]==true) {
      line(70, 40*(i+1)+170, 80, 40*(i+1)+190);
      line(80, 40*(i+1)+190, 100, 40*(i+1)+160);
    }
  }
  return i;
}
