//
//  workoutView.swift
//  Intervaller
//
//  Created by André Bergvall on 2020-05-11.
//  Copyright © 2020 André Bergvall. All rights reserved.
//

import SwiftUI

struct workoutView: View {
    var body: some View {
        VStack{
            GeometryReader { geometry in
                VStack{
                    Text("120")
                        .frame(width: geometry.size.width, height: geometry.size.width/1.5, alignment: .center)
                        .background(Color.yellow)
                        .padding(.bottom, 10)
                        .font(.largeTitle)
                    Text("Workout/Break/longbreak/countdown")
                        .font(.title)
                        .frame(width: geometry.size.width, height: 50, alignment: .center)
                        .background(Color.gray)
                    Spacer()
                    Button(action: {
                        print("testing")
                    }){
                        Text("Start/Pause/Resume")
                        .frame(width: geometry.size.width, height: 100, alignment: .center)
                        }.background(Color.orange)
                    HStack{
                        Button(action: {
                            print("testing")
                        }){
                            Text("Restart")
                            .frame(width: geometry.size.width/2, height: 50, alignment: .center)
                        }.background(Color.green)
                        Button(action: {
                            print("testing")
                        }){
                            Text("Stop")
                                .frame(width: geometry.size.width/2, height: 50, alignment: .center)
                        }.background(Color.red)
                    }.padding(10)
                }
            }
        }.navigationBarTitle("Workout")
    }
}

struct workoutView_Previews: PreviewProvider {
    static var previews: some View {
        workoutView()
    }
}
