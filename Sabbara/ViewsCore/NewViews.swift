////
////  NewViews.swift
////  Sabbara
////
////  Created by Rand Alhassoun on 04/06/2023.
////
//
////
////  NewViews.swift
////  CoreTestSabbara
////
////  Created by Rand Alhassoun on 03/06/2023.
////
//
//import SwiftUI
//
//struct NewViews: View {
//    @Environment(\.managedObjectContext) var managedObjContext
//    @Environment(\.dismiss) var dismiss
//    
//    var round: FetchedResults<Round>.Element
//    
//    @FetchRequest(entity: Round.entity(), sortDescriptors: []) var fetchedResults: FetchedResults<Round>
//    
//    @State private var name = ""
//    @State private var selectedImage = "SabbaraChar4"
//    @State private var colors = "DGreen"
//    @State private var colorsShadow = "DGreenShadow"
//    @State private var words: [String] = []
//    
//    @State private var newWord = ""
//    @State private var errorMessage = ""
//    
//    
//    @State private var isEnteringImages = false
//    @State private var isEnteringWords = true
//    
//    
//    var body: some View {
//        NavigationView{
//            if isEnteringWords {
////                EditNameView(name: $name, nextAction: nextAction, round: round)
//
//                EditNameView(name: $name, nextAction: {
//                    isEnteringWords = false
//                    isEnteringImages = true
//                }, round: round)
//
//
//                .navigationBarHidden(true)
//            } else if isEnteringImages {
//                
//                EditImageView(selectedImage: $selectedImage, selectedcolors: $colors, selectedcolorsShadow: $colorsShadow, nextAction: {
//                    isEnteringImages = false
//                    submitEditAction()
//                }, BackAction: {
//                    isEnteringWords = true
//                    
//                }, round: round)
//                .navigationBarHidden(true)
//            } else {
//                EditWordView(words: $words, newWord: $newWord, errorMessage: $errorMessage, submitEditAction: submitEditAction, round: round)
//
////                WordEntryView(words: $words, newWord: $newWord, errorMessage: $errorMessage, submitEditAction: submitEditAction)
//                    .navigationBarHidden(true)
//            }
//            
////            private func submitEditAction() {
////                if words.count >= /*20*/ 2 { // Check if minimum word count is met
////                    DataController().editRound(Round: <#T##Round#>,
////                        name: name,
////                        images: selectedImage,
////                        words: words,//colorsShadow
////                        colors: colors,
////                        colorsShadow: colorsShadow,
////                        context: managedObjContext)
////                    dismiss()
////                } else {
////                    errorMessage = "Minimum word count not met. Please enter at least 20 words."
////                }
////            }
//            
//            
//        }
//    }
//    
//    private func submitEditAction() {
//        if words.count >= /*20*/ 2 { // Check if minimum word count is met
//
//            DataController().editRound(Round: round, name: name, images: selectedImage, words: words, colors: colors, colorsShadow: colorsShadow, context: managedObjContext)
//            dismiss()
//            
//        } else {
//            errorMessage = "Minimum word count not met. Please enter at least 20 words."
//        }
//    }
//
//
//}
//
////MARK: - Name
//struct EditNameView: View {
//    @Binding var name: String
//    var nextAction: () -> Void
//    
//    var round: FetchedResults<Round>.Element // Uncomment and define the round variable
//    
//    //var round: FetchedResults<Round>.Element
//
//    
//    @State private var offset: CGFloat = 10
//    @State private var Offset: CGFloat = 5
//    
//    var body: some View {
//        
//        VStack(/*alignment: .leading*/){
//            //Spacer()
//            
//            VStack(alignment: .leading){
//                Text("Name")
//                    .font(.title3)
//                    .padding()
//                
//                ZStack {
//                    
//                    let offset: CGFloat = 10
//                    RoundedRectangle (cornerRadius: 10)
//                        .frame(width: 350 , height: 58)
//                        . foregroundColor (Color("LYellowShadow"))
//                        .offset (x: Offset,y: offset)
//                    RoundedRectangle (cornerRadius: 10)
//                        .frame(width: 350 , height: 58)
//                        .foregroundColor (Color("LYellow"))
//                    
//                    
//                    TextField("\(round.name!)", text: $name)
//                        .frame(width: 340 , height: 58)
//                        .onAppear {
//                            name = round.name!}
//                }
//
//            }//v
//                //}
//                .padding()
//            
//            
//            Text("Maximum 25 letters")
//                .font(.caption2)
//            Spacer()
//            Spacer()
//            HStack{
////                Button("Back") {
////                    //
////                    //ImageSelectionView()
////                    nextAction()
////                }
////                .buttonStyle(SmallButton3D()).modifier(SmallButtonTextModifier())
//                Button("Next") {
//                    nextAction()
//                }
//                .buttonStyle(SmallButton3D()).modifier(SmallButtonTextModifier())
//                
//            }
//        }.padding()
//
//    }
//}
//
//
////MARK: - Image
//
//struct EditImageView: View {
//
//    @Binding var selectedImage: String
//    @Binding var selectedcolors: String
//    @Binding var selectedcolorsShadow: String
//
//
//
//    var nextAction: () -> Void
//    var BackAction: () -> Void
//
//    
//    var round: FetchedResults<Round>.Element // Uncomment and define the round variable
//
//    //@State private var selectedColor: Color = Color(rou)
//
//    @State private var selectedColor: Color = Color("DGreen")
//    @State private var selectedShadow: Color = Color("DGreenShadow")
//    @State private var selectedSabbara: Image = Image("SabbaraChar2")
//    //@State private var selectedImage: String = "SabbaraChar2"//Image("SabbaraChar2")
//
//    var body: some View {
//        VStack {
//
//
//                     
//            VStack {
//                
//                ZStack {
//                    RoundedRectangle(cornerRadius: 10)
//                        .frame(width: 215, height: 177)
//                        .foregroundColor(selectedShadow)
//                        //.foregroundColor(Color(round.colorsShadow ?? "DGreen"))
//
//                    //
//                        .offset(x: 5, y: 10)
//
//                    RoundedRectangle(cornerRadius: 10)
//                        .frame(width: 210, height: 177)
//                        .foregroundColor(selectedShadow)
//                        //.foregroundColor(Color(round.colors ?? "DGreen"))
//
//                    selectedSabbara
//                        .resizable()
//                        .frame(width: 140, height: 140)
//                        .cornerRadius(1)
//                }
//
//
//                VStack {
//                    Text("Choose your color")
//                        .font(.title2)
//                        .fontWeight(.regular)
//                        .foregroundColor(.black)
//                        .multilineTextAlignment(.trailing)
//
//                    HStack {
//                        ZStack{
//                            RoundedRectangle(cornerRadius: 10)
//                                .frame(width: 71, height: 61)
//                                .foregroundColor(Color("LYellowShadow"))
//                                .offset(x:2.5 ,y: 5)
//
//                            RoundedRectangle(cornerRadius: 10)
//                                .frame(width:  69.21, height: 59.37)
//                                .foregroundColor(Color("LYellow"))
//
//                                .onTapGesture {
//                                    selectedColor = Color("LYellow")
//                                    selectedcolors = "LYellow"
//                                    selectedShadow = Color("LYellowShadow")
//                                    selectedcolorsShadow = "LYellowShadow"
//                                }
//                        }
//
//                        ZStack{
//
//                            RoundedRectangle(cornerRadius: 10)
//                                .frame(width: 71, height: 61)
//                                .foregroundColor(Color("LpinkShadow"))
//                                .offset(x:2.5 ,y: 5)
//
//                            RoundedRectangle(cornerRadius: 10)
//                                .frame(width:  69.21, height: 59.37)
//                                .foregroundColor(Color("Lpink"))
//
//                                .onTapGesture {
//                                    selectedColor = Color("Lpink")
//                                    selectedcolors = "Lpink"
//                                    selectedShadow = Color("LpinkShadow")
//                                    selectedcolorsShadow = "LpinkShadow"
//                                }
//                        }
//
//                        ZStack{
//                            RoundedRectangle(cornerRadius: 10)
//                                .frame(width: 71, height: 61)
//                                .foregroundColor(Color("DPurpleShadow"))
//                                .offset(x:2.5 ,y: 5)
//
//                            RoundedRectangle(cornerRadius: 10)
//                                .frame(width:  69.21, height: 59.37)
//                                .foregroundColor(Color("DPurple"))
//
//                                .onTapGesture {
//                                    selectedColor = Color("DPurple")
//                                    selectedcolors = "DPurple"
//                                    selectedShadow = Color("DPurpleShadow")
//                                    selectedcolorsShadow = "DPurpleShadow"
//                                    
//                                }
//                        }
//
//                        ZStack{
//                            RoundedRectangle(cornerRadius: 10)
//                                .frame(width: 71, height: 61)
//                                .foregroundColor(Color("DGreenShadow"))
//                                .offset(x:2.5 ,y: 5)
//
//                            RoundedRectangle(cornerRadius: 10)
//                                .frame(width:  69.21, height: 59.37)
//                                .foregroundColor(Color("DGreen"))
//
//                                .onTapGesture {
//                                    selectedColor = Color("DGreen")
//                                    selectedcolors = "DGreen"
//                                    selectedShadow = Color("DGreenShadow")
//                                    selectedcolorsShadow = "DGreenShadow"
//                                }
//                        }
//                    } //HStackAllColors
//
//     //                Spacer()
//                } //VStackColorsAndCactus
//                .padding()
//                VStack {
//                    Text("Choose your Sabbara")
//                        .font(.title2)
//                        .fontWeight(.regular)
//                        .foregroundColor(.black)
//                        .multilineTextAlignment(.trailing)
//
//                    HStack {
//
//                        Image("SabbaraChar4")
//                            .resizable()
//                            .frame(width: 69.21, height: 57)
//                            .cornerRadius(1)
//                            .onTapGesture {
//                                selectedSabbara = Image("SabbaraChar4")
//                                selectedImage = "SabbaraChar4"
//
//                            }
//
//                        Image("SabbaraChar3")
//                            .resizable()
//                            .frame(width: 69.21, height: 57)
//                            .cornerRadius(1)
//                            .onTapGesture {
//                                selectedSabbara = Image("SabbaraChar3")
//                                selectedImage = "SabbaraChar3"
//
//                            }
//
//                        Image("SabbaraChar1")
//                            .resizable()
//                            .frame(width: 69.21, height: 57)
//                            .cornerRadius(1)
//                            .onTapGesture {
//                                selectedSabbara = Image("SabbaraChar1")
//                                selectedImage = "SabbaraChar1"
//
//                            }
//
//                        Image("SabbaraChar2")
//                            .resizable()
//                            .frame(width: 44.88, height: 57)
//                            .cornerRadius(1)
//
//                            .onTapGesture {
//                                selectedSabbara = Image("SabbaraChar2")
//                                selectedImage = "SabbaraChar2"
//
//     //                                .resizable()
//     //                                .frame(width: 44.88, height: 57) as! Image
//
//
//                            }
//
//                    } //AllImagesHStack
//                    .padding(.leading)
//                }
//                Spacer()
//                .padding(.trailing)
//            }
//
//            HStack{
//                Button("Back") {
//                    //nextAction()
//                    BackAction()
//
//                }
//                .buttonStyle(SmallButton3D()).modifier(SmallButtonTextModifier())//
//                
//                Button("Next") {
//                    nextAction()
//                }
//                .buttonStyle(SmallButton3D()).modifier(SmallButtonTextModifier())
//            }
//
//        }
//        .padding()
//    }
//}
//
////MARK: - Image
//
//struct EditWordView: View {
//    @Binding var words: [String]
//    @Binding var newWord: String
//    @Binding var errorMessage: String
//    var submitEditAction: () -> Void
//    
//    var round: FetchedResults<Round>.Element
//    
//    @State private var offset: CGFloat = 10
//    @State private var Offset: CGFloat = 5
//    
//    var body: some View {
//        VStack {
//            VStack(alignment: .leading) {
//                Text("Words")
//                    .font(.title3)
//                    .padding()
//                
//                ZStack {
//                    RoundedRectangle(cornerRadius: 10)
//                        .foregroundColor(Color("LYellowShadow"))
//                        .frame(width: 350, height: 350)
//                        .offset(x: Offset, y: offset)
//                    
//                    RoundedRectangle(cornerRadius: 10)
//                        .foregroundColor(Color("LYellow"))
//                        .frame(width: 350, height: 350)
//                    
//                    ScrollView {
//                        VStack {
//                            ForEach(words.indices, id: \.self) { index in
//                                HStack {
//                                    Spacer()
//                                    
//                                    TextField("Word \(index + 1)", text: $words[index])
//                                        .frame(width: 300, height: 58)
//                                    
//                                    Spacer()
//                                    
//                                    Image(systemName: "trash.circle.fill")
//                                        .resizable()
//                                        .frame(width: 25, height: 25)
//                                        .foregroundColor(.red)
//                                        .onTapGesture {
//                                            deleteWord(at: index)
//                                        }
//                                    
//                                    Spacer()
//                                }
//                            }
//                        }
//                        .frame(width: 350)
//                    }
//                    .frame(height: 350)
//                }
//            }
//            .padding()
//            
//            ZStack {
//                RoundedRectangle(cornerRadius: 10)
//                    .frame(width: 350, height: 58)
//                    .foregroundColor(Color("LYellowShadow"))
//                    .offset(x: Offset, y: offset)
//                
//                RoundedRectangle(cornerRadius: 10)
//                    .frame(width: 350, height: 58)
//                    .foregroundColor(Color("LYellow"))
//                
//                Button(action: addWord) {
//                    Label("Add Word", systemImage: "plus.circle")
//                }
//            }
//            
//            Text(errorMessage)
//                .foregroundColor(.red)
//                .padding()
//            
//            Button("Submit") {
//                //submitAction()
//                submitEditAction()
//            }
//            .buttonStyle(BigButton3D()).modifier(BigAndMediumButtonTextModifier())
//        }
//        .padding()
//        .onAppear {
//            words = round.words ?? []
//        }
//    }
//    
//    private func deleteWord(at index: Int) {
//        words.remove(at: index)
//    }
//    private func addWord() {
//        words.append("")
//    }
//
////    Button("Submit") {
////        //submitAction()
////        submitEditAction()
////    }
////    .buttonStyle(BigButton3D()).modifier(BigAndMediumButtonTextModifier())
////    private func addWord() {
////        if !newWord.isEmpty {
////            words.append(newWord)
////            newWord = ""
////        }
////    }
//}
//
//
////struct EditWordView: View {
////    @Binding var words: [String]
////    @Binding var newWord: String
////    @Binding var errorMessage: String
////    var submitEditAction: () -> Void
////
////    var round: FetchedResults<Round>.Element // Uncomment and define the round variable
////
//////    var round: FetchedResults<Round>.Element
////
////    @State private var offset: CGFloat = 10
////    @State private var Offset: CGFloat = 5
////
////
////    var body: some View {
////        VStack {
////
////            VStack(alignment: .leading){
////               // ScrollView{
////
////                Text("words")
////                    .font(.title3)
////                    .padding()
////
////                    ZStack {
////
////
////
////                        RoundedRectangle (cornerRadius: 10)
////                            . foregroundColor (Color("LYellowShadow"))
////                            .frame(width: 350 , height: 350)
////                            .offset (x: Offset,y: offset)
////                        RoundedRectangle (cornerRadius: 10)
////                            .foregroundColor (Color("LYellow"))
////                            .frame(width: 350 , height: 350)
////
////
////
////                        //Section(header: Text("Words").font(.title3)){
////                        ScrollView {
////                        VStack{
////                            ForEach(words.indices, id: \.self) { index in
////
////
////                                HStack{
////                                    Spacer()
////
////                                    TextField("Word \(index + 1)", text: $words[index])
////                                        .frame(width: 300 , height: 58)
////
////                                    Spacer()
////                                    Image(systemName:"trash.circle.fill" )
////                                        .resizable()
////                                        .frame(width: 25, height: 25)
////                                        .foregroundColor(.red)
////                                        .onTapGesture {
////                                            deleteWord(at: index)
////                                        }
////                                    Spacer()
////
////
////                                }//H
////                                //.padding()
////                            }//foreach
////
////                        }//v
////                        .frame(width: 350)
////
////                        }                .frame(height: 350)
////
////                    }//v
////
////                //}//scrool
////                //.frame(height: 350)
////            }//v
////            .padding()
////
////
////            ZStack {
////
////
////
////                //let offset: CGFloat = 10
////                RoundedRectangle (cornerRadius: 10)
////                    .frame(width: 350 , height: 58)
////                    . foregroundColor (Color("LYellowShadow"))
////                    .offset (x: Offset,y: offset)
////                RoundedRectangle (cornerRadius: 10)
////                    .frame(width: 350 , height: 58)
////                    .foregroundColor (Color("LYellow"))
////
//////                    Section() {
////                    Button(action: addWord) {
////                        Label("Add Word", systemImage: "plus.circle")
////                    }
////
////                }
////
////
////
////            Text(errorMessage)
////                .foregroundColor(.red)
////                .padding()
////
////
////
//////            Button("Submit") {
//////                DataController().editRound(Round: round, name: name, images: images, words: words, colors: colors, colorsShadow: colorsShadow, context: managedObjContext)
//////                dismiss()
//////            }
//////            .buttonStyle(BigButton3D()).modifier(BigAndMediumButtonTextModifier())
//////
////
////        }
////        .padding()
////    }
////
////
////    private func deleteWord(at index: Int) {
////        words.remove(at: index)
////    }
////
////
////    private func addWord() {
////        if !newWord.isEmpty {
////            words.append(newWord)
////            newWord = ""
////        }
////    }
////}
//
//
////struct NewViews_Previews: PreviewProvider {
////    static var previews: some View {
////        let round = fetchedResults.first
////        NewViews(round: round)
////    }
////}
