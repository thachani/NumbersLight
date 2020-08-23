//
//  NumberTableViewCell.swift
//  NumbersLight
//
//  Created by Tarek HACHANI on 22/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import UIKit

class NumberTableViewCell: UITableViewCell {
    static let reuseIdentifier = "NumberTableViewCell"

    @IBOutlet var headerLabel: UILabel!
    @IBOutlet var numberImageView: RemoteImageView!



    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.backgroundColor = selected ? .blue : .yellow
    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)

        self.backgroundColor = .white
    }

    func update(withText text: String?, urlImage: String?) {
        self.headerLabel.text = text
        if let urlImage = urlImage, let url = URL(string: urlImage) {
            self.numberImageView.download(from: url)
        }
    }
    
}
