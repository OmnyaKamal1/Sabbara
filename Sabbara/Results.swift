//
//  Results.swift
//  Sabbara
//
//  Created by Omnya Kamal  on 24/05/2023.
//

import SwiftUI

struct Results: View {
    
    // MARK: - for now it a button to show different view
    @State private var showFirstCode = false
    @State private var showSecondCode = false
    
    var body: some View {
        VStack {
            if !showFirstCode && !showSecondCode {
                Button("Show First Code") {
                    showFirstCode = true
                    showSecondCode = false
                }
                .padding()
                
                Button("Show Second Code") {
                    showFirstCode = false
                    showSecondCode = true
                }
                .padding()
            }
            
            if showFirstCode {
                FirstCodeView()
            } else if showSecondCode {
                SecondCodeView()
            }
        }
    }
}



struct FirstCodeView: View {
    var body: some View {
        // First code struct implementation (quick game)
        VStack{ //open vstack
            let offset: CGFloat = 10
            let Offset : CGFloat = 5
            
            Text(NSLocalizedString("Results", comment: ""))
            //Text("Results")
                .foregroundColor(Color.black)
                .modifier(BigAndMediumButtonTextModifier())
            
            ZStack{// open zstack
                Image("ResultboardFill")
                    .resizable()
                    .frame(width: 386,height: 64)
                Text(NSLocalizedString("Point", comment: ""))
             
                    .foregroundColor(.black)
                    .bold()
                    .font(.custom("TufuliArabicDEMO-Medium", size: 24))
            }// end zstack
            
            
            ZStack{ // open zstack
                
                Rectangle()
                    .frame(width:344,height: 423)
                    .foregroundColor(Color("LYellowShadow"))
                    .cornerRadius(10)
                    .offset (x: Offset ,y: offset)
                
                
                Rectangle()
                    .frame(width:344,height: 423)
                    .foregroundColor(Color("LYellow"))
                    .cornerRadius(10)
                
                
                ScrollView {
                    //VStack {
                    ForEach(1...20, id: \.self) { index in
                        Text("كلم,,,,,,,,,,,,,,,ه \(index)")
                            .padding()
                        // }
                    }
                    .frame(width: 340)
                }
                .frame( height: 380)
            }// end zstackm
            
            .padding()
            Button(action: {
                // ... replay round action ...
            }) {
                Text("Replay Round")
                Image(systemName: "arrow.counterclockwise")
                    .foregroundColor(.white).padding(.leading,200)
            }
            .buttonStyle(BigButton3D())
            .modifier(BigAndMediumButtonTextModifier())
            .padding()
            
            Button("End Round"){}
                .foregroundColor(Color("Lpink"))
                .buttonStyle(WhBigButton3D()).modifier(BigAndMediumButtonTextModifier())
            
            Spacer()
            
            
        }// end vstack
    }
}


struct SecondCodeView: View {
    @State var showingBottomSheet = false
    @State var words: [(String, Int)] = [("Word 1", 1), ("Word 2", 0), ("Word 3", 1), ("Word 4", 0)]
    @State var team1Points = 0
    @State var team2Points = 0
    var body: some View {
        // Second code struct implementation
        VStack {
            
            let offset: CGFloat = 10
            
            Text("Results")
                .foregroundColor(Color.black)
                .modifier(BigAndMediumButtonTextModifier())
            Spacer()
            
            ZStack {
                
                Image("ResultboardTeams")
                Circle()
                    .frame(width: 94, height: 94)
                    .foregroundColor(Color.black)
                    .padding(.bottom)
                //                Image("SabbaraChar1")
                //                    .resizable()
                //                    .frame(width: 79.31, height: 64.63)
                //                    .padding(.bottom)
            }
            
            
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 350, height: 54)
                        .foregroundColor(Color("LYellowShadow"))
                        .offset(y: offset)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 350, height: 54)
                        .foregroundColor(Color("LYellow"))
                    
