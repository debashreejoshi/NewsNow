//
//  ArticleTableViewCell.swift
//  NewsNow
//
//  Created by Debashree Joshi on 23/4/2023.
//

import UIKit
import SDWebImage

class ArticleTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var byLineLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var relatedImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Public Methods
    
    func configure(with article: ArticleCellViewModel) {
        self.headlineLabel.text = article.title
        self.abstractLabel.text = article.description
        self.byLineLabel.text = article.publisher
        self.dateTimeLabel.text = article.date
       
        if let imageUrl = URL(string: article.thumbnail) {
            self.relatedImage.sd_setImage(with: imageUrl, placeholderImage: nil, options: [.continueInBackground, .progressiveLoad]) { [weak self] (image, error, cacheType, imageUrl) in
                guard let self = self else { return }
                if let error = error {
                    print("Error loading image: \(error.localizedDescription)")
                    return
                }
                self.relatedImage.image = image
            }
        }
    }

}


