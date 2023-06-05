//
//  AddRoundView2.swift
//  CoreTestSabbara
//
//  Created by Rand Alhassoun on 28/05/2023.
//

import SwiftUI


import SwiftUI

let images = ["SabbaraChar1", "SabbaraChar2", "SabbaraChar3"]

struct AddRoundView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var selectedImage = "SabbaraChar4"//"SabbaraChar1"
    @State private var words = [String]()
    @State private var colors = "DGreen"
    @State private var colorsShadow = "DGreenShadow"
    
    //
    @State private var newWord = ""
    @State private var errorMessage = ""
    @State private var isEnteringImages = false
    @State private var isEnteringWords = true
    
    
    @State private var offset: CGFloat = 10
    @State private var Offset: CGFloat = 5
    
    
    var body: some View {
        NavigationView {
            if isEnteringWords {
                NameEntryView(name: $name, nextAction: {
                    isEnteringWords = false
                    isEnteringImages = true
                    
                    //                    submitAction()
                })
                .navigationBarHidden(true)
            } else if isEnteringImages {
                ImageSelectionView(selectedImage: $selectedImage, selectedcolors: $colors, selectedcolorsShadow: $colorsShadow, nextAction: {
                    isEnteringImages = false
                    submitAction()
                    
                    //isEnteringWords = true
                },BackAction: {
                    isEnteringWords = true

//                    isEnteringImages = false
                    //submitAction()
                    
                })
                .navigationBarHidden(true)
            } else {
                WordEntryView(words: $words, newWord: $newWord, errorMessage: $errorMessage, submitAction: submitAction)
                    .navigationBarHidden(true)
            }
            
            
        }
    }
    
    private func submitAction() {
        if words.count >= /*20*/ 2 { // Check if minimum word count is met
            DataController().addRound(
                name: name,
                images: selectedImage,
                words: words,//colorsShadow
                colors: colors,
                colorsShadow: colorsShadow,
                context: managedObjContext)
            dismiss()
            
        } else {
            errorMessage = "Minimum word count not met. Please enter at least 20 words."                    //.font(.custom("TufuliArabicDEMO-Medium", size: 24))

        }
    }
}

struct ImageSelectionView: View {
    @Binding var selectedImage: String
    @Binding var selectedcolors: String
    @Binding var selectedcolorsShadow: String
    

    var nextAction: () -> Void
    var BackAction: () -> Void

//    var BackAction: () -> Void
//
//    var nextAction: () -> Void
    @State private var selectedColor: Color = Color("DGreen")
    @State private var selectedShadow: Color = Color("DGreenShadow")
    @State private var selectedSabbara: Image = Image("SabbaraChar2")
    //@State private var selectedImage: String = "SabbaraChar2"//Image("SabbaraChar2")
    
    var body: some View {
        VStack {
            
            //MARK: -
            VStack {
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 215, height: 177)
                        .foregroundColor(selectedShadow)
                    //
                        .offset(x: 5, y: 10)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 210, height: 177)
                        .foregroundColor(selectedColor)
                    
                    selectedSabbara
                        .resizable()
                        .frame(width: 140, height: 140)
                        .cornerRadius(1)
                }
                
                
                Spacer()
                VStack(alignment: .leading){
                    Text("Choose your color")
                        .font(.custom("TufuliArabicDEMO-Medium", size: 24))

                        //.font(.title2)
                        .fontWeight(.regular)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.trailing)
                    