                    HStack {
                        
                        ZStack {
                            Circle()
                                .frame(width: 32, height: 32)
                                .foregroundColor(Color("DPurple"))
                            Image("SabbaraChar1")
                                .resizable()
                                .frame(width: 22.96, height: 19)
                        }
                        Text("Team 1")
                        Spacer().frame(width: 90)
                        Text("\(team1Points) point")
                        Button {
                            showingBottomSheet.toggle()
                        } label: {
                            Image("DropdownIcon")
                        }
                        .sheet(isPresented: $showingBottomSheet) {
                            BottomSheet(words: words)
                                .presentationDetents([.medium])
                                .presentationDragIndicator(.visible)
                            
                        }
                        
                    }
                }
                .padding()
            }
            

            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 350, height: 54)
                        .foregroundColor(Color("LYellowShadow"))
                        .offset(y: offset)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 350, height: 54)
                        .foregroundColor(Color("LYellow"))
                    
                    HStack {
                        
                        ZStack {
                            Circle()
                                .frame(width: 32, height: 32)
                                .foregroundColor(Color("DGreen"))
                            Image("SabbaraChar3")
                                .resizable()
                                .frame(width: 22.96, height: 19)
                        }
                        Text("Team 2")
                        Spacer().frame(width: 90)
                        Text("\(team1Points) point")
                        Button {
                            showingBottomSheet.toggle()
                        } label: {
                            Image("DropdownIcon")
                        }
                        .sheet(isPresented: $showingBottomSheet) {
                            BottomSheet(words: words)
                                .presentationDetents([.medium])
                                .presentationDragIndicator(.visible)
        
                        }
                        
                    }
                }
                .padding()
            }
            
            
            Spacer()
                .padding()
            
            Button(action: {
                // ... replay round action ...
            }) {
                Text("Replay Round")
                Image(systemName: "arrow.counterclockwise")
                    .foregroundColor(.white).padding(.leading,200)
            }
            .buttonStyle(BigButton3D())
            .modifier(BigAndMediumButtonTextModifier())
            
            Button("End Round") {
                // ... end round action ...
            }
            .foregroundColor(Color("Lpink"))
            .buttonStyle(WhBigButton3D())
            .modifier(BigAndMediumButtonTextModifier())
            .padding()
            
        
            
        }
    }
}


struct BottomSheet: View {
    @State private var offset: CGFloat = 10
    @State private var Offset: CGFloat = 5
    let words: [(String, Int)]
    
    var body: some View {
        VStack {
            
            
            ZStack{
                //Spacer()
                
                Image("ResultboardNotFill")
                    .resizable()
                    .frame(width: 386,height: 64)
                HStack{
                    Text("point")
                        .foregroundColor(Color("Lpink"))
                        .modifier(BigAndMediumButtonTextModifier())
                        .overlay(
                            Text("\(words.count)")
                                .foregroundColor(Color("Lpink"))
                                .modifier(BigAndMediumButtonTextModifier())
                                .padding(.leading,-58)
                            
                        )}
            }.padding(.top,40)
            //Spacer()
            
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: 330, height: 331)
                        .foregroundColor(Color("LYellowShadow"))
                        .cornerRadius(10)
                        .offset(x: Offset, y: offset)
                    
                    Rectangle()
                        .frame(width: 330, height: 331)
                        .foregroundColor(Color("LYellow"))
                        .cornerRadius(10)
                    
                    ScrollView {
                        VStack {
                            ForEach(words.indices, id: \.self) { index in
                                let word = words[index]
                                Text(word.0)
                                    .padding()
                                    .foregroundColor(word.1 == 1 ? .green : .red)
                            }
                        }
                        .frame(width: 320)
                    }
                    .frame(height: 300)
                }
            }
        }
    }
}

class SheetPresentationDelegate1: NSObject, UIAdaptivePresentationControllerDelegate {
    var height: CGFloat = .zero
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        // Handle dismissal if needed
    }
}


struct Results_Previews: PreviewProvider {
    static var previews: some View {
        Results()
    }
}
