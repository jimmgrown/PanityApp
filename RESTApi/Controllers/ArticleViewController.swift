//
//  ArticleViewController.swift
//  
//
//  Created by user152741 on 26/04/2019.
//

import UIKit
import AlamofireImage
import Alamofire
import SwiftyVK

class ArticleViewController: BaseVC {
    
    @IBOutlet weak var imageView: UIImageView!
    var imagesArray = [String]()
    var indexArticle : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        print(imagesArray[indexArticle])
        if let url = URL(string: imagesArray[indexArticle]){
        imageView.af_setImage(withURL: url)
        }
        /*let url = "https://jsonplaceholder.typicode.com/todos"
        let request = Alamofire.request(url, method: .get, parameters: nil, headers: nil)
        request.responseJSON { (response) -> Void in
            if let json = response.result.value as? [[String:Any?]] {
                var text = ""
                for model in json {
                    text += model["title"] as! String
                    text += "\n"
                }
                self.textView.text = text
            }
        }*/
    }
    
}
