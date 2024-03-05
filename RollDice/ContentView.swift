//
//  ContentView.swift
//  RollDice
//
//  Created by Leo  on 05.03.24.
//

import SwiftUI

struct ContentView: View {
    @State private var result: Int = 1
    @State private var rolls: [Int] = []
    
    var body: some View {
        ZStack {
            Color(.black)
            
            VStack {
                Spacer()
                
                Text("\(result)")
                    .padding()
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                Text("Your dice rolls so far:")
                    .padding(.top, 50)
                    .font(.title3)
                    .foregroundStyle(.white)
                Text("\(rolls.map(String.init).joined(separator: ", "))")
                    .padding()
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Spacer()
                
                Button {
                    rollDice()
                } label: {
                    Image(systemName: "cube")
                    Text("Roll the dice")
                }
                .foregroundStyle(.purple)
                .buttonStyle(.bordered)
                
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
    
    
    func rollDice() {
        result = Int.random(in: 1...6)
        rolls.append(result)
    }
}

#Preview {
    ContentView()
}
