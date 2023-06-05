////
////  MainPage.swift
////  sabar
////
////  Created by Nourah Almusaad on 04/06/2023.
////
//
//import SwiftUI
//
//struct MainPage: View {
//    @State private var showSettingsPopUp = false
//    @State var cat = ""
//    
//    var body: some View {
//        NavigationView {
//          
//
//            VStack(alignment: .trailing) {
//                
//                ScrollView(.vertical, showsIndicators: false) {
//                    BigingText()
//                    MyRound()
//                    GeneralRound()
//                }
//                
//                // Spacer() // Add spacer to push the content to the top
//            }
//            .navigationBarItems(trailing:
//                                    Button(action: {
//                showSettingsPopUp = true
//            }) {
//                Image(systemName: "gearshape.circle.fill")
//                    .resizable()
//                    .frame(width: 40, height: 40)
//              
//                    .foregroundColor(Color("LPink"))
//            }
//                                
//            )
//            .overlay(
//                Group {
//                    if showSettingsPopUp {
//                        SettingsPopUpView(isPresented: $showSettingsPopUp)
//                    }
//                }
//            )
//        } .navigationTitle(cat)
//            .font(.custom("TufuliArabicDEMO-Medium", size: 26))
//    }
//}
//
//struct MainPage_Previews: PreviewProvider {
//    static var previews: some View {
//        MainPage()
//    }
//}
//
//
//struct BigingText: View {
//    var body: some View {
//        VStack(alignment:.leading){
//            
//            Text("Hello")
//                .multilineTextAlignment(.leading)
//                .fontWeight(.semibold)
//                .font(.system(size: 20))
//            
//            Text ("Pop up warning when trying and trying to add moew than ")
//                .multilineTextAlignment(.leading)
//                .fontWeight(.semibold)
//                .font(.system(size: 20))
//            
//            
//        }
//        .padding()
//    }
//}
////MARK: - Customize button style
//
//struct MainButton3D: ButtonStyle {
//    var shadowColor: Color
//    var buttonColor: Color
//
//    func makeBody(configuration: Configuration) -> some View {
//        ZStack {
//            let xOffset: CGFloat = 5
//            let yOffset: CGFloat = 8
//        /* Shadow reoundRectangle*/
//            RoundedRectangle(cornerRadius: 21)
//                .frame(width: 168, height: 143)
//                .foregroundColor(shadowColor)
//                .offset(x: xOffset, y: yOffset)
//
//            /* ReoundRectangle*/
//            RoundedRectangle(cornerRadius: 21)
//                .frame(width: 166, height: 146)
//                .foregroundColor(buttonColor)
//                .offset(x: configuration.isPressed ? xOffset : 0, y: configuration.isPressed ? yOffset : 0)
//
//            configuration.label
//                .offset(x: configuration.isPressed ? xOffset : 0, y: configuration.isPressed ? yOffset : 0)
//        } // End of Zstack
//    } // End of view
//
//} // End of struct
//
////MARK: - Customize User Round button
//struct MyRound: View {
//    @State private var isLinkActive = false
//
//    var body: some View {
////        NavigationView {
//        VStack (alignment: .leading){
//                Text("General Round")
//                    .bold()
//                    .font(.custom("BalooBhaijaan-Regular", size: 24))
//                    .padding(.leading, 10)
//                HStack (spacing: 15){
//                    Button(action: {
//                        // Handle Plus button action
//                    }) {
//                        Image("Plus")
//                            .resizable()
//                            .frame(width: 65, height: 65)
//                    }
//                    .buttonStyle(MainButton3D(shadowColor: Color("LYellowShadow"), buttonColor: Color("LYellow")))
//                    
//                        Button(action: {
//                            // Handle Shuffle button action
//                            isLinkActive = true
//                        }) {
//                            Image("Shuffle")
//                                .resizable()
//                                .frame(width: 65, height: 65)
//                        }
//                        .buttonStyle(MainButton3D(shadowColor: Color("DGreenShadow"), buttonColor: Color("DGreen")))
//                    }
//             //   }
//                .padding(.bottom, 25)
//            }
//
//        }
//    }
//
//
//
//struct GeneralRound: View {
//    var columns = [GridItem(.adaptive(minimum: 160), spacing: 10)]
//   // @State private var selectedCategory: Category?
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text("General Round")
//                .bold()
//                .font(.custom("BalooBhaijaan-Regular", size: 24))
//                .padding(.leading, 10)
//            //MARK: - Hair
////           CustomNavigationView(title: "Main") {
//                    LazyVGrid(columns: columns, spacing: 20) {
//                        ForEach(CategoryList) { category in
//                            
//                            CategoryCard(category: category)
//                          
//               //   }
//                        
//                    }//.padding()
//                }
//           
//                     }
//        .padding()
//    }
//}
//
//
////MARK: - Customize SettingsPopUpView
//struct SettingsPopUpView: View {
//    @Binding var isPresented: Bool
//    
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack {
//                Color.black.opacity(0.5)
//                
//                VStack {
//                    HStack {
//                        Button(action: {
//                                               isPresented = false
//                                           }) {
//                                               Image("xmark")
//                                                   .resizable()
//                                                   .frame(width: 23, height: 23)
//                                                   .foregroundColor(.white)
//                                           }
//                                           .padding()
//                                           .background(
//                                               Circle()
//                                                   .fill(Color("LPink"))
//                                                   .frame(width: 42, height: 40)
//                                           )
//                        Spacer()
//                        
//                                           Text("Settings")
//                                               .font(.title)
//                                               .foregroundColor(Color("LPink"))
//                                               .padding(.trailing, 70)
//                    }
//                    .padding()
//                    
//                 SettingsView()
//                    // Add your settings content here
//                    
//                    Button(action: {
//                        isPresented = false
//                    }) {
//                        Button("حفظ"){}.buttonStyle(SaveButton3D()).modifier(SaveButtonTextModifier())
//                    }
//                    .padding(.bottom,50)
//                }
//                .frame(width: 304, height: 562)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 20)
//                        .stroke(Color.black, lineWidth: 15)
//                ) // Add the overlay modifier to include the border
//                .background(Color.white)
//                .cornerRadius(10)
//            }
//            .frame(width: geometry.size.width, height: geometry.size.height)
//        }
//        .ignoresSafeArea()
//    }
//}
//
////MARK: - Customize Save button
//struct SaveButtonTextModifier: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .bold()
//            .foregroundColor(.white)
//            .font(.custom("BalooBhaijaan-Regular", size: 24))
//        //.font(.system(size: 24))
//        
//    }
//    
//}
//struct SaveButton3D: ButtonStyle {
//    func makeBody (configuration: Configuration) -> some View {
//        ZStack {
//            let offset: CGFloat = 10
//            RoundedRectangle (cornerRadius: 10)
//                .frame(width: 244.99 , height: 50)
//                . foregroundColor (Color("LpinkShadow"))
//                .offset (y: offset)
//            RoundedRectangle (cornerRadius: 10)
//                .frame(width: 244.99 , height: 50)
//                .foregroundColor (Color("Lpink"))
//                .offset (y: configuration.isPressed ? offset : 0)
//            configuration.label
//                .offset (y: configuration.isPressed ? offset : 0)
//        }
//        //. compositingGroup()
//    }
//    
//}
//
////struct CustomNavigationView<Content: View>: View {
////    let title: String
////    let content: Content
////    @State private var isShowingView: Bool = true
////
////    init(title: String, @ViewBuilder content: () -> Content) {
////        self.title = title
////        self.content = content()
////    }
////
////    var body: some View {
////        NavigationView {
////            content
////                .navigationBarItems(trailing:
////                    HStack {
////                      //  Spacer()
////
////
////                        Button(action: {
////                            isShowingView = false
////                        }) {
////                            Image(systemName: "xmark")
////                        }
////
////                    }
////                )
////
////
////        }
////    }
////}
