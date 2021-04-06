//
//  ContentView.swift
//  GuessNumberApp
//
//  Created by Светлана Романенко on 06.04.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue = 50.0
    @State private var showAlert = false
    @State private var targetValue = Int.random(in: 0...100)
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
            HStack {
                Text("0")
                SliderUIView(
                    sliderValue: $currentValue,
                    alpha: .constant(CGFloat(computeScore())/100))
                Text("100")
            }
            .padding()
            Button(action: {
                showAlert.toggle()
            }) {
                Text("Проверь меня!")
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Your Score"), message: Text("\(computeScore())"))
            }
            Button(action: {
                targetValue = Int.random(in: 0...100)
            }) {
                Text("Начать заново")
            }
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
