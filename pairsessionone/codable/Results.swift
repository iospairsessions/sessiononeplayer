/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

struct Results : Codable, Hashable, Identifiable {
    var id: Int {
        return trackId ?? -1
    }
    
	let wrapperType : String?
	let kind : String?
	let artistId : Int?
	let collectionId : Int?
	let trackId : Int?
	let artistName : String?
	let collectionName : String?
	let trackName : String?
	let collectionCensoredName : String?
	let trackCensoredName : String?
	let artistViewUrl : String?
	let collectionViewUrl : String?
	let trackViewUrl : String?
	let previewUrl : String?
	let artworkUrl30 : String?
	let artworkUrl60 : String?
	let artworkUrl100 : String?
	let collectionPrice : Double?
	let trackPrice : Double?
	let collectionHdPrice : Double?
	let trackHdPrice : Double?
	let releaseDate : String?
	let collectionExplicitness : String?
	let trackExplicitness : String?
	let discCount : Int?
	let discNumber : Int?
	let trackCount : Int?
	let trackNumber : Int?
	let trackTimeMillis : Int?
	let country : String?
	let currency : String?
	let primaryGenreName : String?
	let contentAdvisoryRating : String?
	let shortDescription : String?
	let longDescription : String?

	enum CodingKeys: String, CodingKey {

		case wrapperType = "wrapperType"
		case kind = "kind"
		case artistId = "artistId"
		case collectionId = "collectionId"
		case trackId = "trackId"
		case artistName = "artistName"
		case collectionName = "collectionName"
		case trackName = "trackName"
		case collectionCensoredName = "collectionCensoredName"
		case trackCensoredName = "trackCensoredName"
		case artistViewUrl = "artistViewUrl"
		case collectionViewUrl = "collectionViewUrl"
		case trackViewUrl = "trackViewUrl"
		case previewUrl = "previewUrl"
		case artworkUrl30 = "artworkUrl30"
		case artworkUrl60 = "artworkUrl60"
		case artworkUrl100 = "artworkUrl100"
		case collectionPrice = "collectionPrice"
		case trackPrice = "trackPrice"
		case collectionHdPrice = "collectionHdPrice"
		case trackHdPrice = "trackHdPrice"
		case releaseDate = "releaseDate"
		case collectionExplicitness = "collectionExplicitness"
		case trackExplicitness = "trackExplicitness"
		case discCount = "discCount"
		case discNumber = "discNumber"
		case trackCount = "trackCount"
		case trackNumber = "trackNumber"
		case trackTimeMillis = "trackTimeMillis"
		case country = "country"
		case currency = "currency"
		case primaryGenreName = "primaryGenreName"
		case contentAdvisoryRating = "contentAdvisoryRating"
		case shortDescription = "shortDescription"
		case longDescription = "longDescription"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		wrapperType = try values.decodeIfPresent(String.self, forKey: .wrapperType)
		kind = try values.decodeIfPresent(String.self, forKey: .kind)
		artistId = try values.decodeIfPresent(Int.self, forKey: .artistId)
		collectionId = try values.decodeIfPresent(Int.self, forKey: .collectionId)
		trackId = try values.decodeIfPresent(Int.self, forKey: .trackId)
		artistName = try values.decodeIfPresent(String.self, forKey: .artistName)
		collectionName = try values.decodeIfPresent(String.self, forKey: .collectionName)
		trackName = try values.decodeIfPresent(String.self, forKey: .trackName)
		collectionCensoredName = try values.decodeIfPresent(String.self, forKey: .collectionCensoredName)
		trackCensoredName = try values.decodeIfPresent(String.self, forKey: .trackCensoredName)
		artistViewUrl = try values.decodeIfPresent(String.self, forKey: .artistViewUrl)
		collectionViewUrl = try values.decodeIfPresent(String.self, forKey: .collectionViewUrl)
		trackViewUrl = try values.decodeIfPresent(String.self, forKey: .trackViewUrl)
		previewUrl = try values.decodeIfPresent(String.self, forKey: .previewUrl)
		artworkUrl30 = try values.decodeIfPresent(String.self, forKey: .artworkUrl30)
		artworkUrl60 = try values.decodeIfPresent(String.self, forKey: .artworkUrl60)
		artworkUrl100 = try values.decodeIfPresent(String.self, forKey: .artworkUrl100)
		collectionPrice = try values.decodeIfPresent(Double.self, forKey: .collectionPrice)
		trackPrice = try values.decodeIfPresent(Double.self, forKey: .trackPrice)
		collectionHdPrice = try values.decodeIfPresent(Double.self, forKey: .collectionHdPrice)
		trackHdPrice = try values.decodeIfPresent(Double.self, forKey: .trackHdPrice)
		releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
		collectionExplicitness = try values.decodeIfPresent(String.self, forKey: .collectionExplicitness)
		trackExplicitness = try values.decodeIfPresent(String.self, forKey: .trackExplicitness)
		discCount = try values.decodeIfPresent(Int.self, forKey: .discCount)
		discNumber = try values.decodeIfPresent(Int.self, forKey: .discNumber)
		trackCount = try values.decodeIfPresent(Int.self, forKey: .trackCount)
		trackNumber = try values.decodeIfPresent(Int.self, forKey: .trackNumber)
		trackTimeMillis = try values.decodeIfPresent(Int.self, forKey: .trackTimeMillis)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		currency = try values.decodeIfPresent(String.self, forKey: .currency)
		primaryGenreName = try values.decodeIfPresent(String.self, forKey: .primaryGenreName)
		contentAdvisoryRating = try values.decodeIfPresent(String.self, forKey: .contentAdvisoryRating)
		shortDescription = try values.decodeIfPresent(String.self, forKey: .shortDescription)
		longDescription = try values.decodeIfPresent(String.self, forKey: .longDescription)
	}

}
