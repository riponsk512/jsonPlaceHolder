//
//  ViewController.swift
//  jsonPlaceHolder
//
//  Created by Ripon sk on 10/10/22.
//

import UIKit
import Combine
class ViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    var arr = [Results]()
    var x = FetchData.shared
    var observer:AnyCancellable?
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        Task.init {
            arr = await x.fetchasync(url:url)!
            for i in arr{
                print(i.title)
            }
            self.table.reloadData()
        }
//        x.fetchdata(url: url) { res, err in
//            if err == nil{
//                for i in res!{
//                    print(i.title!)
//                }
//                DispatchQueue.main.async {
//                    self.arr = res!
//                    self.table.reloadData()
//                }
//
//            }else{
//                print(err?.localizedDescription)
//            }
//
//
//
//
//        }
        print("hi")
        
//        observer =  x.fetchdatacombine(url: url).receive(on: DispatchQueue.main).sink { comp in
//            print(comp)
//        } receiveValue: { res in
//            self.arr = res
//            self.table.reloadData()
//        }

        }
//        Fetchdata.shared.vc = self
//        arr = Fetchdata.shared.arr
        
        // Do any additional setup after loading the view.
    }




extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.title.text = arr[indexPath.row].title
        cell.body.text = arr[indexPath.row].body
        return cell
    }
    
    
}
