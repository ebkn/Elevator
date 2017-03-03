//parts.pde
//細かいボタン等を描画する
//１、上の階に行くか下の階に行くか、ボタンを描画
//２、移動するためのボタンを描画(拡大時)
//３、三角形のボタン(2)の当たり判定
//４、最適なエレベーターを選ぶ関数
//５、エレベーターのボタンを描画(拡大時)
//６、乗ったときに、押されているボタンをランダムに設定する関数
//７、stopの値によって、エレベーターがどう移動するか考える関数


//１、上行きか下行きのエレベータを呼ぶボタン
void goselectButton() {

  //背景を暗くする
  fill(180, 180, 180, 100);
  rect(x-400, y-180, x+400, y+420);
  fill(silver);
  stroke(0);
  strokeWeight(1);
  rect(x-80, y-50, x+80, y+200);

  //1階は上行きしかない
  if (myfloor==1) {
    stroke(100);
    //マウスがあるときは太くする
    if (mouseX>=x-20 && mouseX<=x+20 && mouseY>=y+60 && mouseY<=y+100) {
      strokeWeight(8);
    } else {
      strokeWeight(5);
    }
    rect(x-20, y+60, x+20, y+100);
    strokeWeight(7);
    line(x, y+95, x, y+63);
    line(x-15, y+80, x, y+65);
    line(x+15, y+80, x, y+65);
  } else if (myfloor==14) { //１４階は下行きしかない
    stroke(100);
    //マウスがあるときは太くする
    if (mouseX>=x-20 && mouseX<=x+20 && mouseY>=y+60 && mouseY<=y+100) {
      strokeWeight(8);
    } else {
      strokeWeight(5);
    }
    rect(x-20, y+60, x+20, y+100);
    strokeWeight(7);
    line(x, y+98, x, y+65);
    line(x-15, y+80, x, y+95);
    line(x+15, y+80, x, y+95);
  } else {
    pushMatrix();
    translate(0, -50);
    stroke(100);
    //マウスがあるときは太くする
    if (mouseX>=x-20 && mouseX<=x+20 && mouseY>=y+10 && mouseY<=y+50) {
      strokeWeight(8);
    } else {
      strokeWeight(5);
    }
    rect(x-20, y+60, x+20, y+100);
    strokeWeight(7);
    line(x, y+95, x, y+63);
    line(x-15, y+80, x, y+65);
    line(x+15, y+80, x, y+65);
    popMatrix();

    pushMatrix();
    translate(0, 50);
    stroke(100);
    //マウスがあるときは太くする
    if (mouseX>=x-20 && mouseX<=x+20 && mouseY>=y+110 && mouseY<=y+150) {
      strokeWeight(8);
    } else {
      strokeWeight(5);
    }
    rect(x-20, y+60, x+20, y+100);
    strokeWeight(7);
    line(x, y+98, x, y+65);
    line(x-15, y+80, x, y+95);
    line(x+15, y+80, x, y+95);
    popMatrix();
  }
}

