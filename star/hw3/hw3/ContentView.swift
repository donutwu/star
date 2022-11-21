//
//  ContentView.swift
//  hw3
//
//  Created by User06 on 2022/11/9.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    @State private var isgood = true
    @State private var name = ""
    @State private var showAlert = false
    @State private var age: Double = 1
    var body: some View {
        VStack {
           
            TextField("你的名字", text: $name)
                .overlay(textFieldBorder)
                .padding()
       
            Button( action:{showAlert=true}){
                Text("輸出")
               
            }
            Spacer()
            .alert(isPresented: $showAlert, content: {
                     
                     return Alert(title: Text(name+"你好,歡迎進入星座模擬器"))
                 })

            /*.fullScreenCover(isPresented: $isPresented, content: {
                star()
            })*/
            
                
            Toggle(isOn: $isgood) {
                        Text("今天心情好嗎?")
                        }
            Text(isgood ? "心情好那恭喜" : "心情不好來看個意見吧")
            if(isgood){
               
                Image(  "happy" )
             .resizable()
                .frame(width: 100, height: 100)
                
            }
            else {
                Image(  "bad" )
                 .resizable()
                    .frame(width: 100, height: 100)
                
             }
            Spacer()
            Button("前往") {
                isPresented = true
                }
            .fullScreenCover(isPresented: $isPresented, content: {
                star()
            })
              Text("滿意程度:\(Int(age))")
                   Slider(value: $age, in: 1...5, step: 1)
        }
            
          }
        }
var textFieldBorder: some View {
        RoundedRectangle(cornerRadius: 40)
            .stroke(Color.blue, lineWidth: 5)
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        
        }
    }
}
