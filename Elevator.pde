//Elevator.pde / background.pde / chara.pde / parts.pde
//中野キャンパスのエレベーターシステムの模倣
//2016/07/20


//概要
//6階までのフロアにいるときは環境音を再生する
//まず下キーを押すと、現在の状態を示すバーが出てくる(上キーで戻る)
//ランダムでエレベーターが移動
//ボタンのところを押すと、方向に応じた最適なエレベーターを呼ぶボタンを表示する
//到着すると矢印が出てくるので、押すと乗ることができる
//行き先のボタンを押してドアを閉めると、移動し始める
//到着するとドアが開き、人が降りる
//自分が降りるか選択し、降りずにドアを閉めると次の行き先へ進む
//4台のエレベーターはすべてランダムで自動的に移動する
//乗っている人の数に応じて止まるフロアも変わる


//こだわりポイント
//4台のエレベーターが自動的に動いている状況を忠実に再現した
//（発表の為にスピードと頻度は上げた）
//音を録音して使った
//ボタンや矢印など、UIを使いやすいように工夫した



//効果音
import ddf.minim.*;
Minim minim;
AudioSnippet call;   //呼ぶとき
AudioSnippet arrive; //到着したとき
AudioSnippet door;   //ドアの開閉
AudioPlayer around;  //環境音

PFont gothic;                            //フォント設定
//自分の状態
int scene=0;                             //場所 0:フロア 1:エレベーター内 2:フロアでボタンを表示 3:エレベーター内のボタンを表示
int myfloor = 1;                         //自分がいる階(初期値1階)
int callElevater = 4;                    //どのエレベーターを呼んだか(4で呼んでいない状態)
int myElevater   = 4;                    //どのエレベーターに乗っているか(4で乗っていない状態)
//エレベーターの状態
int []movedoor    = new int[4];          //ドアの開閉
int []elevater    = new int[4];          //４台のエレベーターの場所(1～14階)
int []people      = new int[4];          //乗っている人数(0～10人)→0なら待機状態にする
int []status      = new int[4];          //エレベーターの状態 0;停止 1:開く動作 2:閉まる動作 3;上に移動中 4:下に移動中
boolean [][]stop  = new boolean[4][15];  //各階に停止するかどうか(パラメータ2の0は使わない)
int []pushcount   = new int[15];         //5回押すとリセットするようにする（0は使わないので1から14にする)
int []cnt         = new int[4];          //エレベーターの速度調整
int moving;                              //止まっているエレベーターを動かす
boolean checkarrive;                     //到着したか
boolean arrivelight;                     //到着ライト
boolean statusbar;                       //ステータスバーを表示
//描画の基準点(1階のlineの中心)
int x=400;
int y=180;
//定義
color silver    = #C0C0C0;               //銀色
color khaki     = #F3F7E6;               //カーキ色
color darkkhaki = #C3C6AE;               //カーキ色の影
color landscape = #7F94F7;               //風景
color coming    = #FAE30D;               //ライト
boolean upleft;                          //矢印の当たり判定
boolean downleft;
boolean upright;
boolean downright;
int direction;                           //動き始めるときのランダム方向
int destination;                         //乗ったときにランダムで行き先を決める
int come;                                //void mousePressed
int go;                                  //void moveElevater
String day;                              //void elevaterButton


void setup() {
  size(800, 600);
  background(-1);
  frameRate(100);
  rectMode(CORNERS); //角の座標で四角形を描画
  strokeCap(SQUARE); //線の端を四角形にする
  smooth();          //線を滑らかに
  cursor(HAND);      //カーソルの形を"手"にする

  gothic = createFont("MSゴシック", 10);
  textFont(gothic);

  //初期化
  for (int i=0; i<4; i++) {
    elevater[i]=(int)random(1, 14);
    people[i]=0;
    status[i]=0;
    movedoor[i]=0;
    pushcount[i]=0;
    for (int j=1; j<=14; j++) {
      stop[i][j]=false;
    }
  }

  //効果音
  minim = new Minim(this);
  call   = minim.loadSnippet("call.mp3");
  arrive = minim.loadSnippet("arrive.mp3");
  door   = minim.loadSnippet("door.mp3");
  around = minim.loadFile("around.mp3");

  around.rewind(); //環境音再生
  around.loop();
}


