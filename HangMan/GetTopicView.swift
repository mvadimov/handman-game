//
//  GetTopicView.swift
//  HangMan
//
//  Created by Mark Vadimov on 24.06.24.
//

import SwiftUI

struct GetTopicView: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        VStack(spacing: 40) {
            Text("Выберите тему: ")
                .font(.custom("Bradley Hand", size: 40))
                .frame(width: 300, height: 50)
                .foregroundStyle(Color.black)
            VStack(spacing: 15){
                Text("Случайная")
                    .font(.custom("Bradley Hand", size: 32))
                    .frame(width: 200, height: 40)
                    .padding(.vertical, 7)
                    .padding(.horizontal)
                    .foregroundStyle(Color.black)
                    .background(Color.white)
                    .padding(3)
                    .background(Color(UIColor.systemGray2))
                    .cornerRadius(5)
                    .padding(.trailing, 120)
                    .onTapGesture {
                        viewModel.numTopic = 0
                        viewModel.playGame = true
                        viewModel.getTopic = false
                    }
                
                Text("Фрукты")
                    .font(.custom("Bradley Hand", size: 32))
                    .frame(width: 200, height: 40)
                    .padding(.vertical, 7)
                    .padding(.horizontal)
                    .foregroundStyle(Color.black)
                    .background(Color.white)
                    .padding(3)
                    .background(Color(UIColor.systemGray2))
                    .cornerRadius(5)
                    .padding(.leading, 120)
                    .onTapGesture {
                        viewModel.numTopic = 1
                        viewModel.playGame = true
                        viewModel.getTopic = false
                    }
                
                Text("Животные")
                    .font(.custom("Bradley Hand", size: 32))
                    .frame(width: 200, height: 40)
                    .padding(.vertical, 7)
                    .padding(.horizontal)
                    .foregroundStyle(Color.black)
                    .background(Color.white)
                    .padding(3)
                    .background(Color(UIColor.systemGray2))
                    .cornerRadius(5)
                    .padding(.trailing, 120)
                    .onTapGesture {
                        viewModel.numTopic = 2
                        viewModel.playGame = true
                        viewModel.getTopic = false
                    }
                
                Text("Страны")
                    .font(.custom("Bradley Hand", size: 32))
                    .frame(width: 200, height: 40)
                    .padding(.vertical, 7)
                    .padding(.horizontal)
                    .foregroundStyle(Color.black)
                    .background(Color.white)
                    .padding(3)
                    .background(Color(UIColor.systemGray2))
                    .cornerRadius(5)
                    .padding(.leading, 120)
                    .onTapGesture {
                        viewModel.numTopic = 3
                        viewModel.playGame = true
                        viewModel.getTopic = false
                    }
                
                Text("Спорт")
                    .font(.custom("Bradley Hand", size: 35))
                    .frame(width: 200, height: 40)
                    .padding(.vertical, 7)
                    .padding(.horizontal)
                    .foregroundStyle(Color.black)
                    .background(Color.white)
                    .padding(3)
                    .background(Color(UIColor.systemGray2))
                    .cornerRadius(5)
                    .padding(.trailing, 120)
                    .onTapGesture {
                        viewModel.numTopic = 4
                        viewModel.playGame = true
                        viewModel.getTopic = false
                    }
                
                Text("Профессии")
                    .font(.custom("Bradley Hand", size: 35))
                    .frame(width: 200, height: 40)
                    .padding(.vertical, 7)
                    .padding(.horizontal)
                    .foregroundStyle(Color.black)
                    .background(Color.white)
                    .padding(3)
                    .background(Color(UIColor.systemGray2))
                    .cornerRadius(5)
                    .padding(.leading, 120)
                    .onTapGesture {
                        viewModel.numTopic = 5
                        viewModel.playGame = true
                        viewModel.getTopic = false
                    }
            }
            Spacer()
        }
        .padding(.top, 30)
    }
}

#Preview {
    GetTopicView().environmentObject(ViewModel())
}
