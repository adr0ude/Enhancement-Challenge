import SwiftUI

struct ContentView: View {
    @State private var textInput: String = ""

    var body: some View {
        NavigationView {
            ZStack {
                Color.purple.edgesIgnoringSafeArea(.all)

                VStack(spacing: 20) {
                    TextField("Insira o texto aqui", text: $textInput)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .foregroundColor(.black)

                    HStack(spacing: 20) {
                        Button("Limpar") {
                            textInput = ""
                        }
                        .font(.headline)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)

                        NavigationLink(destination: MenuOptionsView(textInput: $textInput)) {
                            Text("Menu")
                                .font(.headline)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }

                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Editor de Texto")
        }
    }
}

struct MenuOptionsView: View {
    @Binding var textInput: String

    var body: some View {
        ZStack {
            Color.purple.edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                NavigationLink(destination: WordCountView(textInput: textInput)) {
                    Text("Contar Palavras")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .foregroundColor(.purple)
                        .cornerRadius(10)
                }

                NavigationLink(destination: SearchWordView(textInput: textInput)) {
                    Text("Buscar Palavra")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .foregroundColor(.purple)
                        .cornerRadius(10)
                }

                NavigationLink(destination: ReplaceWordView(textInput: $textInput)) {
                    Text("Substituir Palavra")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .foregroundColor(.purple)
                        .cornerRadius(10)
                }

                NavigationLink(destination: SortWordsView(textInput: textInput)) {
                    Text("Ordenar Palavras")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .foregroundColor(.purple)
                        .cornerRadius(10)
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Menu de Opções")
    }
}

struct WordCountView: View {
    var textInput: String

    var body: some View {
        ZStack {
            Color.purple.edgesIgnoringSafeArea(.all)

            VStack {
                let wordCount = countWords(in: textInput)
                Text("Contagem de palavras: \(wordCount)")
                    .font(.title2)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Contar Palavras")
    }

    func countWords(in text: String) -> Int {
        return text.split { $0.isWhitespace }.count
    }
}

struct SearchWordView: View {
    var textInput: String
    @State private var searchWordText: String = ""
    @State private var output: String = ""

    var body: some View {
        ZStack {
            Color.purple.edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                TextField("Palavra para buscar", text: $searchWordText)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)

                Button("Buscar") {
                    if searchWordText.isEmpty {
                        output = "Insira uma palavra para buscar."
                    } else if textInput.range(of: searchWordText, options: .caseInsensitive) != nil {
                        let occurrences = searchWord(in: textInput, word: searchWordText)
                        output = "Ocorrências da palavra '\(searchWordText)': \(occurrences)"
                    } else {
                        output = "A palavra '\(searchWordText)' não foi encontrada."
                    }
                }
                .font(.headline)
                .padding()
                .background(Color.white)
                .foregroundColor(.purple)
                .cornerRadius(10)

                Text(output)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Buscar Palavra")
    }

    func searchWord(in text: String, word: String) -> Int {
        return text.lowercased().components(separatedBy: word.lowercased()).count - 1
    }
}

struct ReplaceWordView: View {
    @Binding var textInput: String
    @State private var replaceTarget: String = ""
    @State private var replaceReplacement: String = ""
    @State private var output: String = ""
    @State private var tempText: String = ""

    var body: some View {
        ZStack {
            Color.purple.edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                TextField("Palavra antiga", text: $replaceTarget)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)

                TextField("Palavra nova", text: $replaceReplacement)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)

                Button("Substituir") {
                    if replaceTarget.isEmpty || replaceReplacement.isEmpty {
                        output = "Ambos os campos devem ser preenchidos."
                    } else if textInput.range(of: replaceTarget, options: .caseInsensitive) != nil {
                        tempText = replaceWord(in: textInput, target: replaceTarget, replacement: replaceReplacement)
                        output = "Substituição realizada com sucesso."
                    } else {
                        output = "A palavra '\(replaceTarget)' não foi encontrada no texto."
                    }
                }
                .font(.headline)
                .padding()
                .background(Color.white)
                .foregroundColor(.purple)
                .cornerRadius(10)

                Text(output)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)

                Button("Confirmar Alteração") {
                    textInput = tempText
                }
                .font(.headline)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Substituir Palavra")
    }

    func replaceWord(in text: String, target: String, replacement: String) -> String {
        return text.replacingOccurrences(of: target, with: replacement, options: .caseInsensitive)
    }
}

struct SortWordsView: View {
    var textInput: String

    var body: some View {
        ZStack {
            Color.purple.edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                let sortedWords = sortWords(in: textInput)

                ScrollView {
                    Text(sortedWords.joined(separator: "\n"))
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Ordenar Palavras")
    }

    func sortWords(in text: String) -> [String] {
        let words = text.split { $0.isWhitespace }.map { String($0) }
        return words.sorted { $0.localizedCaseInsensitiveCompare($1) == .orderedAscending }
    }
}
