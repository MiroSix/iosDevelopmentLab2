//
//  ContentView.swift
//  RPNCalculator
//
//  Created by Miro Six on 09/10/2025.
//

import SwiftUI

struct ContentView: View {
    @State var result = ""
    @State var calcEngine = CalcEngine()
    
    var body: some View {
        
        VStack {
            HStack {
                //calculator stack
                VStack {
                    TextEditor(text: $result)
                        .frame(width: 100, height: 150)
                        .border(Color.black)
                }
                Grid {
                    GridRow{
                        ForEach(7..<10) { number in
                            NumberButtonView(number: number) {
                                calcEngine.addDigitToNumber(number)
                            }
                        }
                        Button("/") {
                            result = calcEngine.addOperatorAndNumber("/") + result
                        }
                    }
                    GridRow{
                        ForEach(4..<7) { number in
                            NumberButtonView(number: number) {
                                calcEngine.addDigitToNumber(number)
                            }
                        }
                        Button("*") {
                            result = calcEngine.addOperatorAndNumber("*") + result
                        }
                    }
                    GridRow{
                        ForEach(1..<4) { number in
                            NumberButtonView(number: number) {
                                calcEngine.addDigitToNumber(number)
                            }
                        }
                        Button("-") {
                            result = calcEngine.addOperatorAndNumber("-") + result
                        }
                    }
                    GridRow{
                        NumberButtonView(number: 0) {
                            calcEngine.addDigitToNumber(0)
                        }
                        Text("")
                        Text("")
                        Button("+") {
                            result = calcEngine.addOperatorAndNumber("+") + result
                        }
                    }
                    GridRow{
                        Button("Clear"){
                            calcEngine.clearCurrentNumber()
                        }.gridCellColumns(2)
                        Button("Enter"){
                           calcEngine.enter()
                        }.gridCellColumns(2)
                    }
                }
            }
            Button("Show Stack") {
                result = calcEngine.returnCurrentStack() + result
            }
        }.padding()
    }
}

#Preview {
    ContentView()
}