                    HStack {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 71, height: 61)
                                .foregroundColor(Color("LYellowShadow"))
                                .offset(x:2.5 ,y: 5)
                            
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width:  69.21, height: 59.37)
                                .foregroundColor(Color("LYellow"))
                            
                                .onTapGesture {
                                    selectedColor = Color("LYellow")
                                    selectedcolors = "LYellow"
                                    selectedShadow = Color("LYellowShadow")
                                    selectedcolorsShadow = "LYellowShadow"
                                }
                        }
                        
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 71, height: 61)
                                .foregroundColor(Color("LpinkShadow"))
                                .offset(x:2.5 ,y: 5)
                            
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width:  69.21, height: 59.37)
                                .foregroundColor(Color("Lpink"))
                            
                                .onTapGesture {
                                    selectedColor = Color("Lpink")
                                    selectedcolors = "Lpink"
                                    selectedShadow = Color("LpinkShadow")
                                    selectedcolorsShadow = "LpinkShadow"
                                }
                        }
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 71, height: 61)
                                .foregroundColor(Color("DPurpleShadow"))
                                .offset(x:2.5 ,y: 5)
                            
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width:  69.21, height: 59.37)
                                .foregroundColor(Color("DPurple"))
                            
                                .onTapGesture {
                                    selectedColor = Color("DPurple")
                                    selectedcolors = "DPurple"
                                    selectedShadow = Color("DPurpleShadow")
                                    selectedcolorsShadow = "DPurpleShadow"
                                    
                                }
                        }
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 71, height: 61)
                                .foregroundColor(Color("DGreenShadow"))
                                .offset(x:2.5 ,y: 5)
                            
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width:  69.21, height: 59.37)
                                .foregroundColor(Color("DGreen"))
                            
                                .onTapGesture {
                                    selectedColor = Color("DGreen")
                                    selectedcolors = "DGreen"
                                    selectedShadow = Color("DGreenShadow")
                                    selectedcolorsShadow = "DGreenShadow"
                                }
                        }
                    } //HStackAllColors
                    
                    //                Spacer()
                } //VStackColorsAndCactus
                .padding()
                Spacer()
                VStack(alignment: .leading){
                    Text("Choose your Sabbara")
                        .font(.custom("TufuliArabicDEMO-Medium", size: 24))
                        .fontWeight(.regular)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.trailing)
                    
                    HStack {
                        
                        Image("SabbaraChar4")
                            .resizable()
                            .frame(width: 69.21, height: 57)
                            .cornerRadius(1)
                            .onTapGesture {
                                selectedSabbara = Image("SabbaraChar4")
                                selectedImage = "SabbaraChar4"
                                
                            }
                        
                        Image("SabbaraChar3")
                            .resizable()
                            .frame(width: 69.21, height: 57)
                            .cornerRadius(1)
                            .onTapGesture {
                                selectedSabbara = Image("SabbaraChar3")
                                selectedImage = "SabbaraChar3"
                                
                            }
                        
                        Image("SabbaraChar1")
                            .resizable()
                            .frame(width: 69.21, height: 57)
                            .cornerRadius(1)
                            .onTapGesture {
                                selectedSabbara = Image("SabbaraChar1")
                                selectedImage = "SabbaraChar1"
                                
                            }
                        
                        Image("SabbaraChar2")
                            .resizable()
                            .frame(width: 44.88, height: 57)
                            .cornerRadius(1)
                        
                            .onTapGesture {
                                selectedSabbara = Image("SabbaraChar2")
                                selectedImage = "SabbaraChar2"
                                
                                
                            }
                        
                    } //AllImagesHStack
                    .padding(.leading)
                }
                Spacer()
                    .padding(.trailing)
            }
            //MARK: -
            
            HStack{
               
                Button("Next") {
                    nextAction()
                }
                
                .buttonStyle(SmallButton3D()).modifier(SmallButtonTextModifier())
                
                Button("Back") {
                    BackAction()
                    //nextAction()
                }
                .foregroundColor(Color("Lpink"))
                .buttonStyle(WhSmallButton3D()).modifier(BigAndMediumButtonTextModifier())

            }
            
        }
        .padding()
    }
}

struct NameEntryView: View {
    @Binding var name: String
    var nextAction: () -> Void
    
    @State private var offset: CGFloat = 10
    @State private var Offset: CGFloat = 5
    
