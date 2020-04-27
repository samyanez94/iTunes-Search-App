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
    case hipHop = "Hip-Hop"
    case house = "House"
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

extension Genre {
    init?(name: String) {
        switch name {
        case "Blues": self = .blues
        case "Comedy": self = .comedy
        case "Children's Music": self = .childrensMusic
        case "Classical": self = .classical
        case "Country": self = .country
        case "Electronic": self = .electronic
        case "Holiday": self = .holiday
        case "Opera": self = .opera
        case "Singer/Songwriter": self = .singerSongwriter
        case "Jazz": self = .jazz
        case "Latino": self = .latino
        case "New Age": self = .newAge
        case "Pop": self = .pop
        case "R&B/Soul": self = .rythmAndBluesSoul
        case "Soundtrack": self = .soundtrack
        case "Dance": self = .dance
        case "Hip-Hop/Rap": self = .hipHopRap
        case "Hip-Hop": self = .hipHop
        case "House": self = .house
        case "World": self = .world
        case "Alternative": self = .alternative
        case "Rock": self = .rock
        case "Christian & Gospel": self = .christianGospel
        case "Vocal": self = .vocal
        case "Reggae": self = .reggae
        case "Easy Listening": self = .easyListening
        case "J-Pop": self = .jPop
        case "Enka": self = .enka
        case "Anime": self = .anime
        case "Kayokyoku": self = .kayokyoku
        case "Fitness & Workout": self = .fitnessWorkout
        case "K-Pop": self = .kPop
        case "Karaoke": self = .karaoke
        case "Instrumental": self = .instrumental
        case "Brazilian": self = .brazilian
        case "Spoken Word": self = .spokenWord
        case "Disney": self = .disney
        case "French Pop": self = .frenchPop
        case "German Pop": self = .germanPop
        case "German Folk": self = .germanFolk
        default: return nil
        }
    }
}
