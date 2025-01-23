//
//  FirstView.swift
//  HangMan
//
//  Created by Mark Vadimov on 24.06.24.
//

import SwiftUI

struct FirstView: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        VStack{
            VStack(spacing: 20) {
                Text("НАЧАТЬ ИГРУ")
                    .font(.custom("Bradley Hand", size: 35))
                    .padding(.vertical, 7)
                    .padding(.horizontal)
                    .foregroundStyle(Color.black)
                    .background(Color(UIColor.systemGray2))
                    .cornerRadius(10)
                    .onTapGesture {
                        viewModel.getTopic = true
                        viewModel.startView = false
                    }
                
                Text("Рейтинг игроков")
                    .font(.custom("Bradley Hand", size: 35))
                    .padding(.vertical, 7)
                    .padding(.horizontal)
                    .foregroundStyle(Color.black)
                    .background(Color(UIColor.systemGray2))
                    .cornerRadius(10)
                    .onTapGesture {
                        viewModel.ratePlayers = true
                        viewModel.startView = false
                    }
                
                Text("Выход")
                    .font(.custom("Bradley Hand", size: 35))
                    .padding(.vertical, 7)
                    .padding(.horizontal)
                    .foregroundStyle(Color.black)
                    .background(Color(UIColor.systemGray2))
                    .cornerRadius(10)
                    .onTapGesture {
                        exit(0)
                    }
            }
        }
    }
}

#Preview {
    FirstView().environmentObject(ViewModel())
}
