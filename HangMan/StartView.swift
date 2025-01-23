//
//  StartView.swift
//  HangMan
//
//  Created by Mark Vadimov on 24.06.24.
//

import SwiftUI
import SwiftData

struct StartView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View {
        VStack{
            if viewModel.playGame {
                PlayGameView()
                    .onAppear(){
                        viewModel.mainWord()
                    }
            }
            else if viewModel.ratePlayers {
                RateView()
            }
            else if viewModel.getTopic {
                GetTopicView()
            }
            else {
                FirstView()
            }
        }
        .background(Image("background")
            .resizable()
            .frame(width: 1220, height: 950)
            .opacity(0.15))
    }
}

#Preview {
    StartView().environmentObject(ViewModel()).modelContainer(for: Item.self, inMemory: true)
}
