//
//  ViewController.swift
//  Example2
//
//  Created by DCS on 06/04/22.
//  Copyright © 2022 DCS. All rights reserved.
//

import UIKit

class SimpleTableVC: UIViewController {

    private let myTableView = UITableView()
    
    private var stateArray = ["Berlin" ,"Moscow", "Rio" , "Tokyo","Denver", "Helsinki", "Oslo", "Nairobi","Rie"]
    
//    private var descriptionArray = ["Helsinki", "Oslo", "Nairobi"]
    
    private let mySearchBar = UISearchBar()
    
    private var searchData = [String]()
    
    private var searching = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(myTableView)
        setupCell()
        
        view.addSubview(mySearchBar)
        mySearchBar.delegate = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mySearchBar.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: 50)
        myTableView.frame = CGRect(x: 0, y: mySearchBar.bottom, width: view.width, height: view.height)
    }
}

extension SimpleTableVC: UITableViewDataSource, UITableViewDelegate {
    
    func setupCell(){
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(CityCell.self, forCellReuseIdentifier: "cityCell")
    }
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//            return cityArray.count
        if searching {
            return searchData.count
        }else{
            return stateArray.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        if searching{
            cell.textLabel?.text = searchData[indexPath.row]
        }else{
            cell.textLabel?.text = stateArray[indexPath.row]
        }
//        cell.setupCityCellWith(title: cityArray[indexPath.row], description: descriptionArray[indexPath.row])
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 120
//    }
//
}

extension SimpleTableVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText.count == 0){
            searching = false
        }else{
            searching = true
            searchData = stateArray.filter({ $0.lowercased().hasPrefix(searchText.lowercased()) })
            
            if(searchData.count == 0){
                let alert = UIAlertController(title: "OOps", message: "NO such Sate. pleSE TRY AGAIN", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .cancel))
                DispatchQueue.main.async {
                    self.present(alert, animated: true , completion: nil)
                }
            }
        }
        
        myTableView.reloadData()
    }
}
