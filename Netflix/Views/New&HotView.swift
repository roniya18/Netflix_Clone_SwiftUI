//
//  New&HotView.swift
//  Netflix
//
//  Created by alkesh s on 23/06/23.
//

import SwiftUI

struct New_HotView: View {
    
    @StateObject var viewModel = MovieViewModel()
    @State var isComingSoonPressed = true
    @State var isWatchingPressed = false
    @State var isTopPressed = false
   
    
    var body: some View {
        NavigationStack{
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                Button(action: {
                                    isTopPressed = false
                                    isWatchingPressed = false
                                    isComingSoonPressed = true
                                }, label: {
                                    if isComingSoonPressed{
                                        ButtonLabel(text: "Coming Soon", width: 150, backgroundColor: Color.white, textColor: Color.black)
                                    }else{
                                        ButtonLabel(text: "Coming Soon", width: 150, backgroundColor: Color.black, textColor: Color.white)
                                    }})
                                Button(action: {
                                    isComingSoonPressed = false
                                    isTopPressed = false
                                    isWatchingPressed = true
                                }, label: {
                                    if isWatchingPressed{
                                        ButtonLabel(text: "Everyone's Watching", width: 200, backgroundColor: Color.white, textColor: Color.black)
                                    }else{
                                        ButtonLabel(text: "Everyone's Watching", width: 200, backgroundColor: Color.black, textColor: Color.white)
                                    }
                                })
                                Button(action: {
                                    isComingSoonPressed = false
                                    isTopPressed = true
                                    isWatchingPressed = false
                                }, label: {
                                    if isTopPressed{
                                        ButtonLabel(text: "Top 10", width: 100, backgroundColor: Color.white, textColor: Color.black)
                                    }else{
                                        ButtonLabel(text: "Top 10", width: 100, backgroundColor: Color.black, textColor: Color.white)
                                    }                                })
                            }
                            .padding(.leading)
                        }
                    }
                        ScrollView{
                            VStack(alignment: .leading){

                            Text("COMMING SOON")
                                    .fontWeight(.heavy)
                            ForEach(viewModel.upComing, content: {movies in
                                ComingSoon(movie: movies)
                            })
                            Text("Everone's Watching")
                                    .fontWeight(.heavy)
                            ForEach(viewModel.popularMovie, content: {movie in
                                EveryonesWatching(movie: movie, width: 375, height: 200)
                            })
                            Text("Top 10")
                                    .fontWeight(.heavy)
                            ForEach(Array(viewModel.topMovie.enumerated().prefix(10)), id: \.element) { (index,movie) in
                                HStack(alignment: .top){
                                    VStack{
                                        Text("\(index+1)")
                                            .bold()
                                    }
                                    .padding(.leading)
                                    .foregroundColor(.white)
                                    EveryonesWatching(movie: movie, width: 350, height: 200)
                                }
                            }
                        }
                    }
                
                }
            
            .navigationBarItems(leading: Text("New & Hot").foregroundColor(.white).font(.system(size: 30)).fontWeight(.heavy))
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color(.black), for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "rectangle.badge.person.crop")
                    
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Rectangle()
                        .frame(width: 20,height: 20)
                        .padding(.horizontal)
                }
            }
        }
        .onAppear(){
            viewModel.fetchComingSoon()
            viewModel.fetchtopMovie()
            viewModel.fetchpopularMovie()
        }
    }
}

struct New_HotView_Previews: PreviewProvider {
    static var previews: some View {
        New_HotView()
            .preferredColorScheme(.dark)
    }
}

struct ButtonLabel: View {
    
    let text : String
    let width : CGFloat
    let backgroundColor : Color
    let textColor : Color
    
    var body: some View {
        ZStack{
            Capsule()
                .foregroundColor(backgroundColor)
                .frame(width: width,height: 40)
            Text(text)
                .foregroundColor(textColor)
                .bold()
        }
    }
}
