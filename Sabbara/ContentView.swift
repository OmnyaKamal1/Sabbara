//
//  ContentView.swift
//  CoreTestSabbara
//
//  Created by Rand Alhassoun on 24/05/2023.
//


import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name, order: .reverse)]) var round: FetchedResults<Round>
    @State private var showingAddView = false
    
    
    @State private var offset: CGFloat = 10
    @State private var Offset: CGFloat = 5
    
    var body: some View {
        NavigationView {
            VStack{
            VStack(alignment: .leading) {
                
                
                //List {
                VStack{


                    ZStack {
                        
                        
                        RoundedRectangle (cornerRadius: 10)
                            . foregroundColor (Color("LYellowShadow"))
                            .frame(width: 170 , height: 150)
                            .offset (x: Offset,y: offset)
                        RoundedRectangle (cornerRadius: 10)
                            .foregroundColor (Color("LYellow"))
                            .frame(width: 170 , height: 150)
                        
                        Image(systemName: "plus.circle.fill" )
                            .resizable()
                            .frame(width: 65, height: 66)
                            .foregroundColor(Color("Lpink"))
                            .onTapGesture {
                                showingAddView.toggle()                            }
           
                    }//zz



                    ForEach(round) { round in
                        
                        //NavigationLink(destination: EditRoundView(round: round)) {

                        NavigationLink(destination: EditRoundView(round: round)) {
                            HStack{
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 170, height: 150)
                                        .foregroundColor(Color(round.colorsShadow ?? "DGreenShadow"))
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 170, height: 150)
                                        .foregroundColor(Color(round.colors ?? "DGreen"))
                                    
                                    VStack(alignment: .leading, spacing: 6) {
                                        Image(round.images ?? "SabbaraChar4")
                                            .resizable()
                                            .frame(width: 69.21, height: 57)
                                            .cornerRadius(1)
                                        Text(round.name ?? "")
                                            .bold()
                                    }
                                }
                            }
                        }
                        
                        // .modifier(BigAndMediumButtonTextModifier())
                        

                    }//ForEach
                    //}
                    .onDelete(perform: deleteRound)
                }
                //}.listStyle(.plain)
            }

            .sheet(isPresented: $showingAddView) {
                AddRoundView()
            }
        }//v
        }
//        .navigationViewStyle(.stack) // Removes sidebar on iPad
    }
    
    // Deletes round at the current offset
    private func deleteRound(offsets: IndexSet) {
        withAnimation {
            offsets.map { round[$0] }
            .forEach(managedObjContext.delete)
            
            // Saves to our database
            DataController().save(context: managedObjContext)
        }
    }
    

}//View


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
