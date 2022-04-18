//
//  cityCellTableViewCell.swift
//  Example2
//
//  Created by DCS on 08/04/22.
//  Copyright © 2022 DCS. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {

    private let titleLable:UILabel = {
        let lable = UILabel()
        lable.text = ""
        lable.textAlignment = .center
        lable.backgroundColor = .white
        return lable
    }()
    
    private let descriptionLabel:UILabel = {
        let lable = UILabel()
        lable.text = ""
        lable.textAlignment = .center
        lable.backgroundColor = .white
        return lable
    }()
    
    private func setupUI() {
        contentView.addSubview(titleLable)
        contentView.addSubview(descriptionLabel)
        titleLable.frame = CGRect(x: 20, y: 10, width: contentView.width - 40, height: 40)
        descriptionLabel.frame = CGRect(x: 20, y: titleLable.bottom + 20, width: contentView.width, height: 40)
        
       
    }
    
    func setupCityCellWith(title name: String, description desc:String){
        titleLable.text = name
        descriptionLabel.text = desc
        
        setupUI()
    }
}
