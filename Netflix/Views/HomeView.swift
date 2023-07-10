//
//  ContentView.swift
//  Netflix
//
//  Created by alkesh s on 21/06/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = MovieViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(alignment:.leading){
                    ZStack{
                        
                        if viewModel.popularMovie.isEmpty{
                            Text("Empty")
                            
                        }else{
                            viewModel.poster(poster_path: viewModel.popularMovie[0].poster_path, width: 400, height: 550)
                        }
                        Spacer()
                        VStack{
                            HStack(alignment: .center){
                                Spacer()
                                VStack{
                                    Image(systemName: "plus")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20,height: 20)
                                    Text("My List")
                                        .fontWeight(.medium)
                                }
                                Spacer()
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .frame(width: 100,height: 40)
                                    HStack{
                                        Image(systemName: "play.fill")
                                        Text("Play")
                                    }
                                    .foregroundColor(.black)
                                    
                                }
                                Spacer()
                                VStack{
                                    Image(systemName: "info.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20,height: 20)
                                    Text("Info")
                                        .fontWeight(.medium)
                                }
                                Spacer()
                            }
                        }
                        .padding(.top,500)
                        
                    }
                    .padding(.bottom,50)
                    .frame(width: 400, height: 500)
                    Text("Popular Movies On Netflix")
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .padding(.leading,10)
                    //MovieSlide(list: viewModel.popularMovie)
                    //MovieSlide()
                    if viewModel.popularMovie.isEmpty{
                        Text("Empty")
                    }else{
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(viewModel.popularMovie){ movie in
                                    viewModel.poster(poster_path: movie.poster_path,width: 150,height: 200)
                                    
                                }
                            }
                        }
                    }
                    Text("Trending Now")
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .padding(.leading,10)
                    //MovieSlide(list: viewModel.trending)
                    //MovieSlide()
                    if viewModel.trending.isEmpty{
                        Text("Empty")
                    }else{
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(viewModel.trending){ movie in
                                    viewModel.poster(poster_path: movie.poster_path,width: 150,height: 200)
                                }
                            }
                        }
                    }
                    Text("Popular TV shows")
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .padding(.leading,10)
                    //MovieSlide(list: viewModel.popularTV)
                    //MovieSlide()
                    if viewModel.popularTV.isEmpty{
                        Text("Empty")
                    }else{
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(viewModel.popularTV){ movie in
                                    viewModel.poster(poster_path: movie.poster_path,width: 150,height: 200)
                                }
                            }
                        }
                    }
                    Text("Top Movies")
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .padding(.leading,10)
                    //MovieSlide(list: viewModel.topMovie)
                    //MovieSlide()
                    if viewModel.topMovie.isEmpty{
                        ProgressView()
                        Text("Empty")
                    }else{
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(Array(viewModel.topMovie.enumerated().prefix(10)),id: \.element){(index,movie) in
                                    ZStack{
                                        viewModel.poster(poster_path: movie.poster_path,width: 150,height: 200)
                                            .padding(.leading,50)
                                        StrokeText(text: "\(index)", width: 0.5, color: .white)
                                            .foregroundColor(.black)
                                            .font(.system(size: 150, weight: .bold))
                                            .padding(.trailing,100)
                                            .padding(.top,90)
                                        
                                    }
                                    .frame(width: 200,height: 200)
                                }
                            }
                        }
                    }
                }
                
            }
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
            .onAppear(){
                // Task{
                viewModel.fetchpopularMovie()
                viewModel.fetchtopMovie()
                viewModel.fetchpopularTV()
                viewModel.fetchTrending()
                // }
            }
            .ignoresSafeArea()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}

struct MovieSlide: View {
    @StateObject var viewmodel = MovieViewModel()
    @State var list : [Movie]
    var body: some View {
        if list.isEmpty{
                        Text("Empty")
                    }else{
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(list){ movie in
                                    viewmodel.poster(poster_path: movie.poster_path,width: 150,height: 200)
                                }
                            }
                        }
                    }
    }
}
