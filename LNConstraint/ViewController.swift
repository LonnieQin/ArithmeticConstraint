//
//  ViewController.swift
//  LNConstraint
//
//  Created by lonnie on 2017/3/29.
//  Copyright © 2017年 lonnie. All rights reserved.
//

import UIKit
struct Row {
    var title:String
    var block:()->Void
}
class ViewController: UITableViewController {
    var rows:[Row] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        addRows()
        title = "ArithmeticConstraint Samples"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item")!
        cell.textLabel?.text = rows[indexPath.row].title
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rows[indexPath.row].block()
    }

}

extension ViewController {
    func addRows() {
        rows.append(Row(title:"Constraint = Constraint"){[unowned self] in
            class VC:UIViewController {
                override func viewDidLoad() {
                    super.viewDidLoad()
                    view.backgroundColor = .white
                    let box = UIView()
                    box.backgroundColor = .red
                    view.addSubview(box)
                    box.ln.leading = view.ln.leading
                    box.ln.trailing = view.ln.trailing
                    box.ln.top = view.ln.top
                    box.ln.bottom = view.ln.bottom
                    
                    let box2 = UIView()
                    box2.backgroundColor = .green
                    view.addSubview(box2)
                    box2.ln.leading = view.ln.leadingMargin
                    box2.ln.trailing = view.ln.trailingMargin
                    box2.ln.top = view.ln.topMargin
                    box2.ln.bottom = view.ln.bottomMargin
                    
                    let box3 = UIView()
                    box3.backgroundColor = .blue
                    view.addSubview(box3)
                    box3.ln.centerX = view.ln.centerX
                    box3.ln.centerY = view.ln.centerY
                    box3.ln.width = ArithmeticWidth(100)
                    box3.ln.height = ArithmeticHeight(100)
                
                }
            }
            self.navigationController?.pushViewController(VC(), animated: false)
        })
        

        
        rows.append(Row(title:"Constraint = Constraint + Number,Constraint = Constraint - Number"){[unowned self] in
            class VC:UIViewController {
                override func viewDidLoad() {
                    super.viewDidLoad()
                    view.backgroundColor = .white
                    let box = UIView()
                    box.backgroundColor = .red
                    view.addSubview(box)
                    box.ln.leading = view.ln.leading + 10
                    box.ln.trailing = view.ln.trailing - 10
                    box.ln.top = view.ln.top + 100
                    box.ln.bottom = view.ln.bottom - 100
                    print(view.constraints)
                }
            }
            self.navigationController?.pushViewController(VC(), animated: false)
        })
        rows.append(Row(title:"Constraint = Constraint * Number"){[unowned self] in
            class VC:UIViewController {
                override func viewDidLoad() {
                    super.viewDidLoad()
                    view.backgroundColor = .white
                    let box = UIView()
                    box.backgroundColor = .red
                    view.addSubview(box)
                    box.ln.centerX = view.ln.trailing*0.5
                    box.ln.centerY = view.ln.bottom*0.5
                    box.ln.width = ArithmeticWidth(100)
                    box.ln.height = ArithmeticHeight(100)
                    print(view.constraints)
                }
            }
            self.navigationController?.pushViewController(VC(), animated: false)
        })
        rows.append(Row(title:"Constraint = Constraint / Number"){[unowned self] in
            class VC:UIViewController {
                override func viewDidLoad() {
                    super.viewDidLoad()
                    view.backgroundColor = .white
                    let box = UIView()
                    box.backgroundColor = .red
                    view.addSubview(box)
                    box.ln.centerX = view.ln.trailing/2
                    box.ln.centerY = view.ln.bottom/2
                    box.ln.width = ArithmeticWidth(100)
                    box.ln.height = ArithmeticWidth(100)
                    print(view.constraints)
                }
            }
            self.navigationController?.pushViewController(VC(), animated: false)
        })
        
        rows.append(Row(title:"Constraint >= Constraint,Constraint <= Constraint"){[unowned self] in
            class VC:UIViewController {
                override func viewDidLoad() {
                    super.viewDidLoad()
                    view.backgroundColor = .white
                    let label = UILabel()
                    label.numberOfLines = 0
                    label.text = "'>=' can make sure you create a NSLayoutConstraint object with greater-than-or-equal-to relation;\n'<=' can make sure you create a NSLayoutConstraint object with less-than-or-equal-to relation.\n"
                    view.addSubview(label)
                    label.ln.top = view.ln.top + 100
                    label.ln.centerX = view.ln.centerX
                    label.ln.leading >= view.ln.leading + 20
                    label.ln.trailing <= view.ln.trailing - 20
                }
            }
            self.navigationController?.pushViewController(VC(), animated: false)
        })
    }
}

