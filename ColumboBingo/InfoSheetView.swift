//  InfoSheetView.swift
//  ColumboBingo
//  Made with ♥︎ by Inge Chiles on 5/16/24.

import SwiftUI

struct InfoSheetView: View {
    @Environment(\.dismiss) var dismiss

    let helloMessage = """
            Hi! My name is Inge. I'm an iOS developer who \
            also happens to love everyone's favorite 70s TV \
            detective. I made this app as a gift for my \
            friend Milena, who loves him, too. \
            Milena and \
            Columbo actually have a few things in common: \
            they're both Italian, they make me laugh til \
            my sides hurt, and they make the world a \
            friendlier, more jubilant place. Happy birthday \
            Milena! We love you!
            """

    let disclaimer = """
            Disclaimer: I do not own the rights to any \
            characters, images, fonts, or dialogue from \
            Columbo. Dialogue and images from the show are \
            owned solely by NBC Universal. The font used for \
            the logo and launch screen is Helvetica Neue \
            Bold, the copyright for which is held by Monotype \
            Imaging.
            """

    var body: some View {
        ScrollView {
            VStack {
                Spacer()

                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward.circle")
                            .foregroundStyle(.oliveYou)
                    }
                    Text("About")
                }
                .font(.largeTitle)

                Spacer()

                Text(helloMessage)
                    .font(.title2)

                Spacer()

                Image("giving-milena-her-cake")
                    .resizable()
                    .scaledToFit()
                    .padding()

                Text(disclaimer)
                    .font(.callout)

                Spacer()

            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .background(Color.backgroundCream)
    }
}

#Preview {
    InfoSheetView()
}
