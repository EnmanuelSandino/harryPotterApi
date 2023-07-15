//
//  SecondViewController.swift
//  harryPotterApp
//
//  Created by Bootcamp on 7/14/23.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var secondViewImage: UIImageView!
    
    @IBOutlet weak var secondViewName: UILabel!
    
    @IBOutlet weak var secondViewHouse: UILabel!
    
    @IBOutlet weak var secondViewActor: UILabel!
    
    
    var secondViewCharacters: CharacterModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondViewName.text = secondViewCharacters?.name
        secondViewHouse.text = secondViewCharacters?.house
        secondViewActor.text = secondViewCharacters?.actor
    
        guard let imageURL = secondViewCharacters?.image else { return }
        secondViewImage.downloaded(from: imageURL)
    }
    
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