//２、乗り込みorエレベーターから出る矢印を描画
void arrow() {
  //移動する矢印の当たり判定
  upleft    = touchTriangle(x-80, y+190, x-80, y+270, x-130, y+230);
  downleft  = touchTriangle(x-150, y+320, x-150, y+400, x-200, y+360);
  upright   = touchTriangle(x+80, y+190, x+80, y+270, x+130, y+230);
  downright = touchTriangle(x+150, y+320, x+150, y+400, x+200, y+360);    
  stroke(150);
  strokeWeight(1);
  //どちら側のエレベーターに乗るか
  if (scene==0) {
    //左上のエレベーターについて
    if (elevater[0]==myfloor) {
      if (!upleft) {          //マウスが矢印の上にない
        fill(150, 150, 150, 100);
        triangle(x-80, y+190, x-80, y+270, x-130, y+230);
      } else {    //マウスが矢印の上にある
        fill(150, 150, 150, 100);
        pushMatrix();
        translate(x, y);
        scale(1.3);
        translate(-372, -233);
        triangle(x-80, y+190, x-80, y+270, x-130, y+230);
        popMatrix();
      }
    }
    //左下のエレベーターについて
    if (elevater[1]==myfloor) {
      if (!downleft) {
        fill(150, 150, 150, 100);
        triangle(x-150, y+320, x-150, y+400, x-200, y+360);
      } else {
        fill(150, 150, 150, 100);
        pushMatrix();
        translate(x, y);
        scale(1.3);
        translate(-360, -260);
        triangle(x-150, y+320, x-150, y+400, x-200, y+360);
        popMatrix();
      }
    }
    //右上のエレベーターについて
    if (elevater[2]==myfloor) {
      if (!upright) {
        fill(150, 150, 150, 100);
        triangle(x+80, y+190, x+80, y+270, x+130, y+230);
      } else {
        fill(150, 150, 150, 100);
        pushMatrix();
        translate(x, y);
        scale(1.3);
        translate(-425, -233);
        triangle(x+80, y+190, x+80, y+270, x+130, y+230);
        popMatrix();
      }
    }
    //右下のエレベーターについて
    if (elevater[3]==myfloor) {
      if (!downright) {
        fill(150, 150, 150, 100);
        triangle(x+150, y+320, x+150, y+400, x+200, y+360);
      } else if (downright) {
        fill(150, 150, 150, 100);
        pushMatrix();
        translate(x, y);
        scale(1.3);
        translate(-440, -260);
        triangle(x+150, y+320, x+150, y+400, x+200, y+360);
        popMatrix();
      }
    }
  } else if (scene==1 && movedoor[myElevater]!=0) { //エレベーターから降りる矢印
    if (!touchTriangle(x, y+270, x-150, y+350, x+150, y+350)) {
      fill(150, 150, 150, 100);
      triangle(x, y+290, x-100, y+350, x+100, y+350);
    } else {
      fill(150, 150, 150, 100);
      pushMatrix();
      translate(x, y);
      scale(1.3);
      translate(-400, -255);
      triangle(x, y+290, x-100, y+350, x+100, y+350);
      popMatrix();
    }
  }
}

//３、三角形(ボタン)の当たり判定
boolean touchTriangle(int x1, int y1, int x2, int y2, int x3, int y3) {
  boolean touch=false;
  //線上は外とみなす
  //マウス座標と各点を結ぶベクトルを定義(符号もつける)
  //x成分
  float vectorx1 = x1-mouseX;
  float vectorx2 = x2-mouseX;
  float vectorx3 = x3-mouseX;
  //y成分
  float vectory1 = y1-mouseY;
  float vectory2 = y2-mouseY;
  float vectory3 = y3-mouseY;
  //外積
  float cross1 = vectorx1*vectory2-vectorx2*vectory1;
  float cross2 = vectorx2*vectory3-vectorx3*vectory2;
  float cross3 = vectorx3*vectory1-vectorx1*vectory3;

  //３つのベクトルの向きがすべて等しいならtrue
  if ( ( cross1>=0 && cross2>=0 && cross3>=0 ) || ( cross1<=0 && cross2<=0 && cross3<=0 ) ) {
    touch=true;
  } else {
    touch=false;
  }
  //booleanで返す
  return touch;
}

//４、最適なエレベーターを呼ぶ関数
//myfloor,floor[0～3]の状態を読み込む
//呼ぶのに最適なエレベーターを選び、その階を返す
//dはどちら向きを呼んだかの方向(3:上,4:下)
int selectElevater(int d, int e0, int e1, int e2, int e3) {
  //最適なエレベーターの階
  int e[] = {e0, e1, e2, e3};
  boolean select[] = new boolean[4];
  int matchElevater=0;

  for (int i=0; i<4; i++) { //まず今のフロアに待機中のエレベーターがいるか
    if (status[i]==0 && e[i]==myfloor) {
      select[i]=true;
    }
  }
  if (!select[0] && !select[1] && !select[2] && !select[3]) {
    for (int i=0; i<4; i++) {
      if (abs(myfloor-e[i])>0 && d==status[i]) { //近すぎるのは✖で、押した方向と動いている方向が一致すればok
        select[i]=true;
      }
    }
  }
  //同じ向きのエレベーターが無かったら待機状態から探す
  if (!select[0] && !select[1] && !select[2] && !select[3]) {
    for (int i=0; i<4; i++) {
      if (status[i]==0) {
        select[i]=true;
      }
    }
  }
  //全部逆向きだった場合
  if (!select[0] && !select[1] && !select[2] && !select[3]) {
    for (int i=0; i<4; i++) {
      select[i]=true;
    }
  }
  //trueの中から最適なものを選ぶ
  for (int i=0; i<4; i++) {
    if (select[i]) {
      if (abs(myfloor-e[i])<abs(myfloor-e[matchElevater])) {
        matchElevater=i;
      }
    }
  }
  return matchElevater;
}


