//
//  ContentView.swift
//  MyTimer2
//
//  Created by MsMacM on 2026/05/27.
//

import SwiftUI

struct ContentView: View {
    @State var timerHandler: Timer?//タイマー変数の作成
    @State var count = 0//経過時間
    @AppStorage("timer_value") var timerValue: Int = 10
    @State var isShowAlert: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                Image(.backgroundTimer)
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                VStack(spacing: 30.0) {
                    Text("残り\(timerValue - count) 秒")
                        .font(.largeTitle)
                    HStack {
                        Button {
                            startTimer()
                        } label: {
                            Text("スタート")
                                .font(.title)
                                .foregroundStyle(Color.white)
                                .frame(width: 140,height: 140)
                                .background(Color.start)
                                .clipShape(Circle())
                        }//スタートボタン
                        Button {
                            if let timerHandler {
                                if timerHandler.isValid {
                                    timerHandler.invalidate()//実行中だったら停止
                                }
                            }
                        } label: {
                            Text("ストップ")
                                .font(.title)
                                .foregroundStyle(Color.white)
                                .frame(width: 140,height: 140)
                                .background(Color.stop)
                                .clipShape(Circle())
                        }//ストップボタン
                    }//HStack
                }//VStack
            }//ZStack
            .onAppear(){
                count = 0//表示されたら０にする
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink{
                        SettingView()
                    } label: {
                        Text("秒数設定")
                    }//NavigationLink
                }//TootbarItem
            }//toolbar
            .alert("終了", isPresented: $isShowAlert) {
                Button("OK") {
                    print("OKがタップされました")
                }
            } message: {
                    Text("タイマー終了時間です")
                }//aleart
        }//NavigationStack
    }
    func countDownTimer() {
        count += 1
        if timerValue - count <= 0 {
            timerHandler?.invalidate()//タイマー停止
            isShowAlert = true//アラートをtrueにする
        }
    }//countDownTimer
    func startTimer() {
        if let timerHandler {
            if timerHandler.isValid == true {
                return//タイマーがあって動いていたら何もしない
            }
        }//timerHandlerのアンラップ
        //
        if timerValue - count <= 0 {
            count = 0//タイマーを０にする
        }
        //インスタンスを作成してタイマーをスタートする
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            Task {//メインスレッドで実行する
                @MainActor in countDownTimer()
            }
        }//timerHandler
    }//startTimer

}

#Preview {
    ContentView()
}
