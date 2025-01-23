//
//  RateView.swift
//  HangMan
//
//  Created by Mark Vadimov on 26.06.24.
//

import SwiftUI
import SwiftData

struct RateView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State var sortBy = 2

    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Text("Таблица игроков:".uppercased())
                    .font(.custom("Bradley Hand", size: 35))
                    .foregroundStyle(Color.black)
                    .padding(.vertical, 50)
                
                Spacer()
            }
            .padding(.horizontal)
            
            VStack {
                ScrollView {
                    ForEach(Array(sortedItems.enumerated()), id: \.element.id) { (index, item) in
                        HStack(alignment: .top) {
                            Text("\(index + 1). ")
                                .font(.custom("Bradley Hand", size: 30))
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("\(item.name), ")
                                        .font(.custom("Bradley Hand", size: 30))
                                    
                                    Text("\(item.points) p")
                                        .font(.custom("Bradley Hand", size: 25))
                                }
                                Text("\(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                                    .font(.custom("Bradley Hand", size: 25))
                            }
                        }
                        .padding(.bottom, 10)
                        .foregroundStyle(Color.black)
                    }
                }
                .frame(alignment: .leading)
            }
            .frame(width: 350, height: 400)
            .background(Color(UIColor.systemGray4))
            .padding(2)
            .background(Color.black.opacity(0.5))
            .cornerRadius(7)
            
            Text("Выход")
                .font(.custom("Bradley Hand", size: 28))
                .frame(width: 150, height: 35)
                .foregroundStyle(Color.white)
                .background(Color.dGray)
                .padding(.vertical, 10)
                .padding(.horizontal, 8)
                .background(Color.dGray)
                .cornerRadius(10)
                .onTapGesture {
                    viewModel.startView = true
                    viewModel.ratePlayers = false
                }
            Spacer()
        }
    }
    
    private var sortedItems: [Item] {
        switch sortBy {
        case 1:
            return items.sorted(by: { $0.name < $1.name })
        case 2:
            return items.sorted(by: { $0.points > $1.points })
        case 3:
            return items.sorted(by: { $0.timestamp < $1.timestamp })
        default:
            return items
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    RateView().environmentObject(ViewModel()).modelContainer(for: Item.self, inMemory: true)
}
