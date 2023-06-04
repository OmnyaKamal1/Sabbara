//
//  Results.swift
//  Sabbara
//
//  Created by Omnya Kamal  on 24/05/2023.
//

import SwiftUI
import Firebase
import FirebaseAnalytics


//MARK: this it the main view

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


//MARK: First code struct implementation (quick game)
struct FirstCodeView: View {
    
    @State private var navigateToTeamPlay = false
    
    var body: some View {
        
        let offset: CGFloat = 10
        let Offset : CGFloat = 5
        
        VStack{ //open vstack
            
            Text(NSLocalizedString("Results", comment: "")) // loclaztion
                .foregroundColor(Color.black)
                .modifier(BigAndMediumButtonTextModifier())
            
            ZStack{// open zstack
                Image("ResultboardFill")
                    .resizable()
                    .frame(width: 386,height: 64)
                Text(NSLocalizedString("Point", comment: ""))  // loclaztion
                    .foregroundColor(.black)
                    .font(.custom("TufuliArabicDEMO-Medium", size: 24))
            }// end zstack
            
            
            ZStack{ // open zstack
                
                Rectangle() // shadow Rectangle
                    .frame(width:344,height: 423)
                    .foregroundColor(Color("LYellowShadow"))
                    .cornerRadius(10)
                    .offset (x: Offset ,y: offset)
                
                
                Rectangle() // regler Rectangle
                    .frame(width:344,height: 423)
                    .foregroundColor(Color("LYellow"))
                    .cornerRadius(10)
                
                
                ScrollView { // it will change base on the words f
                    //MARK: FIX
                  
                    ForEach(1...20, id: \.self) { index in
                        Text("كلم,,,ه \(index)")
                           .padding()
                        
                    }
                    .frame(width: 340)
                }
                .frame( height: 380)
            }// end zstack
            
           .padding()
            
             //MARK: FIRST BUTTON
            
            NavigationLink(
                        destination: MainPage(),
                        isActive: $navigateToTeamPlay,
                        label: { EmptyView() }
                    )
                    .hidden()
            
            Button(action: {
                trackButtonEvent(buttonName: "Replay Round")
                navigateToTeamPlay = true
            }) {
                Text("Replay Round")
                Image(systemName: "arrow.counterclockwise")
                    .foregroundColor(.white).padding(.leading,200)
            }
            .buttonStyle(BigButton3D())
            .modifier(BigAndMediumButtonTextModifier())
            .padding()
           
            
            //MARK: SECOUND BUTTON
            Button(action: {
                trackButtonEvent(buttonName: "End Round")
            }) {
                Text("End Round")
            }
            
            .foregroundColor(Color("Lpink"))
            .buttonStyle(WhBigButton3D()).modifier(BigAndMediumButtonTextModifier())
            
            Spacer()
            
            
        }// end vstack
        .onAppear {
            if FirebaseApp.app() == nil {
                FirebaseApp.configure()
            }
        }
    }
}


//MARK: Second code struct implementation (Team game)
struct SecondCodeView: View {
    @State private var navigateToMainPage = false
    @State private var navigateToPlayTeam = false
    @State private var navigateToTeamPlay = false
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
                        Text("\(team1Points) \(NSLocalizedString("point", comment: ""))")
                        Button {
                            trackButtonEvent(buttonName: "DropdownIcon")
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
                        Text("\(team1Points) \(NSLocalizedString("point", comment: ""))")
                        Button {
                            trackButtonEvent(buttonName: "Dropdown Result")
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
            
            Button {
                trackButtonEvent(buttonName: "Replay Round")
                navigateToPlayTeam = true
            } label: {
                
                Text("Replay Round")
                Image(systemName: "arrow.counterclockwise")
                    .foregroundColor(.white).padding(.leading,200)
                
            }.buttonStyle(BigButton3D())
                .modifier(BigAndMediumButtonTextModifier())
                .padding()
            
            

            
            Button {
                trackButtonEvent(buttonName: "End Round")
                navigateToMainPage = true
            } label: {
                
                    Text("End Round")
                   
            } .foregroundColor(Color("Lpink"))
                .buttonStyle(WhBigButton3D())
                .modifier(BigAndMediumButtonTextModifier())
                .padding()
                

            
            
        }
        .fullScreenCover(isPresented: $navigateToPlayTeam) {
            PlayTeam()}
            
        .fullScreenCover(isPresented: $navigateToMainPage) {
                    MainPage()
                }
    }
}

//MARK: Bottom sheet struct for second code so
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


//MARK: func for firebase
func trackButtonEvent(buttonName: String) {
    Analytics.logEvent("button_click", parameters: [
        "button_name": buttonName
    ])
}


struct Results_Previews: PreviewProvider {
    static var previews: some View {
        Results()
    }
}
