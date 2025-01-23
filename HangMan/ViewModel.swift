//
//  ViewModel.swift
//  HangMan
//
//  Created by Mark Vadimov on 24.06.24.
//

import SwiftUI
import Foundation

class ViewModel: ObservableObject {
    @Published var startView = true
    @Published var getTopic = false
    @Published var playGame = false
    @Published var ratePlayers = false
    @Published var numTopic = 0
    @Published var selectedWord: Words?
    @Published var wordTopic = [
        Topic(id: 1, words: [
            Words(id: 1, word: "Яблоко", prompt: "Красное или зеленое, растет на дереве", isUsed: false),
            Words(id: 2, word: "Банан", prompt: "Желтый, растет в тропиках", isUsed: false),
            Words(id: 3, word: "Апельсин", prompt: "Оранжевый, цитрусовый фрукт", isUsed: false),
            Words(id: 4, word: "Виноград", prompt: "Растет в виде грозди, бывает зеленым или фиолетовым", isUsed: false),
            Words(id: 5, word: "Клубника", prompt: "Красная, с семенами снаружи", isUsed: false)
        ]),
        Topic(id: 2, words: [
            Words(id: 6, word: "Лев", prompt: "Король джунглей, большая грива", isUsed: false),
            Words(id: 7, word: "Пингвин", prompt: "Птица, которая не умеет летать, живет в Антарктиде", isUsed: false),
            Words(id: 8, word: "Слон", prompt: "Самое большое сухопутное животное, у него длинный хобот", isUsed: false),
            Words(id: 9, word: "Кенгуру", prompt: "Прыгает и носит детенышей в сумке на животе", isUsed: false),
            Words(id: 10, word: "Змея", prompt: "Бесногий рептилия, иногда ядовитая", isUsed: false)
        ]),
        Topic(id: 3, words: [
            Words(id: 11, word: "Россия", prompt: "Самая большая страна в мире", isUsed: false),
            Words(id: 12, word: "Бразилия", prompt: "Самая большая страна в Южной Америке, известна своими карнавалами", isUsed: false),
            Words(id: 13, word: "Япония", prompt: "Островное государство в Восточной Азии, известно своей технологией и культурой", isUsed: false),
            Words(id: 14, word: "Египет", prompt: "Страна пирамид и фараонов", isUsed: false),
            Words(id: 15, word: "Франция", prompt: "Страна Эйфелевой башни и моды", isUsed: false)
        ]),
        Topic(id: 4, words: [
            Words(id: 16, word: "Футбол", prompt: "Игра с мячом, играют 11 на 11, популярна во всем мире", isUsed: false),
            Words(id: 17, word: "Теннис", prompt: "Игра с ракетками и мячом, часто играют на траве или харде", isUsed: false),
            Words(id: 18, word: "Плавание", prompt: "Вид спорта в воде, включает разные стили", isUsed: false),
            Words(id: 19, word: "Баскетбол", prompt: "Игра с мячом, играют 5 на 5, бросают мяч в корзину", isUsed: false),
            Words(id: 20, word: "Лыжи", prompt: "Зимний вид спорта, спускаются с горы на двух палках", isUsed: false)
        ]),
        Topic(id: 5, words: [
            Words(id: 21, word: "Врач", prompt: "Лечит людей, работает в больнице", isUsed: false),
            Words(id: 22, word: "Учитель", prompt: "Преподает детям, работает в школе", isUsed: false),
            Words(id: 23, word: "Пожарный", prompt: "Борется с огнем, спасает людей", isUsed: false),
            Words(id: 24, word: "Повар", prompt: "Готовит еду, работает в ресторане", isUsed: false),
            Words(id: 25, word: "Архитектор", prompt: "Проектирует здания и строения", isUsed: false)
        ])
    ]
    
    func mainWord() {
        if numTopic == 0 {
            numTopic = Int.random(in: 1...5)
        }
        let topic = wordTopic[numTopic - 1]
        if let randomWord = topic.words.filter({ !$0.isUsed }).randomElement() {
            selectedWord = randomWord
            print(selectedWord)
        }
    }
}
