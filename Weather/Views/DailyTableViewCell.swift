//
//  DailyTableViewCell.swift
//  Weather
//
//  Created by Andrei Isayenka on 03/12/2023.
//

import UIKit

class DailyTableViewCell: UITableViewCell {

    static let identifier = "DailyTableViewCell"
    
    private let dayLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let highTempLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let lowTempLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        // Configure the view for the selected state
//    }
    
    static func nib() -> UINib {
        return UINib(nibName: "DailyTableViewCell", bundle: nil)
    }
    
    public func configure(with model: ModelOfTheWeather) {
        dayLabel.text = ""
        highTempLabel.text = ""
        lowTempLabel.text = ""
        iconImageView.image = UIImage(systemName: "cloud")
    }

}

struct ModelOfTheWeather {
    
}