    var body: some View {
        
        VStack(/*alignment: .leading*/){
            //Spacer()
            VStack(alignment: .leading){
                Text("Round Name")
                    .font(.custom("TufuliArabicDEMO-Medium", size: 24))

                    .font(.title3)
                //.padding()
                ZStack {
                    
                    let offset: CGFloat = 10
                    RoundedRectangle (cornerRadius: 10)
                        .frame(width: 350 , height: 58)
                        . foregroundColor (Color("LYellowShadow"))
                        .offset (x: Offset,y: offset)
                    RoundedRectangle (cornerRadius: 10)
                        .frame(width: 350 , height: 58)
                        .foregroundColor (Color("LYellow"))
                    
                    TextField("Round name", text: $name)
                        .frame(width: 340 , height: 58)
                        .padding()
                    
                    
                }
            }
            Text("Maximum 25 letters")
                .font(.custom("TufuliArabicDEMO-Medium", size: 18))

            Spacer()
            Spacer()
            HStack{
//                Button("Back") {
//                    //
//                    //ImageSelectionView()
//                    nextAction()
//                }
//                .buttonStyle(SmallButton3D()).modifier(SmallButtonTextModifier())
                Button("Next") {
                    nextAction()
                }
                .buttonStyle(BigButton3D()).modifier(BigAndMediumButtonTextModifier())

            }
        }.padding()
            .padding()
    }
}

struct WordEntryView: View {
    @Binding var words: [String]
    @Binding var newWord: String
    @Binding var errorMessage: String
    var submitAction: () -> Void
    
    @State private var offset: CGFloat = 10
    @State private var Offset: CGFloat = 5
    
    
    var body: some View {
        VStack {
            VStack(alignment: .leading){
                
                Text("Words")
                    .font(.custom("TufuliArabicDEMO-Medium", size: 24))

                    //.modifier(BigAndMediumButtonTextModifier())

                    .font(.title3)
                    .padding()
                
                ZStack {
                    
                    
                    RoundedRectangle (cornerRadius: 10)
                        . foregroundColor (Color("LYellowShadow"))
                        .frame(width: 350 , height: 350)
                        .offset (x: Offset,y: offset)
                    RoundedRectangle (cornerRadius: 10)
                        .foregroundColor (Color("LYellow"))
                        .frame(width: 350 , height: 350)
                    
                    
                    ScrollView {
                        
                        VStack{
                            TextField("Word", text: $newWord)
                            //.textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                            
                            
                            ForEach(words.indices, id: \.self) { index in
                                
                                
                                HStack{
                                    Spacer()
                                    
                                    TextField("Word \(index + 1)", text: $words[index])
                                        .frame(width: 300 , height: 58)
                                    
                                    
                                    Spacer()
                                    Image(systemName:"trash.circle.fill" )
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(Color("Lpink"))
                                        .onTapGesture {
                                            deleteWord(at: index)
                                        }
                                    Spacer()
                                    
                                    
                                }//H
                                //.padding()
                            }
                            
                        }.frame(width: 350)
                        
                    } .frame(height: 350)
                    
                }//z
            }//v
            Spacer()
            ZStack {
                
                
                
                //let offset: CGFloat = 10
                RoundedRectangle (cornerRadius: 10)
                    .frame(width: 350 , height: 58)
                    . foregroundColor (Color("LYellowShadow"))
                    .offset (x: Offset,y: offset)
                RoundedRectangle (cornerRadius: 10)
                    .frame(width: 350 , height: 58)
                    .foregroundColor (Color("LYellow"))
                
                //                    Section() {
                //                Button(action: addWord) {
                //                    Label("Add Word", systemImage: "plus.circle")
                //                }
                HStack{
                    Text("Add Word")
                        .font(.custom("TufuliArabicDEMO-Medium", size: 18))
                        .foregroundColor(.white)

                Image(systemName:"plus.circle" )
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color("Lpink"))
                    .onTapGesture {
                        addWord()
                        //deleteWord(at: index)
                    }
            }
                
            }
            
            
            
            
            Text(errorMessage)
                .font(.custom("TufuliArabicDEMO-Medium", size: 18))

                .foregroundColor(.red)
                .padding()
            
            Button("Submit") {
                submitAction()
            }
            .buttonStyle(BigButton3D()).modifier(BigAndMediumButtonTextModifier())
            
        }
        .padding()
    }
    
    
    private func deleteWord(at index: Int) {
        words.remove(at: index)
    }
    
    
    private func addWord() {
        if !newWord.isEmpty {
            words.append(newWord)
            newWord = ""
        }
    }
}

struct AddRoundView_Previews: PreviewProvider {
    static var previews: some View {
        AddRoundView()
    }
}