//５、自分のいるフロアと乗ったエレベーターに応じたボタン
void elevaterButton() {
  stroke(0);
  strokeWeight(1);
  fill(180, 180, 180, 100);
  rect(x-400, y-180, x+400, y+420);
  fill(silver);
  stroke(0);
  strokeWeight(1);
  rect(x-80, y-150, x+80, y+350);
  //階数表示
  stroke(0);
  strokeWeight(1);
  fill(#A7E4E5);
  rect(x-50, y-140, x+50, y-50);
  fill(#CDF6F7);
  rect(x-40, y-135, x+40, y-80);
  fill(0);
  textSize(35);
  text(elevater[myElevater], x, y-100);
  //移動中に進行方向表示
  if (status[myElevater]==3) {
    stroke(#33A9DE);
    strokeWeight(3);
    line(x-15, y-125, x-27, y-110);
    line(x-15, y-125, x-3, y-110);
    line(x-15, y-115, x-27, y-100);
    line(x-15, y-115, x-3, y-100);
  } else if (status[myElevater]==4) {
    stroke(#33A9DE);
    strokeWeight(3);
    line(x-15, y-110, x-27, y-125);
    line(x-15, y-110, x-3, y-125);
    line(x-15, y-100, x-27, y-115);
    line(x-15, y-100, x-3, y-115);
  }
  //日付表示
  fill(0);
  textSize(9);
  if (hour()<=12) {
    day = month()+"月 "+day()+"日  "+hour()%12+":"+minute()+"  AM";
  } else {
    day = month()+"月 "+day()+"日  "+hour()%12+":"+minute()+"  PM";
  }
  text(day, x-36, y-85);

  ////ボタン
  stroke(0);
  strokeWeight(1);
  fill(0, 0, 0, 20);
  rect(x-20, y-30, x+20, y+10);
  fill(silver);
  stroke(100);
  strokeWeight(2);
  if (mouseX>=x-10 && mouseX<=x+10 && mouseY>=y-20 && mouseY<=y) {
    strokeWeight(5);
  }
  rect(x-10, y-20, x+10, y);

  //各階のボタン
  for (int j=1; j<=7; j++) {
    for (int i=1; i<=2; i++) {
      stroke(100);
      if (stop[myElevater][(i-1)*7+j]) {  //止まる階のボタンは押されている
        stroke(#FAD812);
      }
      strokeWeight(2);
      if (mouseX>=x-80+i*45 && mouseX<=x-55+i*45 && mouseY>=y+265-j*35 && mouseY<=y+290-j*35) {
        strokeWeight(5);
      }
      fill(silver);
      rect(x-80+i*45, y+265-j*35, x-55+i*45, y+290-j*35);
      textSize(20);
      fill(100);
      if (stop[myElevater][(i-1)*7+j]) {
        fill(#FAD812);
      }
      if (i==2 && (j==1 || j==2)) {           //8,9をボタンの真ん中に描画
        text((i-1)*7+j, x-72+i*45, y+285-j*35);
      } else {                                //それ以外
        text((i-1)*7+j, x-69+i*40, y+285-j*35);
      }
    }
  }

  //開閉ボタン
  fill(silver);
  stroke(100);
  strokeWeight(2);
  if (mouseX>=x-35 && mouseX<=x-10 && mouseY>=y+280 && mouseY<=y+305) {
    strokeWeight(5);
  }
  rect(x-35, y+280, x-10, y+305);
  stroke(#1BA543);
  fill(#1BA543);
  strokeWeight(2);
  if (mouseX>=x-35 && mouseX<=x-10 && mouseY>=y+280 && mouseY<=y+305) {
    stroke(#41BF66);
    fill(#41BF66);
    strokeWeight(5);
  }
  line(x-22, y+283, x-22, y+302);
  strokeWeight(2);
  triangle(x-32, y+293, x-27, y+285, x-27, y+300);
  triangle(x-12, y+293, x-18, y+285, x-18, y+300);
  ///////////////////////////////////////////////////////////////
  fill(silver);
  stroke(100);
  strokeWeight(2);
  if (mouseX>=x+10 && mouseX<=x+35 && mouseY>=y+280 && mouseY<=y+305) {
    strokeWeight(5);
  }
  rect(x+10, y+280, x+35, y+305);
  stroke(150);
  fill(150);
  strokeWeight(2);
  if (mouseX>=x+10 && mouseX<=x+35 && mouseY>=y+280 && mouseY<=y+305) {
    stroke(180);
    fill(180);
    strokeWeight(5);
  }
  line(x+22, y+283, x+22, y+302);
  strokeWeight(2);
  triangle(x+27, y+293, x+33, y+285, x+33, y+300);
  triangle(x+18, y+293, x+13, y+285, x+13, y+300);
}


//６、各階のボタンの状態をランダムで設定する関数
//何個押してあるかを乗っている人数から出す
void stopElevater(int a) { //aは何番目か
  for (int i=0; i<people[a]; i++) {
    //ボタンが押されている状態を設定(上:最上階まで,下:1階まで)
    if ((status[a]==3 || destination==3) && elevater[a]!=14) {
      int button = (int)random(elevater[a]+1, 15);
      stop[a][button]=true;
    } else if ((status[a]==4 || destination==4)&& elevater[a]!=1) {
      int button = (int)random(1, elevater[a]);
      stop[a][button]=true;
    }
  }
}


//７、エレベーターがどう移動するか計算する
//どのエレベーターについて考えるかを引き値とする
void moveElevater(int e) {
  //階数分移動時間がかかる（乗っていれば移動音も）
  go=0; //初期化
  if (status[e]==3) {          //上に行く場合
    for (int i=14; i>elevater[e]; i--) {
      if (stop[e][i]) {
        go=i;                   //近くへ順に調べていき、更新していく
      }
    }
  } else if (status[e]==4) {   //下に行く場合
    for (int i=1; i<elevater[e]; i++) {
      if (stop[e][i]) {
        go=i;                   //近くへ順に調べていき、更新していく
      }
    }
  }
  if (go==0 && e!=callElevater) {
    people[e]=0;
    status[e]=0;
    for (int i=14; i>elevater[e]; i--) {
      if (stop[e][i]) {
        status[e]=3;
      }
    }
    for (int i=1; i<elevater[e]; i++) {
      if (stop[e][i]) {
        status[e]=4;
      }
    }
  } else if (abs(elevater[e]-go)>0) { //1階差まで実行し、次の階に行くようにする
    if (cnt[e]%100==0) {
      if (status[e]==3) {
        elevater[e]++;
      } else if (status[e]==4) {
        elevater[e]--;
      }
      if (elevater[e]==go) { //到着したら
        stop[e][go]=false;
        people[e]--;
        cnt[e]=0;
        if (elevater[e]==1 || elevater[e]==14) {
          people[e]=0;
        }
        if (people[e]==0 && e!=callElevater) {
          status[e]=0;
        } 
        if ((elevater[e]==myfloor && e==callElevater) || e==myElevater) {
          status[e]=1;      //自動でドアを開ける
          door.rewind();
          arrive.rewind();
          door.play();
          arrive.play();
        }
        if (e!=myElevater && e!=callElevater) {
          //まだ動き続けるかどうか調べる
          for (int i=14; i>elevater[e]; i--) {
            if (stop[e][i]) {
              status[e]=3;
            }
          }
          for (int i=1; i<elevater[e]; i++) {
            if (stop[e][i]) {
              status[e]=4;
            }
          }
        }
      }
    }
  }
  go=0; //リセット
}