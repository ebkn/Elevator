//background.pde
//1,背景を描画
//2,ドアを描画

//フロア、エレベーター内を描画する
void back() {
  background(darkkhaki);
  //フロアなら
  if (scene==0 || scene==2) {
    if (myfloor==1) {  //1階
      ////床(サイド)
      stroke(0);
      strokeWeight(1);
      fill(200);
      quad(x-140, y+180, x-300, height, x+300, height, x+140, y+180);
      fill(250);
      quad(x-154, y+200, x+154, y+200, x+174, y+230, x-174, y+230);
      quad(x-194, y+260, x+194, y+260, x+220, y+300, x-220, y+300);
      quad(x-247, y+340, x+247, y+340, x+276, y+385, x-276, y+385);
      ////床(真ん中)
      fill(200);
      quad(x-100, y+180, x+100, y+180, x+108, y+196, x-108, y+196);
      quad(x-108, y+196, x+108, y+196, x+125, y+228, x-125, y+228);
      quad(x-125, y+228, x+125, y+228, x+150, y+275, x-150, y+275);
      quad(x-150, y+275, x+150, y+275, x+183, y+345, x-183, y+345);
      quad(x-183, y+345, x+183, y+345, x+220, height, x-220, height);
      line(x, y+180, x, height);
      ////奥の窓
      stroke(0);
      strokeWeight(2);
      fill(landscape);
      rect(x-130, y-50, x+130, y+180);
      fill(khaki);
      rect(x-130, y+120, x+130, y+180);    
      strokeWeight(10);
      line(x-130, y, x+130, y);
      strokeWeight(2);
      rect(x-30, y-100, x+30, y+175);
      fill(0);
      rect(x-30, y+175, x+30, y+180);
      ////左サイド
      stroke(0);
      strokeWeight(2);
      fill(khaki);
      quad(x-130, y-80, x-130, y+180, x-158, y+225, x-158, y-110);
      fill(darkkhaki);
      quad(x-158, y-110, x-158, y+225, x-190, y+225, x-190, y-110);
      fill(khaki);
      quad(x-170, y-110, x-170, y+250, x-220, y+330, x-220, y-130);
      fill(darkkhaki);
      quad(x-220, y-130, x-220, y+330, x-260, y+330, x-260, y-130);
      quad(x-240, y-130, x-240, y+330, x-260, y+360, x-260, y-140);
      fill(khaki);
      beginShape();
      vertex(x-260, y-160);
      vertex(x-260, y+380);
      vertex(x-285, height);
      vertex(0, height);
      vertex(0, 0);
      vertex(x-285, 0);
      vertex(x-260, y-160);
      endShape();
      ////右サイド
      quad(x+130, y-80, x+130, y+180, x+158, y+225, x+158, y-110);
      fill(darkkhaki);
      quad(x+158, y-110, x+158, y+225, x+190, y+225, x+190, y-110);
      fill(khaki);
      quad(x+170, y-110, x+170, y+250, x+220, y+330, x+220, y-130);
      fill(darkkhaki);
      quad(x+220, y-130, x+220, y+330, x+260, y+330, x+260, y-130);
      quad(x+240, y-130, x+240, y+330, x+260, y+360, x+260, y-140);
      fill(khaki);
      beginShape();
      vertex(x+260, y-160);
      vertex(x+260, y+380);
      vertex(x+285, height);
      vertex(width, height);
      vertex(width, 0);
      vertex(x+285, 0);
      vertex(x+260, y-160);
      endShape();
      ////窓の上の部分
      fill(khaki);
      rect(x-150, y-100, x+150, y-50);
      fill(darkkhaki);
      quad(x-150, y-50, x+150, y-50, x+140, y-40, x-140, y-40);
      ////////////////////////////////////////////////////////////
    } else if (myfloor>=2 && myfloor<=6) {                              //2から6階

      ////床
      stroke(0);
      strokeWeight(1);
      fill(230);
      quad(x-140, y+180, x-300, height, x+300, height, x+140, y+180);
      fill(120);
      quad(x-140, y+180, x+140, y+180, x+143, y+185, x-143, y+185);
      quad(x-154, y+200, x+154, y+200, x+174, y+230, x-174, y+230);
      quad(x-194, y+260, x+194, y+260, x+207, y+280, x-207, y+280);
      quad(x-247, y+340, x+247, y+340, x+259, y+360, x-259, y+360);
      ////奥の窓
      stroke(0);
      strokeWeight(2);
      fill(landscape);
      rect(x-130, y-100, x+130, y+180);
      strokeWeight(10);
      line(x-130, y+60, x+130, y+60);
      strokeWeight(2);
      fill(khaki);
      rect(x-30, y-100, x+30, y+175);
      fill(0);
      rect(x-30, y+175, x+30, y+180);
      ////左サイド
      stroke(0);
      strokeWeight(2);
      fill(khaki);
      quad(x-130, y-80, x-130, y+180, x-158, y+225, x-158, y-110);
      fill(darkkhaki);
      quad(x-158, y-110, x-158, y+225, x-190, y+225, x-190, y-110);
      fill(khaki);
      quad(x-170, y-110, x-170, y+250, x-220, y+330, x-220, y-130);
      fill(darkkhaki);
      quad(x-220, y-130, x-220, y+330, x-260, y+330, x-260, y-130);
      quad(x-240, y-130, x-240, y+330, x-260, y+360, x-260, y-140);
      fill(khaki);
      beginShape();
      vertex(x-260, y-160);
      vertex(x-260, y+380);
      vertex(x-285, height);
      vertex(0, height);
      vertex(0, 0);
      vertex(x-285, 0);
      vertex(x-260, y-160);
      endShape();
      ////右サイド
      quad(x+130, y-80, x+130, y+180, x+158, y+225, x+158, y-110);
      fill(darkkhaki);
      quad(x+158, y-110, x+158, y+225, x+190, y+225, x+190, y-110);
      fill(khaki);
      quad(x+170, y-110, x+170, y+250, x+220, y+330, x+220, y-130);
      fill(darkkhaki);
      quad(x+220, y-130, x+220, y+330, x+260, y+330, x+260, y-130);
      quad(x+240, y-130, x+240, y+330, x+260, y+360, x+260, y-140);
      fill(khaki);
      beginShape();
      vertex(x+260, y-160);
      vertex(x+260, y+380);
      vertex(x+285, height);
      vertex(width, height);
      vertex(width, 0);
      vertex(x+285, 0);
      vertex(x+260, y-160);
      endShape();
      ////窓の上の部分
      fill(khaki);
      rect(x-150, y-100, x+150, y-50);
      fill(darkkhaki);
      quad(x-150, y-50, x+150, y-50, x+140, y-40, x-140, y-40);
      /////////////////////////////////////////////////////////////
    } else if (myfloor>=7) {                                         //７階以上

      ////床
      stroke(0);
      strokeWeight(1);
      fill(120);
      quad(x-140, y+180, x-300, height, x+300, height, x+140, y+180);
      ////奥の窓
      stroke(0);
      strokeWeight(2);
      fill(landscape);
      rect(x-130, y-60, x+130, y+180);
      strokeWeight(10);
      line(x-130, y+70, x+130, y+70);
      strokeWeight(2);
      fill(khaki);
      rect(x-30, y-80, x+30, y+175);
      fill(0);
      rect(x-30, y+175, x+30, y+180);
      ////左サイド
      strokeWeight(2);
      fill(khaki);
      quad(x-130, y-60, x-130, y+180, x-158, y+225, x-158, y-90);
      fill(darkkhaki);
      quad(x-158, y-90, x-158, y+225, x-190, y+225, x-190, y-90);
      fill(khaki);
      quad(x-170, y-90, x-170, y+250, x-220, y+330, x-220, y-110);
      fill(darkkhaki);
      quad(x-220, y-110, x-220, y+330, x-260, y+330, x-260, y-110);
      quad(x-240, y-110, x-240, y+330, x-260, y+360, x-260, y-120);
      fill(khaki);
      beginShape();
      vertex(x-260, y-140);
      vertex(x-260, y+380);
      vertex(x-285, height);
      vertex(0, height);
      vertex(0, 0);
      vertex(x-320, 0);
      vertex(x-260, y-140);
      endShape();
      ////右サイド
      quad(x+130, y-60, x+130, y+180, x+158, y+225, x+158, y-90);
      fill(darkkhaki);
      quad(x+158, y-90, x+158, y+225, x+190, y+225, x+190, y-90);
      fill(khaki);
      quad(x+170, y-90, x+170, y+250, x+220, y+330, x+220, y-110);
      fill(darkkhaki);
      quad(x+220, y-110, x+220, y+330, x+260, y+330, x+260, y-110);
      quad(x+240, y-110, x+240, y+330, x+260, y+360, x+260, y-120);
      fill(khaki);
      beginShape();
      vertex(x+260, y-140);
      vertex(x+260, y+380);
      vertex(x+285, height);
      vertex(width, height);
      vertex(width, 0);
      vertex(x+320, 0);
      vertex(x+260, y-140);
      endShape();
      ////窓の上の部分
      fill(khaki);
      rect(x-150, y-80, x+150, y-30);
      fill(darkkhaki);
      quad(x-150, y-30, x+150, y-30, x+140, y-20, x-140, y-20);
    }

    ////どのエレベーターが来るか表示するライト
    stroke(0);
    strokeWeight(2);
    if (callElevater==0 && elevater[callElevater]!=myfloor) { //自分がいる階にいないとき
      fill(coming);
    } else if (arrivelight && elevater[callElevater]==myfloor) {      //到着で点滅する
      fill(150); 
      quad(x-175, y-70, x-175, y-30, x-185, y-32, x-185, y-72);
      arrivelight=false;
      delay(1000);
      fill(coming);
    } else {
      fill(150);
    }
    quad(x-175, y-70, x-175, y-30, x-185, y-32, x-185, y-72);

    if (callElevater==1 && elevater[callElevater]!=myfloor) {
      fill(coming);
    } else if (arrivelight && elevater[callElevater]==myfloor) {      //到着で点滅する
      fill(150);  
      quad(x-198, y-75, x-198, y-35, x-208, y-37, x-208, y-77);
      arrivelight=false;
      delay(1000);
      fill(coming);
    } else {
      fill(150);
    }
    quad(x-198, y-75, x-198, y-35, x-208, y-37, x-208, y-77);

    if (callElevater==2 && elevater[callElevater]!=myfloor) {
      fill(coming);
    } else if (arrivelight && elevater[callElevater]==myfloor) {      //到着で点滅する
      fill(150);
      quad(x+175, y-70, x+175, y-30, x+185, y-32, x+185, y-72);
      arrivelight=false;
      delay(1000);
      fill(coming);
    } else {
      fill(150);
    }
    quad(x+175, y-70, x+175, y-30, x+185, y-32, x+185, y-72);

    if (callElevater==3 && elevater[callElevater]!=myfloor) {
      fill(coming);
    } else if (arrivelight && elevater[callElevater]==myfloor) {      //到着で点滅する
      fill(150);  
      quad(x+198, y-75, x+198, y-35, x+208, y-37, x+208, y-77);
      arrivelight=false;
      delay(1000);
      fill(coming);
    } else {
      fill(150);
    }
    quad(x+198, y-75, x+198, y-35, x+208, y-37, x+208, y-77);

    ////ボタン
    //そこにカーソルがあるときは目立つように表示する
    fill(silver);
    strokeWeight(2);
    if (mouseX>=x-200 && mouseX<=x-185 && mouseY>=y+110 && mouseY<=y+141 && scene!=2) {
      strokeWeight(5);
    }
    rect(x-185, y+110, x-200, y+141);
    strokeWeight(2);
    if (mouseX>=x+185 && mouseX<=x+200 && mouseY>=y+110 && mouseY<=y+141 && scene!=2) {
      strokeWeight(5);
    }
    rect(x+185, y+110, x+200, y+141);

    if (statusbar) {
      //背景に現在の状態をを表示するバー
      fill(150, 150, 150, 150);
      noStroke();
      rect(x-400, y-180, x+400, y-80);
      //階数
      fill(0);
      textSize(50);
      text(myfloor+" 階", x-350, y-115);
      //エレベーターの状態
      textSize(20);
      text("左奥："+elevater[0]+"階", x-200, y-150);
      text("左手前："+elevater[1]+"階", x-220, y-100);
      text("右奥："+elevater[2]+"階", x+150, y-150);
      text("右手前："+elevater[3]+"階", x+130, y-100);
    }
  } else if (scene==1 || scene==3) { //エレベーター内の背景
    fill(khaki);
    rect(0, 0, x+400, y+420);
    //入り口部分
    stroke(0);
    strokeWeight(2);
    fill(silver);
    rect(x-300, y-130, x+300, y+340);
    stroke(0);
    strokeWeight(6);
    fill(-1);
    rect(x-220, y-100, x+220, y+340);
    //天井
    strokeWeight(1);
    fill(-1);
    quad(0, 0, x-300, y-130, x+300, y-130, x+400, y-180);
    quad(0, y+420, x-300, y+340, x+300, y+340, x+400, y+420);
    //階数表示
    stroke(0);
    strokeWeight(1);
    fill(#A7E4E5);
    rect(x+240, y-90, x+280, y);
    fill(#CDF6F7);
    rect(x+245, y-85, x+275, y-45);
    fill(0);
    textSize(25);
    text(elevater[myElevater], x+245, y-55);
    //ボタン
    fill(silver);
    if (mouseX>=x-280 && mouseX<=x-240 && mouseY>=y+50 && mouseY<=y+200 && scene!=3) {
      strokeWeight(5);
    } else {
      strokeWeight(1);
    }
    rect(x-240, y+50, x-280, y+200);
    if (mouseX>=x+240 && mouseX<=x+280 && mouseY>=y+50 && mouseY<=y+200 && scene!=3) {
      strokeWeight(5);
    } else {
      strokeWeight(1);
    }
    rect(x+240, y+50, x+280, y+200);
  }
}

//ドア部分の描画
//moveでドアの開閉
void door(int move) {
  //ドア部分
  strokeWeight(1);
  fill(khaki);
  rect(x-220, y-100, x-move, y+340);
  rect(x+move, y-100, x+220, y+340);
}