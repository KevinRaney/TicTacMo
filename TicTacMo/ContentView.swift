//
//  ContentView.swift
//  TicTacMo
//
//  Created by Kevin R. Raney on 6/25/24.
//

import SwiftUI

let playerX: String = "X"
let playerO: String = "O"


struct ContentView: View {
  @State var whosTurn = "X"
  @State var plays : [String] = ["","","","","","","","",""]
  //@State var plays = ["O","O","","O","O","","O","",""]
  
  private func changePlayer() {
    if whosTurn != "" {
      whosTurn = whosTurn == playerX ? playerO : playerX
    }
  }
  
  var whoWon: String? {
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
    
    whosTurn = ""
    return "Cats Game"
  }
  
    var body: some View {
        VStack {
          Text("Tic Tac Mo")
            .font(.title)
            .bold()
          
          VStack {
            HStack {
              PlaySquare(play: $plays[0])
                .onTapGesture {
                  if whosTurn != "" {
                    plays[0] = whosTurn
                    changePlayer()
                  }
                }
              PlaySquare(play: $plays[1])
                .onTapGesture {
                  if whosTurn != "" {
                    plays[1] = whosTurn
                    changePlayer()
                  }
                }
              PlaySquare(play: $plays[2])
                .onTapGesture {
                  if whosTurn != "" {
                    plays[2] = whosTurn
                    changePlayer()
                  }
                }
            }
            HStack {
              PlaySquare(play: $plays[3])
                .onTapGesture {
                  if whosTurn != "" {
                    plays[3] = whosTurn
                    changePlayer()
                  }
                }
              PlaySquare(play: $plays[4])
                .onTapGesture {
                  if whosTurn != "" {
                    plays[4] = whosTurn
                    changePlayer()
                  }
                }
              PlaySquare(play: $plays[5])
                .onTapGesture {
                  if whosTurn != "" {
                    plays[5] = whosTurn
                    changePlayer()
                  }
                }
            }
            HStack {
              PlaySquare(play: $plays[6])
                .onTapGesture {
                  if whosTurn != "" {
                    plays[6] = whosTurn
                    changePlayer()
                  }
                }
              PlaySquare(play: $plays[7])
                .onTapGesture {
                  if whosTurn != "" {
                    plays[7] = whosTurn
                    changePlayer()
                  }
                }
              PlaySquare(play: $plays[8])
                .onTapGesture {
                  if whosTurn != "" {
                    plays[8] = whosTurn
                    changePlayer()
                  }
                }
            }
          }
          .padding(20)
          
          if let whoWon = whoWon {
            
            if whoWon == "Cats Game" {
              Text("Cats game, tap here to restart the game")
                .font(.title)
                .foregroundStyle(Color.blue)
            } else if !whoWon.isEmpty {
              Text("The winner is \(whoWon)")
                .font(.title)
                .foregroundStyle(whoWon == playerX ? Color.red : Color.black)
            }
          }
          Spacer()
          Button("Restart Game") {
            plays = ["","","","","","","","",""]
            whosTurn = playerX
          }
          Spacer()
          Text("It's \(whosTurn)'s turn!")
            .font(.title)
            .onTapGesture {
              if whosTurn == playerX {
                whosTurn = playerO
              } else {
                whosTurn = playerX
              }
              
            }
        }
        .padding()
        .onAppear {
          if whosTurn == "X" {
            whosTurn = playerX
          }
        }
    }
}

#Preview {
    ContentView()
}

struct PlaySquare: View {
  @Binding var play: String
  
  var body: some View {
    Text(play)
      .font(.system(size: 50))
      .bold()
      .foregroundStyle(play == playerX ? Color.red : Color.black)
      .frame(width: 100, height: 100)
      .background(Color.gray.opacity(0.5))
  }
}
