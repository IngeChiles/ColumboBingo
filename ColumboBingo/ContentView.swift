//  ContentView.swift
//  ColumboBingo
//  Made with ♥︎ by Inge Chiles on 4/29/24.

import SwiftUI

struct ContentView: View {
    @StateObject var bvm = BingoViewModel()

    let columns = Array(repeating: GridItem(.flexible()), count: 4)

    @State private var showingInfoSheet = false

    var body: some View {
        NavigationStack {
                VStack {
                    Image(bvm.currentColumboPhoto)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .padding()

                    LazyVGrid(columns: columns, content: {
                        ForEach(0..<bvm.tropes.count, id: \.self) { index in
                            tropeButton(index: index)                        }
                    })
                    .padding()
                }
                .alert(isPresented: $bvm.itsBingo, content: {
                    Alert(
                        title: Text("BINGO!"),
                        message: Text(bvm.alertMessages.randomElement() ?? "Well Done!"),
                        dismissButton: .default(Text("Play Again"),
                        action: bvm.resetBoard)
                    )
                })
                .navigationTitle("Columbingo!")
                .preferredColorScheme(.light)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            showingInfoSheet.toggle()
                        } label: {
                            Image(systemName: "info.circle")
                                .font(.title2)
                                .foregroundStyle(.columboYellow)
                        }
                    }
                }
                .sheet(isPresented: $showingInfoSheet) {
                    InfoSheetView()
                }
                .background(Color.oliveYou.edgesIgnoringSafeArea(.all))
        }
    }
    private func tropeButton(index: Int) -> some View {
        Button(action: {
            bvm.buttonTap(index: index)
        }, label: {
            RoundedRectangle(cornerRadius: 10)
                .aspectRatio(contentMode: .fill)
                .foregroundStyle(bvm.tappedIndices.contains(index) ? .groovyGreen : .white)
                .overlay(
                    Text(bvm.tropes[index])
                        .minimumScaleFactor(0.5)
                        .padding(10)
                )
        })
    }
}

#Preview {
    ContentView()
}
