//
//  PlayGameView.swift
//  HangMan
//
//  Created by Mark Vadimov on 24.06.24.
//

import SwiftUI
import SwiftData

struct PlayGameView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State var index = 0
    @State var clue = false
    @State var points = 0
    @State var name = ""
    @State var letters =
    [
        "й" : false, "ц" : false, "у" : false, "к" : false, "е" : false, "н" : false, "г" : false, "ш" : false, "щ" : false, "з" : false, "х" : false,
        "ф" : false, "ы" : false, "в" : false, "а" : false, "п" : false, "р" : false, "о" : false, "л" : false, "д" : false, "ж" : false, "э" : false,
        "я" : false, "ч" : false, "с" : false, "м" : false, "и" : false, "т" : false, "ь" : false, "б" : false, "ю" : false
    ]
    
    let rows = [
        ["й", "ц", "у", "к", "е", "н", "г", "ш", "щ", "з", "х"],
        ["ф", "ы", "в", "а", "п", "р", "о", "л", "д", "ж", "э"],
        ["я", "ч", "с", "м", "и", "т", "ь", "б", "ю"]
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        let mistake = [0, 1, 2, 3, 4, 5, 6, 7, 8]
        VStack {
            if !checkAllLettersGuessed() {
                VStack{
                    HStack {
                        Text(String(points))
                            .font(.custom("Bradley Hand", size: 36))
                        Spacer()
                        
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 23, height: 23)
                            .fontWeight(.medium)
                            .onTapGesture {
                                viewModel.startView = true
                                viewModel.playGame = false
                            }
                    }
                    .padding(.horizontal, 35)
                }
                .padding(.top, -50)
                Image("HangMan"+String(mistake[index]))
                    .resizable()
                    .frame(width: 200, height: 300)
                
                if index != 8 {
                    VStack{
                        
                        HStack{
                            if (viewModel.selectedWord != nil) {
                                ForEach(Array(viewModel.selectedWord!.word), id: \.self) { letter in
                                    Text(String(letter).uppercased())
                                        .font(.custom("Bradley Hand", size: 29))
                                        .frame(width: 26, height: 35)
                                        .foregroundStyle(self.letters[String(letter).lowercased()] == true ? Color.white : Color.dGray)
                                        .background(Color.dGray)
                                        .padding(.bottom, 4)
                                        .background(Color.white)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 8)
                                        .background(Color.dGray)
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .padding(.vertical, 20)
                        VStack(spacing: 40){
                            LazyVGrid(columns: columns){
                                ForEach(rows, id: \.self) { row in
                                    ForEach(row, id: \.self) { letter in
                                        Text(letter.uppercased())
                                            .font(.custom("Bradley Hand", size: 23))
                                            .frame(width: 23, height: 39)
                                            .foregroundStyle(Color.black)
                                            .padding(.vertical, 6)
                                            .padding(.horizontal, 5)
                                            .background(self.letters[letter]! ? (viewModel.selectedWord!.word.lowercased().contains(letter) ? Color.gGreen : Color.rRed) : Color.lBlue)
                                            .cornerRadius(10)
                                            .onTapGesture {
                                                if !self.letters[letter]!{
                                                    self.letters[letter] = true
                                                    if viewModel.selectedWord!.word.lowercased().contains(letter) {
                                                        points += clue ? 20 : 40
                                                    }
                                                    else {
                                                        points -= clue ? 25 : 15
                                                    }
                                                    if index != 8{
                                                        if !viewModel.selectedWord!.word.lowercased().contains(letter) {
                                                            index += 1
                                                        }
                                                    }
                                                }
                                            }
                                    }
                                }
                            }
                            if !clue {
                                Text("Подсказка")
                                    .font(.custom("Bradley Hand", size: 28))
                                    .frame(width: 150, height: 35)
                                    .foregroundStyle(Color.white)
                                    .background(Color.dGray)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 8)
                                    .background(Color.dGray)
                                    .cornerRadius(10)
                                    .onTapGesture{
                                        clue = true
                                    }
                                
                            }
                            else {
                                Text(viewModel.selectedWord!.prompt)
                                    .font(.custom("Bradley Hand", size: 25))
                                    .frame(maxWidth: 400, maxHeight: 100)
                                    .foregroundStyle(Color.black)
                            }
                        }
                    }
                    .padding(.horizontal, 14)
                }
                else {
                    Text("ВЫ ПРОИГРАЛИ")
                        .font(.custom("Bradley Hand", size: 50))
                        .foregroundStyle(Color.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 8)
                        .background(Color.rRed)
                        .cornerRadius(10)
                        .onTapGesture {
                            viewModel.startView = true
                            viewModel.playGame = false
                        }
                }
            }
            else if checkAllLettersGuessed() {
                VStack {
                    Image("HangManWin")
                        .resizable()
                        .frame(width: 200, height: 300)
                    
                    Text("ВЫ ВЫИГРАЛИ")
                        .font(.custom("Bradley Hand", size: 50))
                        .foregroundStyle(Color.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 8)
                        .background(Color.gGreen)
                        .cornerRadius(10)
                    
                    Text("Кол-во очков: \(points)")
                        .font(.custom("Bradley Hand", size: 30))
                        .foregroundStyle(Color.black)
                    LazyVStack {
                        TextField("Впишите имя", text: $name)
                            .frame(width: 300, height: 50)
                            .foregroundStyle(Color.black)
                            .background(Color(UIColor.systemGray4))
                            .border(Color.gray)
                            .font(.custom("Bradley Hand", size: 20))
                            .textFieldStyle(.roundedBorder)
                            .cornerRadius(7)
                            .padding(.vertical, 15)
                    }
                    Text("Выход")
                        .font(.custom("Bradley Hand", size: 28))
                        .frame(width: 150, height: 35)
                        .foregroundStyle(Color.white)
                        .background(Color.dGray)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 8)
                        .background(Color.dGray)
                        .cornerRadius(10)
                        .onTapGesture{
                            viewModel.startView = true
                            viewModel.playGame = false
                            if name != "" {
                                addItem()
                            }
                        }
                }
            }
        }
        .padding(.top, 75)
        Spacer()
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date(), name: name, points: points)
            modelContext.insert(newItem)
        }
    }
    
    func checkAllLettersGuessed() -> Bool {
        if let word = viewModel.selectedWord?.word.lowercased() {
            for letter in word {
                if letters[String(letter)] != true {
                    return false
                }
            }
            return true
        }
        return true/////////
    }
}

#Preview {
    PlayGameView().environmentObject(ViewModel()).modelContainer(for: Item.self, inMemory: true)
}