void draw() {
  background(-1);

  //背景を描画
  back();
  //自分が乗っているエレベーターについて
  if (scene==1 && myElevater!=4) {
    door(movedoor[myElevater]);                                    //ドアを描画
    for (int i=0; i<people[myElevater]; i++) {
      chara(x-150+i*100, y+200, 0.6);
    }
    if (status[myElevater]==1) {                                   //開く操作
      movedoor[myElevater]++;                                      //0スタートで220まで増やす
      ////
      if (movedoor[myElevater]>=220) {
        status[myElevater]=0;                                      //停止中にする
        if (elevater[myElevater]>=7) {
          around.rewind();                                         //7階以上なら環境音再開
          around.loop();
        }
      }
    } else if (status[myElevater]==2) {                            //閉じる操作
      movedoor[myElevater]--;                                      //220スタートで0まで減らす
      if (movedoor[myElevater]<=0) {                               //閉じ終わったら
        around.pause();                                            //環境音一時停止
        int direction1=1;
        int direction2=13;
        for (int k=14; k>myfloor; k--) {
          if (stop[myElevater][k]) {
            direction1=k;
          }
        }
        for (int k=1; k<myfloor; k++) {
          if (stop[myElevater][k]) {
            direction2=k;
          }
        }
        if (abs(direction1-myfloor) <= abs(direction2-myfloor)) {
          status[myElevater]=3;                                    //上に移動中にする
        } else {
          status[myElevater]=4;                                    //下に移動中にする
        }
      }
    } else if (status[myElevater]==3 || status[myElevater]==4) {
      cnt[myElevater]++;
      moveElevater(myElevater);
    }
  }
  //乗っているエレベーター以外の移動
  for (int i=0; i<4; i++) {
    if (i!=myElevater) {
      if (status[i]==0 && i!=callElevater) {    //待機中の場合はランダムで移動し始める
        moving = (int)random(500);
        if (moving==0) {                        //一定の確率で動き始める
          people[i]=(int)random(1, 5);
          direction=(int)random(2);
          if ((elevater[i]==1 || direction==0) && elevater[i]!=14) {
            status[i]=3;
          } else if ((elevater[i]==14 || direction==1) && elevater[i]!=1) {
            status[i]=4;
          }
          stopElevater(i);
        }
      }
      cnt[i]++;
      moveElevater(i);
    }
  }

  if (checkarrive) {            //エレベーター到着
    if (elevater[0]==myfloor || elevater[1]==myfloor || elevater[2]==myfloor || elevater[3]==myfloor) {
      arrivelight=true;
      arrive.rewind();
      arrive.play();
      checkarrive=false;
    }
  }

  //行く方向を選ぶボタンをクリックして拡大表示
  if (scene==2) {
    goselectButton();
  }
  //エレベーター内のボタンをクリックして拡大表示
  if (scene==3) {
    door(movedoor[myElevater]);
    for (int i=0; i<people[myElevater]; i++) {
      chara(x-150+i*100, y+200, 0.6);
    }
    elevaterButton();
  }

  //移動するボタン
  arrow();
}

//下キーを押すとステータスバーが出てきて、上を押すと戻る
void keyPressed() {
  if (keyCode==DOWN) {
    statusbar=true;
  } else if (keyCode==UP) {
    statusbar=false;
  }
}

