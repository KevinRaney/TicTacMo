//
//  ContentView.swift
//  TicTacMo
//
//  Created by Kevin R. Raney on 6/25/24.
//

import SwiftUI



struct ContentView: View {
  
@State var whosTurn = "X"
  @State var plays : [String] = ["","","","","","","","",""]
  //@State var plays = ["O","O","","O","O","","O","",""]
  
  private func changePlayer() {
    if whosTurn != "" {
      whosTurn = whosTurn == "X" ? "O" : "X"
    }
  }
  
  private func whoWon() -> String? {
    if plays[0] == plays[3] && plays[0] == plays[6] {
      whosTurn = ""
      return plays[0]
    }
    
    if plays[3] == plays[4] && plays[3] == plays[5] {
      whosTurn = ""
      return plays[3]
    }

    if plays[6] == plays[7] && plays[6] == plays[8] {
      whosTurn = ""
      return plays[6]
    }

    if plays[0] == plays[1] && plays[0] == plays[2] {
      whosTurn = ""
      return plays[0]
    }

    if plays[0] == plays[4] && plays[0] == plays[8] {
      whosTurn = ""
      return plays[0]
    }
    
    if plays[1] == plays[4] && plays[1] == plays[7] {
      whosTurn = ""
      return plays[1]
    }

    if plays[2] == plays[5] && plays[2] == plays[8] {
      whosTurn = ""
      return plays[2]
    }

    if plays[2] == plays[4] && plays[2] == plays[6] {
      whosTurn = ""
      return plays[2]
    }

    // if all squares are filled then cats game!
    for play in plays {
      if play.isEmpty {
        return nil
      }
    }
    
    return "Cats Game"
  }
  
    var body: some View {
        VStack {
          if let whoWon = whoWon() {
              Text("The winner is \(whoWon)")
            if whoWon == "Cats Game" {
              Text("Cats game, tap here to restart the game")
            }
          }
          
          VStack {
            HStack {
              if !plays[0].isEmpty {
                Text(plays[0])
                  .frame(width: 100, height: 100)
                  .background(Color.gray.opacity(0.5))
              } else {
                Text("")
                  .frame(width: 100, height: 100)
                  .background(Color.gray.opacity(0.5))
                  .onTapGesture {
                    plays[0] = whosTurn
                    changePlayer()
                  }
              }
              if !plays[1].isEmpty {
                Text(plays[1])
                  .frame(width: 100, height: 100)
                  .background(Color.gray.opacity(0.5))
              } else {
                Text("")
                  .frame(width: 100, height: 100)
                  .background(Color.gray.opacity(0.5))
                  .onTapGesture {
                    plays[1] = whosTurn
                    changePlayer()
                  }
              }
              if !plays[2].isEmpty {
                Text(plays[2])
                  .frame(width: 100, height: 100)
                  .background(Color.gray.opacity(0.5))
              } else {
                Text("")
                  .frame(width: 100, height: 100)
                  .background(Color.gray.opacity(0.5))
                  .onTapGesture {
                    plays[2] = whosTurn
                    changePlayer()
                  }              }
            }
            HStack {
              if !plays[3].isEmpty {
                Text(plays[3])
                  .frame(width: 100, height: 100)
                  .background(Color.gray.opacity(0.5))
              } else {
                Text("")
                  .frame(width: 100, height: 100)
                  .background(Color.gray.opacity(0.5))
                  .onTapGesture {
                    plays[3] = whosTurn
                    changePlayer()
                  }              }
              if !plays[4].isEmpty {
                Text(plays[4])
                  .frame(width: 100, height: 100)
                  .background(Color.gray.opacity(0.5))
              } else {
                Text("")
                  .frame(width: 100, height: 100)
                  .background(Color.gray.opacity(0.5))
                  .onTapGesture {
                    plays[4] = whosTurn
                    changePlayer()
                  }
              }
              if !plays[5].isEmpty {
                Text(plays[5])
                  .frame(width: 100, height: 100)
                  .background(Color.gray.opacity(0.5))
              } else {
                Text("")
                  .frame(width: 100, height: 100)
                  .background(Color.gray.opacity(0.5))
                  .onTapGesture {
                    plays[5] = whosTurn
                    changePlayer()
                  }
              }
            }
            HStack {
              if !plays[6].isEmpty {
                Text(plays[6])
                  .frame(width: 100, height: 100)
                  .background(Color.gray.opacity(0.5))
              } else {
                Text("")
                  .frame(width: 100, height: 100)
                  .background(Color.gray.opacity(0.5))
                  .onTapGesture {
                    plays[6] = whosTurn
                    changePlayer()
                  }
              }
              if !plays[7].isEmpty {
                Text(plays[7])
                  .frame(width: 100, height: 100)
                  .background(Color.gray.opacity(0.5))
              } else {
                Text("")
                  .frame(width: 100, height: 100)
                  .background(Color.gray.opacity(0.5))
                  .onTapGesture {
                    plays[7] = whosTurn
                    changePlayer()
                  }
              }
              if !plays[8].isEmpty {
                Text(plays[8])
                  .frame(width: 100, height: 100)
                  .background(Color.gray.opacity(0.5))
              } else {
                Text("")
                  .frame(width: 100, height: 100)
                  .background(Color.gray.opacity(0.5))
                  .onTapGesture {
                    plays[8] = whosTurn
                    changePlayer()
                  }
              }
            }
          }
          .padding(20)
          
            Spacer()
          Button("Restart Game") {
            plays = ["","","","","","","","",""]
            whosTurn = "X"
          }
          Spacer()
          Text("It's \(whosTurn)'s turn!")
            .font(.title)
            .onTapGesture {
              if whosTurn == "X" {
                whosTurn = "O"
              } else {
                whosTurn = "X"
              }
              
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
