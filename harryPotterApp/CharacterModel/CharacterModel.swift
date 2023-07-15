//
//  CharacterModel.swift
//  harryPotterApp
//
//  Created by Bootcamp on 7/13/23.
//

import Foundation


struct CharacterModel : Codable {
    let id : String?
    let name : String?
    let alternate_names : [String]?
    let species : String?
    let gender : String?
    let house : String?
    let dateOfBirth : String?
    let yearOfBirth : Int?
    let wizard : Bool?
    let ancestry : String?
    let eyeColour : String?
    let hairColour : String?
    let wand : Wand?
    let patronus : String?
    let hogwartsStudent : Bool?
    let hogwartsStaff : Bool?
    let actor : String?
    let alternate_actors : [String]?
    let alive : Bool?
    let image : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case alternate_names = "alternate_names"
        case species = "species"
        case gender = "gender"
        case house = "house"
        case dateOfBirth = "dateOfBirth"
        case yearOfBirth = "yearOfBirth"
        case wizard = "wizard"
        case ancestry = "ancestry"
        case eyeColour = "eyeColour"
        case hairColour = "hairColour"
        case wand = "wand"
        case patronus = "patronus"
        case hogwartsStudent = "hogwartsStudent"
        case hogwartsStaff = "hogwartsStaff"
        case actor = "actor"
        case alternate_actors = "alternate_actors"
        case alive = "alive"
        case image = "image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        alternate_names = try values.decodeIfPresent([String].self, forKey: .alternate_names)
        species = try values.decodeIfPresent(String.self, forKey: .species)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        house = try values.decodeIfPresent(String.self, forKey: .house)
        dateOfBirth = try values.decodeIfPresent(String.self, forKey: .dateOfBirth)
        yearOfBirth = try values.decodeIfPresent(Int.self, forKey: .yearOfBirth)
        wizard = try values.decodeIfPresent(Bool.self, forKey: .wizard)
        ancestry = try values.decodeIfPresent(String.self, forKey: .ancestry)
        eyeColour = try values.decodeIfPresent(String.self, forKey: .eyeColour)
        hairColour = try values.decodeIfPresent(String.self, forKey: .hairColour)
        wand = try values.decodeIfPresent(Wand.self, forKey: .wand)
        patronus = try values.decodeIfPresent(String.self, forKey: .patronus)
        hogwartsStudent = try values.decodeIfPresent(Bool.self, forKey: .hogwartsStudent)
        hogwartsStaff = try values.decodeIfPresent(Bool.self, forKey: .hogwartsStaff)
        actor = try values.decodeIfPresent(String.self, forKey: .actor)
        alternate_actors = try values.decodeIfPresent([String].self, forKey: .alternate_actors)
        alive = try values.decodeIfPresent(Bool.self, forKey: .alive)
        image = try values.decodeIfPresent(String.self, forKey: .image)
    }

}

struct Wand : Codable {
    let wood : String?
    let core : String?
    let length : Double?

    enum CodingKeys: String, CodingKey {

        case wood = "wood"
        case core = "core"
        case length = "length"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        wood = try values.decodeIfPresent(String.self, forKey: .wood)
        core = try values.decodeIfPresent(String.self, forKey: .core)
        length = try values.decodeIfPresent(Double.self, forKey: .length)
    }

}