//マウスの当たり判定
void mousePressed() {

  ////移動するボタンの当たり判定
  if (scene==0) {                                                               //フロアにいるとき
    if ((mouseX>=x-200 && mouseX<=x-185 && mouseY>=y+110 && mouseY<=y+141) || (mouseX>=x+185 && mouseX<=x+200 && mouseY>=y+110 && mouseY<=y+141)) {
      scene=2;                                                                  //呼ぶボタンの拡大表示
    }
    if (upleft && elevater[0]==myfloor) {            //左上
      myElevater=0;                                  //0番目のエレベーターに乗る
      callElevater=4;                                //呼んでいる状態をリセット
      movedoor[myElevater]=220;                      //開いた状態にする
      people[myElevater]+=(int)random(1,5);
      scene=1;                                       //エレベーター内の状態にする
      for (int i=1; i<=14; i++) {
        stop[myElevater][i]=false;             //リセット
      }
    } else if (downleft && elevater[1]==myfloor) {   //左下
      myElevater=1;
      callElevater=4;
      movedoor[myElevater]=220;
      people[myElevater]+=(int)random(1,5);
      scene=1;
      for (int i=1; i<=14; i++) {
        stop[myElevater][i]=false;             //リセット
      }
    } else if (upright && elevater[2]==myfloor) {    //右上

      myElevater=2;
      callElevater=4;
      movedoor[myElevater]=220;
      people[myElevater]+=(int)random(1,5);
      scene=1;
      for (int i=1; i<=14; i++) {
        stop[myElevater][i]=false;             //リセット
      }
    } else if (downright && elevater[3]==myfloor) {  //右下
      myElevater=3;
      callElevater=4;
      movedoor[myElevater]=220;
      people[myElevater]+=(int)random(1,5);
      scene=1;
      for (int i=1; i<=14; i++) {
        stop[myElevater][i]=false;             //リセット
      }
    }
  } else if (scene==1) {                                                                  //エレベータ―内にいるとき
    if (touchTriangle(x, y+270, x-150, y+350, x+150, y+350) && movedoor[myElevater]!=0) { //降りる
      movedoor[myElevater]=0;
      myfloor=elevater[myElevater];
      myElevater=4;                                                                       //乗っていない状態にリセット
      scene=0;
    } else if ((mouseX>=x-280 && mouseX<=x-240 && mouseY>=y+50 && mouseY<=y+200) || (mouseX>=x+240 && mouseX<=x+280 && mouseY>=y+50 && mouseY<=y+200)) {
      scene=3;
    }
    //////////////////////////////////////////////////////////////////
  } else if (scene==2) {                                                                  //フロアのボタン画面 →button
    if (mouseX<=x-80 || mouseX>=x+80 || mouseY<=y-50 || mouseY>=y+200) {                  //四角の外を押すと戻る
      scene=0;
    }
    if (myfloor==1) {                                                                     //1階でボタンを押したら
      if (mouseX>=x-20 && mouseX<=x+20 && mouseY>=y+60 && mouseY<=y+100) {
        checkarrive=true;
        call.rewind();
        call.play();
        come = selectElevater(4, elevater[0], elevater[1], elevater[2], elevater[3]);
        callElevater = come;
        if (elevater[come]==myfloor) {
          status[come]=1;
        } else {
          status[come] = 4;                                                      //選んだエレベーターを下方向に動かす
        }
        stop[come][1] = true;                                                  //選んだエレベーターの目的地を自分のいるフロアにする
        delay(500);                                                            //0.5秒間待ってからフロア画面に戻る
        scene=0;
      }
    } else if (myfloor==14) { //14階
      if (mouseX>=x-20 && mouseX<=x+20 && mouseY>=y+60 && mouseY<=y+100) {
        checkarrive=true;
        call.rewind();
        call.play();
        come = selectElevater(3, elevater[0], elevater[1], elevater[2], elevater[3]);
        callElevater = come;
        if (elevater[come]==myfloor) {
          status[come]=1;
        } else {
          status[come]=3;
        }
        stop[come][14] = true;
        delay(500);
        scene=0;
      }
    } else if (myfloor!=1 && myfloor!=14) {                                   //それ以外の階
      if (mouseX>=x-20 && mouseX<=x+20 && mouseY>=y+10 && mouseY<=y+50) {     //上行きを呼ぶ(下に動かす)
        checkarrive=true;
        call.rewind();
        call.play();
        come = selectElevater(4, elevater[0], elevater[1], elevater[2], elevater[3]);
        callElevater = come;
        if (elevater[come]>myfloor) {
          status[come]=4;
        } else if (elevater[come]<myfloor) {
          status[come]=3;
        }
        stop[come][myfloor] = true;
        delay(500);
        scene=0;
      } else if (mouseX>=x-20 && mouseX<=x+20 && mouseY>=y+110 && mouseY<=y+150) { //下行きを呼ぶ(上に動かす)
        checkarrive=true;
        call.rewind();
        call.play();
        come = selectElevater(3, elevater[0], elevater[1], elevater[2], elevater[3]);
        callElevater = come;
        if (elevater[come]>myfloor) {
          status[come]=4;
        } else if (elevater[come]<myfloor) {
          status[come]=3;
        }
        stop[come][myfloor] = true;
        delay(500);
        scene=0;
      }
    }
  } else if (scene==3) {                                                          //エレベーターのボタン画面
    if (mouseX<=x-80 || mouseX>=x+80 || mouseY<=y-180 || mouseY>=y+300) {
      scene=1;                                                                    //四角の外を押すと戻る
    }
    if (mouseX>=x-10 && mouseX<=x+10 && mouseY>=y-20 && mouseY<=y) {              //緊急ボタンが押されたら
      delay(1000);
      textSize(100);
      fill(255, 0, 0);
      text("STOP", 200, 200);
      noLoop();
      delay(10000);
      loop();
    }

    ////各階のエレベーターボタン判定
    for (int j=1; j<=7; j++) {
      for (int i=1; i<=2; i++) {
        if (mouseX>=x-80+i*45 && mouseX<=x-55+i*45 && mouseY>=y+265-j*35 && mouseY<=y+290-j*35) {
          if (stop[myElevater][(i-1)*7+j]) {
            pushcount[(i-1)*7+j]++;
            if (pushcount[(i-1)*7+j]==5) {                                        //押されているボタンを5回押すと
              stop[myElevater][(i-1)*7+j]=false;                                  //押されていない状態にする
              for (int k=1; k<=14; k++) {
                pushcount[k]=0;                                                   //countをリセット
              }
            }
          } else if (!stop[myElevater][(i-1)*7+j]) {
            stop[myElevater][(i-1)*7+j]=true;                                     //その階に停止するようにする
            if (((i-1)*7+j)-myfloor>0) {
              destination=3;
              stopElevater(myElevater);
            } else {
              destination=4;
              stopElevater(myElevater);
            }
          }
        }
      }
    }
    //エレベーターの開閉ボタン
    if (mouseX>=x-35 && mouseX<=x-10 && mouseY>=y+280 && mouseY<=y+305) { //開
      delay(300);
      scene=1;
      status[myElevater]=1;                         //開く状態にする   →降りる
      door.rewind();
      door.play();
    }
    if (mouseX>=x+10 && mouseX<=x+35 && mouseY>=y+280 && mouseY<=y+305) { //閉
      delay(300);
      scene=1;
      status[myElevater]=2;                         //閉じる状態にする →動き始める
      door.rewind();
      door.play();
    }
  }//ここまでflag==3の処理
}

//音関係
void stop() {
  around.close();
  call.close();
  arrive.close();
  door.close();
  minim.stop();
  super.stop();
}
