//
//  ViewController.swift
//  RESTApi
//
//  Created by user152741 on 26/04/2019.
//  Copyright © 2019 user152741. All rights reserved.
//

import UIKit
import AlamofireImage
import SwiftyVK

class PostsViewController: BaseVC {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var joinButton: UIBarButtonItem!
    
    var imagesID = [Int]()
    var indexDidSelected: Int = 0
    var posts = [Post]()
    var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        
        loadPosts()
    }
    
    @IBAction func joinButtonAction(_ sender: Any) {
        VK.API.Groups.join([Parameter.groupId:"63458533"])
            .onSuccess { (data) in
                self.joinSuccess()
            }.onError { (error) in
                print("error: \(error)")
            }.send()
    }
    
    func joinSuccess() {
        DispatchQueue.main.async {
            self.joinButton.title = "Готово!"
        }
    }
    
    func loadPosts() {
        if isLoading { return }
        isLoading = true
        
        VKPostManager.loadPosts(offset: posts.count) { (posts) in
            self.posts += posts
            self.tableView.reloadData()
            self.isLoading = false
        }
    }
    
}

extension PostsViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        
        let offset = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if contentHeight - offset < 500 {
            loadPosts()
        }
    }
    
}

extension PostsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostsHelperCell", for: indexPath) as! PostsHelperCell
        
        cell.setupRow(post: posts[indexPath.row])
        
        return cell
    }

}



