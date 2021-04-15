//
//  ViewController.swift
//  ExploringFileManage
//
//  Created by JEONGSEOB HONG on 2021/04/15.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = FileManager.default
        
        guard let url = manager.urls(
                for: .documentDirectory,
                in: .userDomainMask)
                .first
        else {
            print("Failed")
            return
        }
        print("url :", url)
        
        let firstCreatedFolder = url.appendingPathComponent("firstCreatedFolder")
        print("firstCreatedFolder :", firstCreatedFolder)
        
        //  create folder
        do {
            try manager.createDirectory(at: firstCreatedFolder,
                                        withIntermediateDirectories: true,
                                        attributes: [:])
        }
        catch { print(error) }
        
        let secondSubFolderUrl = firstCreatedFolder.appendingPathComponent("secondCreatedFolder")
        print("secondSubFolderUrl :", secondSubFolderUrl)
        do {
            try manager.createDirectory(at: secondSubFolderUrl,
                                        withIntermediateDirectories: true,
                                        attributes: [:])
        }
        catch { print(error) }
        
        let fileUrl = secondSubFolderUrl.appendingPathComponent("log.txt")
        let data = "Writing text to a text file!!!!!!!!!".data(using: .utf8)
        
        // create file *if folder is not exist, file is not created
        manager.createFile(atPath: fileUrl.path,
                           contents: data,
                           attributes: [FileAttributeKey.creationDate: Date()])
        
        
        // remove file and folder
        if manager.fileExists(atPath: fileUrl.path) {
            print("this is a thing on disk")
            do {
                // remove file
                try manager.removeItem(at: fileUrl)
                // remove folder
                try manager.removeItem(at: url)
            }
            catch { print(error) }
        }
    }
}

