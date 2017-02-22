//
//  PianoViewController.swift
//  convert
//
//  Created by Mayank Daswani on 2/20/17.
//  Copyright © 2017 Mayank Daswani. All rights reserved.
//

import UIKit
import AVFoundation

class PianoViewController: UIViewController {

    @IBOutlet weak var staffone: UIImageView!
    @IBOutlet weak var stafftwo: UIImageView!
    
    
    @IBOutlet weak var C: UIButton!
    @IBOutlet weak var D: UIButton!
    @IBOutlet weak var E: UIButton!
    @IBOutlet weak var F: UIButton!
    @IBOutlet weak var G: UIButton!
    @IBOutlet weak var A: UIButton!
    @IBOutlet weak var B: UIButton!
    @IBOutlet weak var C_h: UIButton!
    
    @IBOutlet weak var Csh: UIButton!
    @IBOutlet weak var Dsh: UIButton!
    @IBOutlet weak var Fsh: UIButton!
    @IBOutlet weak var Gsh: UIButton!
    @IBOutlet weak var Ash: UIButton!
    
    var audioPlayer: AVAudioPlayer! = nil
    //var player: AVAudioPlayer! = nil
    
    var count = 1
    var xpos = 75
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let position = touch.location(in: self.staffone)
            print(position.x)
            print(position.y)
        }
    }
    
    
    // note = x
    // spaces----------------------------
    // F_l = 60
    // A   = 48                 difference  = 12
    // C_h = 36
    // E_h = 24
    // D_l =
    
    // lines-----------------------------
    // E_l= 66
    // G  = 54
    // B  = 42                  difference  = 12
    // D_h= 38
    // F_h= 30
    
    
    
    @IBAction func Cbtn(_ sender: Any) {
        playMyFile(fname: "C3")
        count += 1
        xpos = xpos+75
        placeviewsemibreve(xcoord: xpos, ycoord: 78)
    }
    @IBAction func Dbtn(_ sender: Any) {
        count += 1
        xpos = xpos+75
        playMyFile(fname: "D")
        placeviewsemibreve(xcoord: xpos, ycoord: 72)
    }
    @IBAction func Ebtn(_ sender: Any) {
        count += 1
        xpos = xpos+75
        playMyFile(fname: "E")
        placeviewsemibreve(xcoord: xpos, ycoord: Int(66))
    }
    @IBAction func Fbtn(_ sender: Any) {
        count += 1
        xpos = xpos+75
        playMyFile(fname: "F")
        placeviewsemibreve(xcoord: xpos, ycoord: Int(60))
    }
    @IBAction func Gbtn(_ sender: Any) {
        count += 1
        xpos = xpos+75
        playMyFile(fname: "G")
        placeviewsemibreve(xcoord: xpos, ycoord: 54)
    }
    @IBAction func Abtn(_ sender: Any) {
        count += 1
        xpos = xpos+75
        playMyFile(fname: "A")
        placeviewsemibreve(xcoord: xpos, ycoord: 48)
    }
    @IBAction func Bbtn(_ sender: Any) {
        count += 1
        xpos = xpos+75
        playMyFile(fname: "B")
        placeviewsemibreve(xcoord: xpos, ycoord: 42)
    }
    @IBAction func C_hbtn(_ sender: Any) {
        count += 1
        xpos = xpos+75
        playMyFile(fname: "C4")
        placeviewsemibreve(xcoord: xpos, ycoord: 36)
    }
    
    // place a sharp sign before these notes
    @IBAction func Csh_btn(_ sender: Any) {
        count += 1
        xpos = xpos+75
        playMyFile(fname: "C#")
        placeviewsemibreve(xcoord: xpos, ycoord: 36)
    }
    @IBAction func Dsh_btn(_ sender: Any) {
        count += 1
        xpos = xpos+75
        playMyFile(fname: "D#")
        placeviewsemibreve(xcoord: xpos, ycoord: 36)
    }
    @IBAction func Fsh_btn(_ sender: Any) {
        count += 1
        xpos = xpos+75
        playMyFile(fname: "F#")
        placeviewsemibreve(xcoord: xpos, ycoord: 36)
    }
    @IBAction func Gsh_btn(_ sender: Any) {
        count += 1
        xpos = xpos+75
        playMyFile(fname: "G#")
        placeviewsemibreve(xcoord: xpos, ycoord: 36)
    }
    
    @IBAction func Ash_btn(_ sender: Any) {
        count += 1
        xpos = xpos+75
        playMyFile(fname: "A#")
        placeviewsemibreve(xcoord: xpos, ycoord: 36)
    }
    
    
    // add a dictionary for the value of the notes to put a break after evry 4 beats
    
    // semibreve = whole note
    //minim = half note
    //quartet = one fourth note
    //quaver = one eigth note
    var countbt = [4 : "semibreve",
                   2: "minim",
                   1: "quartet",
                   0.5: "quaver"]
    
    // add a new parameter to change the staff if count% 10 == 0
    
    // whole note function
    func placeviewsemibreve(xcoord:Int, ycoord: Int)
    {
        let imageName = "semibreve(25).png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: xcoord, y: ycoord, width: 25, height: 45)
        
        if count<15{
            staffone.addSubview(imageView)
        }
        else if count>15 && count<17{
            self.xpos = 75
        }
        else if xpos>16
        {
            stafftwo.addSubview(imageView)
        }
        else {
            print("take screenshot and remove subviews")
        }
    }
    
    func placeviewsharp(xcoord:Int, ycoord: Int)
    {
        let imageName = "sharp25.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: xcoord, y: ycoord, width: 20, height: 35)
        
        if count<15{
            staffone.addSubview(imageView)
        }
        else if count>15 && count<17{
            self.xpos = 75
        }
        else if xpos>16
        {
            stafftwo.addSubview(imageView)
        }
        else {
            print("take screenshot and remove subviews")
        }
    }
    
    
    
    
    
    
    
    
    // write mods for quarter note
    // write function for half note(find pic too)
    // write function for one eigth note(find pic too)
    //
    
    func placeviewquartet(xcoord:Int, ycoord: Int)
    {
        let imageName = "quartet25.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: xcoord, y: ycoord, width: 25, height: 45)
        
        if count<15{
            staffone.addSubview(imageView)
        }
        else if count<30{
            count = 1
            stafftwo.addSubview(imageView)
        }
        else{
            print("take screenshot and remove subviews")
        }
    }
    
    
    func playMyFile(fname: String) {
        
        let path = Bundle.main.path(forResource: "sound/"+String(fname), ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: path!)
        
        do {
            try audioPlayer =  AVAudioPlayer(contentsOf: fileURL as URL)
        } catch {
            print("error")
        }
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    


}
