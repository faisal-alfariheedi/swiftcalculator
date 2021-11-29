//
//  ViewController.swift
//  calculator
//
//  Created by faisal on 24/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var output: UILabel!
    var slot:Bool=true
    var v1 = "0"
    var v2 = ""
    var dotcon=true
    var op=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
////////////////////////////////////////////////////////////////
    ///i didn`t understand what the percentage will be modulo or the usual /// percentage
    ///
    ///
    ///
    ///
    ///

    @IBAction func clear(_ sender: UIButton) {
        slot = true
        v1 = "0"
        v2 = ""
        op=""
        output.text="0"
        update()
    }
    @IBAction func sign(_ sender: UIButton) {
        if(slot){
            if(v1 != "0"){
                v1 = String(Double(v1)! * -1)}
            if(dotcon){
                v1.removeLast(2)
            }
        }else {
            if(v2 != "0" && v2 != "" ){
                v2 = String(Double(v2)! * -1)}
            if(dotcon){
                v2.removeLast(2)
            }
        }
        update()
    }
    @IBAction func percent(_ sender: UIButton) {
        op="%"
        slot=false
        update()
    }
    @IBAction func division(_ sender: UIButton) {
        op="/"
        slot=false
        update()
    }
    @IBAction func mult(_ sender: UIButton) {
        op="*"
        slot=false
        update()
    }
    @IBAction func substr(_ sender: UIButton) {
        op="-"
        slot=false
        update()
    }
    @IBAction func plus(_ sender: UIButton) {
        op="+"
        slot=false
        update()
    }
    @IBAction func result(_ sender: UIButton) {
        var num1=Double(v1)!
        var num2=Double(v2)!
        var res=0.0
        switch op{
            case "/":
                if (num2==0){
                    clear(sender)
                    ale()
                }
                res=num1/num2
            case "*":
                res=num1*num2
            case "-":
                res=num1-num2
            case "+":
                res=num1+num2
            case "%":
                res=(num1/num2)*100
            default:
                print("illegal move")
        }
        v1=String(res)
        op=""
        v2=""
        update()
    }
    @IBAction func dot(_ sender: UIButton) {
        if(dotcon){
            dotcon=false
            if(slot){v1=v1+"."}else{v2=v2+"."}
        }else if(slot){if(v1=="0."||v1=="0.0"){dotcon=true;v1.replacingOccurrences(of: ".", with: "")}}else{if(v2=="0."||v2=="0.0"){dotcon=true;v2.replacingOccurrences(of: ".", with: "")}}
        update()
    }
    @IBAction func n0(_ sender: UIButton) {
        
        if(slot){
            if(Double(v1)! != 0){
                v1=v1+"0"
                update()
            }
            
        }else if(v2 != ""){if(Double(v2)! != 0){
                v2=v2+"0"
                update()
        }}else{v2="0";update()}
        
    }
    @IBAction func n1(_ sender: UIButton) {
        if(slot){
                v1=v1+"1"
                
        }else{
            v2=v2+"1"
            
        }
        if(v1.first=="0" && slot){
            v1.removeFirst()
        }
        if(v2.first=="0"){
            v2.removeFirst()
        }
        update()
    }
    @IBAction func n2(_ sender: UIButton) {
        if(slot){
                v1=v1+"2"
               
        }else{
            v2=v2+"2"
            
        }
        if(v1.first=="0" && slot){
            v1.removeFirst()
        }
        if(v2.first=="0"){
            v2.removeFirst()
        }
        update()
    }
    @IBAction func n3(_ sender: UIButton) {
        if(slot){
                v1=v1+"3"
                
        }else{
            v2=v2+"3"
            
        }
        if(v1.first=="0" && slot){
            v1.removeFirst()
        }
        if(v2.first=="0"){
            v2.removeFirst()
        }
        update()
    }
    @IBAction func n4(_ sender: UIButton) {
        if(slot){
                v1=v1+"4"
        }else{
            v2=v2+"4"
            
        }
        if(v1.first=="0" && slot){
            v1.removeFirst()
        }
        if(v2.first=="0"){
            v2.removeFirst()
        }
        update()
    }
    @IBAction func n5(_ sender: UIButton) {
        if(slot){
                v1=v1+"5"
                
        }else{
            v2=v2+"5"
            
        }
        if(v1.first=="0" && slot){
            v1.removeFirst()
        }
        if(v2.first=="0"){
            v2.removeFirst()
        }
        update()
    }
    @IBAction func n6(_ sender: UIButton) {
        if(slot){
                v1=v1+"6"
                
        }else{
            v2=v2+"6"
            
        }
        if(v1.first=="0" && slot){
            v1.removeFirst()
        }
        if(v2.first=="0"){
            v2.removeFirst()
        }
        update()
    }
    @IBAction func n7(_ sender: UIButton) {
        if(slot){
                v1=v1+"7"
                
        }else{
            v2=v2+"7"
            
        }
        if(v1.first=="0" && slot){
            v1.removeFirst()
        }
        if(v2.first=="0"){
            v2.removeFirst()
        }
        update()
    }
    @IBAction func n8(_ sender: UIButton) {
        if(slot){
                v1=v1+"8"
                
        }else{
            v2=v2+"8"
            
        }
        if(v1.first=="0" && slot){
            v1.removeFirst()
        }
        if(v2.first=="0"){
            v2.removeFirst()
        }
        update()
    }
    @IBAction func n9(_ sender: UIButton) {
        if(slot){
                v1=v1+"9"
               
        }else{
            v2=v2+"9"
            
        }
        if(v1.first=="0" && slot){
            v1.removeFirst()
        }
        if(v2.first=="0"){
            v2.removeFirst()
        }
        update()
    }
    func update(){
        
        
        output.text=v1+op+v2
    }
    
    func ale(){
        let alert = UIAlertController(title: "zero division detected", message: "this move is illegal don`t do it again", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok i won`t", style: .default, handler: { [self] action in
            switch action.style{
                case .default:
                    print("")
                
                case .cancel:
                print("cancel")
                
                case .destructive:
                print("destructive")
                
                @unknown default:
                    print("")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

