//
//  ContentView.swift
//  WordCount
//
//  Created by Sourajyesh on 21/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var paragraph = ""
    @State private var wordCount = 0

    var body: some View {
        VStack {
            TextEditor(text: $paragraph)
                .border(Color.blue, width: 2)
                .padding()
            
            Text("Word Count: \(wordCount)")
                .font(.title)
                .onChange(of: paragraph, perform: { value in
                    wordCount = countWords(in: paragraph)
                })

            
            .padding()
        }

    }

    func countWords(in text: String) -> Int {
        let words = text.split { !$0.isLetter }
        return words.count
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

