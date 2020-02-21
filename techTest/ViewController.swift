//
//  ViewController.swift
//  techTest
//
//  Created by Supanut Laddayam on 21/2/2563 BE.
//  Copyright © 2563 Supanut Laddayam. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var infos: InfoStruct?
    
     let url = URL(string: "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJson()
    }
    
    
    func downloadJson() {
        guard let downloadURL = url else { return }
        
        URLSession.shared.dataTask(with: downloadURL) { (data, urlResponse, error) in
            guard let data = data, error == nil, urlResponse != nil else {
                print("somethin wrong")
                return
            }
            print("downloaded")
            do {
                let decoder = JSONDecoder()
                self.infos = try decoder.decode(InfoStruct.self, from: data)
                
                print(self.infos)
//                print(type(of: self.infos[0]))
                
                DispatchQueue.main.async {
                     self.tableView.reloadData()
                }
               
            } catch {
                print("JSON Error")
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
//            destination.webView = infos["link"] as! UIWebView
            destination.linkurl = infos?.items?[0].link ?? ""
        }
    
    }
}

extension ViewController: UITableViewDelegate {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infos?.items?.count ?? 0
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellid") as? InfoCell else {return UITableViewCell()}
        let url = URL(string: infos?.items?[indexPath.row].media?.m ?? "")
        cell.infoImageView.kf.setImage(with: url)
        cell.detailLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
//        cell.detailLabel.text = infos?.items?[indexPath.row].link
        
           return cell
       }
       
}



