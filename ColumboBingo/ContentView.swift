//  ContentView.swift
//  ColumboBingo
//  Made with ♥︎ by Inge Chiles on 4/29/24.

import SwiftUI

struct ContentView: View {
    @StateObject var bm = BingoModel()
    
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Spacer()
                    LazyVGrid(columns: columns, content: {
                        ForEach(0..<Int(bm.tropes.count)) { index in
                            Button(action: {
                                bm.buttonTap(index: index)
                            }, label: {
                                Text(bm.tropes[index])
                                    .padding()
                                    .frame(width: 110, height: 110)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.black)
                                            .fill(bm.tappedIndices.contains(index) ? .yellow : .white
                                                 )
                                    )
                                    .padding(.vertical, 5)
                            })
                        }
                    })
                    .padding()
                    Spacer()
                }
                .alert(isPresented: $bm.itsBingo, content: {
                    Alert(
                        title: Text("You Got All The Tropes"),
                        message: Text(""),
                        dismissButton: .default(Text("Reset Game"), action: bm.resetBoard)
                    )
                })
                .navigationTitle("Columbo Bingo")
            }
            //            .background(
            //                LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
            //            )
        }
    }
}

#Preview {
    ContentView()
}


/*
 struct ContentView: View {
 var bm = BingoModel()
 let columns = [
 GridItem(.adaptive(minimum: 150))
 ]
 let tropes = ["Is Sleepy","Murderer Has Butler", "Raincoat Commented On", "70's Rapid Camera Zoom", "Mentions Wife", "'One More Thing' X 2", "*Smacks Forehead*", "Cigar Commented On", "Brags About Car"]
 
 var body: some View {
 VStack {
 LazyVGrid(columns: columns, content: {
 ForEach(0..<8) { trope in
 Button(action: {
 bm.buttonTap(i: trope)
 }, label: {
 Text(bm.buttonLabel(i:trope))
 .padding(.vertical)
 .frame(maxWidth: .infinity)
 })
 }
 })
 }
 .padding()
 }
 }
 
 // this only displays 8 X's
 */
