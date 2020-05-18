//
//  ContentView.swift
//  Intervaller
//
//  Created by André Bergvall on 2020-05-11.
//  Copyright © 2020 André Bergvall. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var sets: Float = 0
    @State var ex: Float = 0
    @State var exTime: Float = 0
    @State var restTime: Float = 0
    @State var breakTime: Float = 0
    
    var totalTimeInSeconds: Float{
        let totalExTimePerSet = Float(exTime*ex)
        print(totalExTimePerSet)
        let totalBreakTimePerSet = Float(breakTime*(ex-1))
        print(totalBreakTimePerSet)
        let totalRestTime = Float(restTime*(sets-1))
        print(totalRestTime)
        let totalTime = Float((sets*(totalBreakTimePerSet+totalExTimePerSet))+totalRestTime)
        print(totalTime)
        return totalTime
    }
    
    var totTime: String{
        let minutes = Int(totalTimeInSeconds) / 60
        let seconds = Int(totalTimeInSeconds) % 60
        return "\(minutes)min \(seconds)s"
    }
    
    
    var body: some View {
        NavigationView{
            GeometryReader { geo in
                VStack(alignment: .center){
                    VStack{
                        HStack{
                            Text("Sets: \(Int(self.sets))")
                                .frame(width: ((geo.size.width/2)-(geo.size.width/20)), alignment: .leading)
                            Slider(value: self.$sets, in: 1.0...10.0, step: 1.0)
                                .frame(width: ((geo.size.width/2)-(geo.size.width/20)), alignment: .trailing)
                        }
                        HStack{
                            Text("Exercises: \(Int(self.ex))")
                                .frame(width: ((geo.size.width/2)-(geo.size.width/20)), alignment: .leading)
                            Slider(value: self.$ex, in: 1.0...10.0, step: 1.0)
                                .frame(width: ((geo.size.width/2)-(geo.size.width/20)), alignment: .trailing)
                        }
                        HStack{
                            Text("Exercise time: \(Int(self.exTime))s")
                                .frame(width: ((geo.size.width/2)-(geo.size.width/20)), alignment: .leading)
                            Slider(value: self.$exTime, in: 10.0...120.0, step: 5.0)
                                .frame(width: ((geo.size.width/2)-(geo.size.width/20)), alignment: .trailing)
                        }
                        HStack{
                            Text("Break time: \(Int(self.breakTime))s")
                                .frame(width: ((geo.size.width/2)-(geo.size.width/20)), alignment: .leading)
                            Slider(value: self.$breakTime, in: 0.0...60.0, step: 5.0)
                                .frame(width: ((geo.size.width/2)-(geo.size.width/20)), alignment: .trailing)
                        }
                        HStack{
                            Text("Rest time: \(Int(self.restTime))s")
                                .frame(width: ((geo.size.width/2)-(geo.size.width/20)), alignment: .leading)
                            Slider(value: self.$restTime, in: 0.0...120.0, step: 10.0)
                                .frame(width: ((geo.size.width/2)-(geo.size.width/20)), alignment: .trailing)
                        }
                        HStack{
                            Text("Total time: ")
                                .frame(width: ((geo.size.width/2)-(geo.size.width/20)), alignment: .leading).font(.largeTitle)
                            Text(self.totTime)
                                .frame(width: ((geo.size.width/2)-(geo.size.width/20)), alignment: .trailing).font(.largeTitle)
                        }
                    }
                    Spacer()
                    NavigationLink(destination: workoutView()){
                    Text("Go to workout").frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
                    }.background(Color.orange).padding(.vertical, 10)
                }
            }.navigationBarTitle("Setup", displayMode: .inline).padding(.top)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
