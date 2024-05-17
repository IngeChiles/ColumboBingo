//  ContentView.swift
//  ColumboBingo
//  Made with ♥︎ by Inge Chiles on 4/29/24.

import SwiftUI

struct ContentView: View {
    @StateObject var bm = BingoViewModel()
    
    let columns = Array(repeating: GridItem(.flexible()), count: 4)
    
    @State private var showingInfoSheet = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Spacer()
                    LazyVGrid(columns: columns, content: {
                        ForEach(0..<bm.tropes.count, id: \.self) { index in
                            Button(action: {
                                bm.buttonTap(index: index)
                            }, label: {
                                Text(bm.tropes[index]).minimumScaleFactor(0.5)
                                    .padding(.vertical)
                                    .padding(.horizontal, 8)
                                    .frame(width: 80, height: 80)
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
                        title: Text("BINGO!"),
                        message:
                            Text(bm.alertMessages.randomElement() ?? "Well Done!"),
                        dismissButton: .default(Text("Play Again"), action: bm.resetBoard)
                    )
                })
                .navigationTitle("Columbo Bingo").preferredColorScheme(.light)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showingInfoSheet.toggle()
                        }) {
                            Image(systemName: "info.circle")
                                .font(.title2)
                        }
                    }
                }
                .sheet(isPresented: $showingInfoSheet) {
                    InfoSheetView()
                }
                
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color("ColumboYellow"),
                        Color("BackgroundCream")
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
        }
    }
}

#Preview {
    ContentView()
}
