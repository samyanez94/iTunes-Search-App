//
//  Genre.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 5/30/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import Foundation

// Reference: https://affiliate.itunes.apple.com/resources/documentation/genre-mapping/

enum Genre: String, Decodable {
    case blues = "Blues"
    case comedy = "Comedy"
    case childrensMusic = "Children’s Music"
    case classical = "Classical"
    case country = "Country"
    case electronic = "Electronic"
    case holiday = "Holiday"
    case opera = "Opera"
    case singerSongwriter = "Singer/Songwriter"
    case jazz = "Jazz"
    case latino = "Latino"
    case newAge = "New Age"
    case pop = "Pop"
    case rythmAndBluesSoul = "R&B/Soul"
    case soundtrack = "Soundtrack"
    case dance = "Dance"
    case hipHopRap = "Hip-Hop/Rap"
    case world = "World"
    case alternative = "Alternative"
    case rock = "Rock"
    case christianGospel = "Christian & Gospel"
    case vocal = "Vocal"
    case reggae = "Reggae"
    case easyListening = "Easy Listening"
    case jPop = "J-Pop"
    case enka = "Enka"
    case anime = "Anime"
    case kayokyoku = "Kayokyoku"
    case fitnessWorkout = "Fitness & Workout"
    case kPop = "K-Pop"
    case karaoke = "Karaoke"
    case instrumental = "Instrumental"
    case brazilian = "Brazilian"
    case spokenWord = "Spoken Word"
    case disney = "Disney"
    case frenchPop = "French Pop"
    case germanPop = "German Pop"
    case germanFolk = "German Folk"
}
