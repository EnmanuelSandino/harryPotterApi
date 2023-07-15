//
//  ViewController.swift
//  harryPotterApp
//
//  Created by Bootcamp on 7/13/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var character = [CharacterModel] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        registerTable()
        super.viewDidLoad()
        
        getData { data in
                    self.character = data
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
        
    }
    
    private func registerTable () {
        let cell = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "TableViewCell")
    }
    
    func getData(completion: @escaping (([CharacterModel]) -> Void)) {
            
            let apiUrl = "https://hp-api.onrender.com/api/characters"
            guard let url = URL(string: apiUrl) else {
                return
            }
            
            let session = URLSession.shared
            let task = session.dataTask(with: url) { data, response, error in
                if data != nil && error == nil {
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode([CharacterModel].self, from: data!)
                        completion(response)
                        print(response)
                    } catch {
                        print(String(describing: error))
                    }
                }
            }
        
            task.resume()
        
        }
}



extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return character.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell {
            
            cell.characterNameCell.text = character[indexPath.row].name
            cell.houseNameCell.text = character[indexPath.row].house
            
            
            return cell
        }
        
        return  UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let secondViewController = storyboard?.instantiateViewController(identifier:"SecondViewController") as? SecondViewController {
            secondViewController.secondViewCharacters = character[indexPath.row]
            self.navigationController?.pushViewController(secondViewController, animated: true)
            
        }
    }
    
}

