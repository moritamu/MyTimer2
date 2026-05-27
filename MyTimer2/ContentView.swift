//
//  ContentView.swift
//  MyTimer2
//
//  Created by MsMacM on 2026/05/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image(.backgroundTimer)
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                VStack(spacing: 30.0) {
                    Text("残り30秒")
                        .font(.largeTitle)
                    HStack {
                        Button {
                            
                        } label: {
                            Text("スタート")
                                .font(.title)
                                .foregroundStyle(Color.white)
                                .frame(width: 140,height: 140)
                                .background(Color.start)
                                .clipShape(Circle())
                        }//スタートボタン
                        Button {

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
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink{
                        SettingView()
                    } label: {
                        Text("秒数設定")
                    }//NavigationLink
                }//TootbarItem
            }//toolbar
        }//NavigationStack
    }
}

#Preview {
    ContentView()
}
