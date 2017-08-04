//
//  ViewController.swift
//  Experiments
//
//  Created by max tang on 17/3/29.
//  Copyright © 2017年 TaiLopez. All rights reserved.
//

import UIKit
import Charts
import RealmSwift

class ViewController: UIViewController {
    
    // MARK: outlets
    
    @IBOutlet weak var tfValue: UITextField!

    @IBOutlet weak var lineChart: LineChartView!
    @IBOutlet weak var barView: BarChartView!
    
    // MARK: actions
    
    @IBAction func btnAddTapped(_ sender: Any) {
        if let value = tfValue.text , value != "" {
            let visitorCount = VisitorCount()
            visitorCount.count = (NumberFormatter().number(from: value)?.intValue)!
            visitorCount.save()
            tfValue.text = ""
        }
        
        upateLineChart()
        updateChartWithData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateChartWithData()
        upateLineChart()
    }
    
    func updateChartWithData() {
        var dataEntries: [BarChartDataEntry] = []
        let visitorCounts = getVisitorCountsFromDatabase()
        for i in 0..<visitorCounts.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(visitorCounts[i].count))
            dataEntries.append(dataEntry)
        }
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Visitor count")
        let chartData = BarChartData(dataSet: chartDataSet)
        barView.data = chartData
    }
    
    func getVisitorCountsFromDatabase() -> Results<VisitorCount> {
        do {
            let realm = try Realm()
            return realm.objects(VisitorCount.self)
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    
    func upateLineChart() {
        var dataEntries: [ChartDataEntry] = []
        var dataEntries2: [ChartDataEntry] = []
        
        let days = [1, 3, 5, 7, 15, 30, 60, 90, 180, 365]

        let visitorCounts = getVisitorCountsFromDatabase()
        for i in 0..<visitorCounts.count {
            let dataEntry = ChartDataEntry(x: Double(days[i]), y: Double(visitorCounts[i].count))
            dataEntries.append(dataEntry)
            
            let dataEntry2 = ChartDataEntry(x: Double(i)+0.5, y: Double(visitorCounts[i].count)-0.5)
            dataEntries2.append(dataEntry2)
        }
        let chartDataSet = LineChartDataSet(values: dataEntries, label: "Visitor count")
        let chartDataSet2 = LineChartDataSet(values: dataEntries2, label: "Biased count")
        
        chartDataSet.circleHoleRadius = CGFloat(1)
        chartDataSet.circleColors = [UIColor(red: 1.0, green: 0, blue: 0, alpha: 0)]
        chartDataSet.setColor(UIColor(red: 1.0, green: 0, blue: 0, alpha: 0), alpha: 1)
        let chartData = LineChartData(dataSets: [chartDataSet, chartDataSet2])
        
        lineChart.data = chartData
    }
    
    private func addTestViews() {
        let v1 = UIView(frame:CGRect(x:113, y:111, width:132, height:194))
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        let v2 = UIView(frame:v1.bounds.insetBy(dx: 10, dy: 10))
        v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        self.view.addSubview(v1)
        v1.addSubview(v2)
        v1.bounds.origin.x += 10
        v1.bounds.origin.y += 10
    }

}

