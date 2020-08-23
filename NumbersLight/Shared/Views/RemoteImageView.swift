//
//  RemoteImageView.swift
//  NumbersLight
//
//  Created by Tarek HACHANI on 23/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import UIKit

class RemoteImageView: UIImageView {
    var spinner = UIActivityIndicatorView(style: .large)

    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */

    override func awakeFromNib() {
        setupSpinner()
    }

    func download(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        spinner.startAnimating()
        contentMode = mode
        URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
            DispatchQueue.main.async() { [weak self] in
                self?.spinner.stopAnimating()
            }
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

    func setupSpinner() {
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        spinner.hidesWhenStopped = true
        self.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }

}
