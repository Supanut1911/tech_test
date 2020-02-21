//
//  ViewController.swift
//  techTest
//
//  Created by Supanut Laddayam on 21/2/2563 BE.
//  Copyright © 2563 Supanut Laddayam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var infos = [String: AnyObject] ()
    
     let url = URL(string: "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJson()

    }
    
    
    func downloadJson() {
        guard let downloadURL = url else { return }
        
        URLSession.shared.dataTask(with: downloadURL) { (data, urlResponse, error) in
            
            
            if error == nil {
                do {
                    self.infos = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: AnyObject ]
                    
                    self.tableView.reloadData()
                    
                } catch {
                    print("JSON Error")
                }
                
            }
        }.resume()
    }


}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toWebView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? WebviewVC {
            destination.webView = infos["link"] as! UIWebView
        }
    
    }
}

extension ViewController: UITableViewDelegate {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return infos.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellid", for: indexPath) as! InfoCell
           let item = self.infos["link"] as! [String: AnyObject]
//           cell.detailLabel.text = item
           return cell
       }
       
}

