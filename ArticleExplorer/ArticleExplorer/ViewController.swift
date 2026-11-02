//
//  ViewController.swift
//  ArticleExplorer
//
//  Created by Zülal Nebin on 2.11.2026.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    // Başlık, kısa açıklama ve açıklaması bulunan bir makale yapısı bulunacak.
    // Listede makalelerin başlık ve kısa açıklaması görülebilecek.
    // 105 adet makale bulunacak ve 20'şer olarak listeye yüklenecek.
    // Makalelerin başlıkları ve kısa açıklamalarında aramalar yapılabilecek. Aramada girilen değerleri kapsayan kayıtlar filtrelenecek.
    // Yapılan aramaya göre tüm kayıtlar filtrelenip listeye veriler yüklenecek.
    
    @IBOutlet weak var articleSearchBar: UISearchBar!
    @IBOutlet weak var articlesTableView: UITableView!
    
    var allArticles: [Article] = []
    var loadedArticles: [Article] = []
    var filteredArticles: [Article] = []
    
    var page = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var article: Article
        
        for i in 0..<105 {
            article = Article(
                title: "Article \(i + 1)",
                shortDescription: generateLoremIpsum(wordCount: 15),
                description: generateLoremIpsum(wordCount: 100)
            )
            
            allArticles.append(article)
            
            if i < 20 {
                loadedArticles.append(article)
            }
        }
        
        filteredArticles.append(contentsOf: allArticles)
        articlesTableView.reloadData()
    }
    
    func generateLoremIpsum(wordCount: Int) -> String {
        let words = """
        Lorem ipsum dolor sit amet consectetur adipiscing elit sed do
        eiusmod tempor incididunt ut labore et dolore magna aliqua
        """
            .components(separatedBy: .whitespaces)
        
        return (0..<wordCount).map { _ in
            words.randomElement()!
        }.joined(separator: " ")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadedArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("ArticleTableViewCell", owner: self, options: nil)?.first as! ArticleTableViewCell
        
        cell.titleLabel.text = loadedArticles[indexPath.row].title
        cell.shortDescriptionLabel.text = loadedArticles[indexPath.row].shortDescription
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y + scrollView.frame.size.height) > (scrollView.contentSize.height * 0.9) {
            loadMoreArticles()
        }
    }
    
    func loadMoreArticles() {
        if ((page + 1) * 20) < filteredArticles.count {
            for i in (page + 1) * 20 ..< (page + 2) * 20 {
                if i < filteredArticles.count {
                    loadedArticles.append(filteredArticles[i])
                }
            }
            
            page += 1
            articlesTableView.reloadData()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        page = 0
        
        filteredArticles = searchText.isEmpty ? allArticles : allArticles.filter({(article: Article) -> Bool in
            return article.title.range(of: searchText, options: .caseInsensitive) != nil || article.shortDescription.range(of: searchText, options: .caseInsensitive) != nil
        })
        
        loadedArticles.removeAll()
        
        for i in 0..<filteredArticles.count {
            if i < 20 {
                loadedArticles.append(filteredArticles[i])
            }
        }
        
        articlesTableView.reloadData()
    }
    
}

