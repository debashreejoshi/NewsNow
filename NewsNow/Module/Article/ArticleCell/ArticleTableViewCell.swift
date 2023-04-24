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
        // Set the headline label's text to the article's title
        self.headlineLabel.text = article.title
        
        // Set the abstract label's text to the article's description
        self.abstractLabel.text = article.description
        
        // Set the byLine label's text to the article's publisher
        self.byLineLabel.text = article.publisher
        
        // Set the dateTime label's text to the article's date
        self.dateTimeLabel.text = article.date
       
        // If there is a valid URL for the article's thumbnail image
        if let imageUrl = URL(string: article.thumbnail) {
            self.relatedImage.sd_setImage(with: imageUrl, placeholderImage: nil, options: [.continueInBackground, .progressiveLoad]) { [weak self] (image, error, cacheType, imageUrl) in
                guard let self = self else { return } // Making sure the reference to self is not nil
                if let error = error {
                    
                    // Print any error messages
                    print("Error loading image: \(error.localizedDescription)")
                    return
                }
                // Set the image of the relatedImage UIImageView to the downloaded image
                self.relatedImage.image = image
            }
        }
    }

}


