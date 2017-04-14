//
//  ViewController.swift
//  TableViewSwift
//
//  Created by lisonglin on 14/04/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    let dataSource:NSMutableArray = []
    var tableView: UITableView = UITableView()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "TableView"
        
        for _ in 1...20 {
            
            dataSource.add(arc4random_uniform(100))
        }
        
        //导航栏右侧添加 添加 编辑 按钮
        let addItem = UIBarButtonItem.init(title: "+", style: UIBarButtonItemStyle.plain, target: self, action: #selector(ViewController.addBtnClick))
        let editItem = UIBarButtonItem.init(title: "edit", style: UIBarButtonItemStyle.plain, target: self, action: #selector(ViewController.editBtnClick))
        
        self.navigationItem.rightBarButtonItems = [addItem,editItem]
        
        
        tableView = UITableView(frame:CGRect(x:0,y:0,width:self.view.frame.size.width,height:self.view.frame.size.height), style:UITableViewStyle.plain)
        
        tableView.tableFooterView = UIView()
        
        self.view .addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self

    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    //tableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "cellId"

        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        
        if (cell == nil) {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellId)
        }
        
        cell?.textLabel?.text = "\(self.dataSource[indexPath.row])"
        
        return cell!
    }
    
    //点击
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView .deselectRow(at: indexPath, animated: true)
        
        let vc = DetailViewController()
        
        vc.text = "\(self.dataSource[indexPath.row])"
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            //删除数据源当前的数据
            self.dataSource .removeObject(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
    }
    
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        if sourceIndexPath != destinationIndexPath {
            //获取移动的值
            let itemValue = self.dataSource[sourceIndexPath.row]
            
            //删除移动的值
            self.dataSource.removeObject(at: sourceIndexPath.row)
            
            //如果移动的区域大于现有行数 拼在最后面
            if destinationIndexPath.row > self.dataSource.count {
                self.dataSource.add(itemValue)
            }else{
                self.dataSource.insert(itemValue, at: destinationIndexPath.row)
            }
            
            
        }
    }
    
    
    //右侧添加按钮
    func addBtnClick(sender:UIButton) {
        //添加一个在最前面

        self.dataSource.insert(arc4random_uniform(100), at: 0)
        
        let index = IndexPath.init(row: 0, section: 0)
        
        self.tableView.insertRows(at: [index], with: UITableViewRowAnimation.fade)
    }
    
    //右侧编辑按钮
    func editBtnClick() {
        if self.tableView.isEditing == false {
            self.tableView.setEditing(true, animated: true)
        }else{
            self.tableView.setEditing(false, animated: true)
        }
    }
    

    
}

