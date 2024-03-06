//
//  ContentView.swift
//  RollDice
//
//  Created by Leo  on 05.03.24.
//

import SwiftUI

struct ContentView: View {
    @State private var result: Int = 1
    @State private var total: Int = 0
    
    @State private var selectedDiceSides = 6
    @State private var diceSides = [4, 6, 8, 10, 12, 20, 100]
    
    @State private var rolls: [Int] = []
    
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var counter = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("\(result)")
                    .padding()
                    .font(.system(size: 100, weight: .heavy, design: .rounded))
                    .foregroundStyle(.red)
                
//                Text("Your dice rolls so far:")
//                    .padding(.top, 50)
//                    .font(.title3)
//                    .foregroundStyle(.red)
                
//                Text("\(rolls.map(String.init).joined(separator: ", "))")
//                    .padding()
//                    .font(.title3.bold())
//                    .foregroundStyle(.secondary)
                
                Spacer()
                
//                Text("Total: \(total)")
//                    .font(.title3.bold())
//                    .foregroundStyle(.red)
                    
                
                Spacer()
                
                Text("Pick the number of sides your dice should have:")
                    .padding(.horizontal)
                    .foregroundStyle(.yellow)
                    .font(.title.bold())
                    .multilineTextAlignment(.center)
                
                Picker("Pick the number of sides your dice should have:", selection: $selectedDiceSides) {
                    ForEach(diceSides, id: \.self) { sides in
                        Text("\(sides)")
                    }
                }
                .padding()
                .pickerStyle(.segmented)
                .font(.title.bold())
                
                Button {
                    self.timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
                    rollDice()
                } label: {
                    Image(systemName: "cube")
                    Text("Roll the dice")
                }
                .padding()
                .foregroundStyle(.white)
                .buttonStyle(.borderedProminent)
                .tint(.secondary)
                .sensoryFeedback(.increase, trigger: result)
                
                Spacer()
            }
            .onReceive(timer) { time in
                if counter == 15 {
                    timer.upstream.connect().cancel()
                    counter = 0
                } else {
                    rollDice()
                    counter += 1
                }
            }
        }
    }
    
    
    func rollDice() {
        if selectedDiceSides == 4 {
            result = Int.random(in: 1...4)
        } else if selectedDiceSides == 6 {
            result = Int.random(in: 1...6)
        } else if selectedDiceSides == 8 {
            result = Int.random(in: 1...8)
        } else if selectedDiceSides == 10 {
            result = Int.random(in: 1...10)
        } else if selectedDiceSides == 10 {
            result = Int.random(in: 1...10)
        } else if selectedDiceSides == 12 {
            result = Int.random(in: 1...12)
        } else if selectedDiceSides == 20 {
            result = Int.random(in: 1...20)
        } else if selectedDiceSides == 100 {
            result = Int.random(in: 1...100)
        }
        rolls.append(result)
        total += result
    }
}

#Preview {
    ContentView()
}
