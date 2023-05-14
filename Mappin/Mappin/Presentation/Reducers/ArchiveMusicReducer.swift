//
//  ArchiveMusicReducer.swift
//  Mappin
//
//  Created by 한지석 on 2023/05/11.
//

import Foundation

import ComposableArchitecture

struct ArchiveMusicReducer: ReducerProtocol {
    
    let removePinUseCase: RemovePinUseCase
    
//    init(removePinUseCase: RemovePinUseCase = DefaultRemovePinUseCase()) {
//        self.removePinUseCase = removePinUseCase
//    }
    
    struct State: Equatable  {
        var archiveMusic: [Pin] = []
        var archiveIsEmpty = false
        var isOtherPin = true
        
        var lastAction: UniqueAction<Action>?
    }
    
    enum Action: Equatable {
        case applyArchive([Pin])
        case archiveCellTapped(id: Int)
        case removeArchive(index: IndexSet)
        case pinRemoved(id: Int)
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        state.lastAction = .init(action)
        print("@BYO LIST \(action)".prefix(100))
        
        switch action {
        case .applyArchive(let archiveMusic):
            // 서버에서 받아온 Pin 정보 저장
            print("@BYO action.applyArchive \(archiveMusic.count)")
            state.archiveMusic = archiveMusic
            return .none
            
        case let .archiveCellTapped(id):
            // 해당 피닝 위치로 이동
            print("@BYO action.archiveCellTapped \(id)")
            return .none
            
        case .removeArchive(let index):
//            let temp = state.archiveMusic.
            // 여기 연결하자 내일
//            print(state.archiveMusic.indexsset)
            print(index)
            state.archiveMusic.remove(atOffsets: index)
            // API Call ?
//            return .task {
//                removePinUseCase.execute(id: index)
//            }
            return .none
        case let .pinRemoved(id):
            print("@BYO action.pinRemoved \(id)")
            return .none
        }
    }
    
}

struct TempArchive: Identifiable, Equatable {
    var id: Int
    var music: Music
    var date: String = "Apr 11, 2023 ・ 6:03PM ・ 화요일"
}

//TempArchive(id: 1, music: Music(id: UUID().uuidString, title: "messi1", artist: "ronaldo", artwork: URL(string: "https://is5-ssl.mzstatic.com/image/thumb/Music122/v4/cf/79/94/cf7994ea-4fe5-9d8f-72a2-9725fc4b2c3a/19UMGIM16534.rgb.jpg/200x200bb.jpg"), appleMusicUrl: nil)),
//                     TempArchive(id: 2, music: Music(id: UUID().uuidString, title: "messi2", artist: "ronaldo", artwork: URL(string: "https://is5-ssl.mzstatic.com/image/thumb/Music122/v4/cf/79/94/cf7994ea-4fe5-9d8f-72a2-9725fc4b2c3a/19UMGIM16534.rgb.jpg/200x200bb.jpg"), appleMusicUrl: nil)),
//                                     TempArchive(id: 3, music: Music(id: UUID().uuidString, title: "messi3", artist: "ronaldo", artwork: URL(string: "https://is5-ssl.mzstatic.com/image/thumb/Music122/v4/cf/79/94/cf7994ea-4fe5-9d8f-72a2-9725fc4b2c3a/19UMGIM16534.rgb.jpg/200x200bb.jpg"), appleMusicUrl: nil)),
//                                     TempArchive(id: 4, music: Music(id: UUID().uuidString, title: "messi4", artist: "ronaldo", artwork: URL(string: "https://is5-ssl.mzstatic.com/image/thumb/Music122/v4/cf/79/94/cf7994ea-4fe5-9d8f-72a2-9725fc4b2c3a/19UMGIM16534.rgb.jpg/200x200bb.jpg"), appleMusicUrl: nil)),
//                                     TempArchive(id: 5, music: Music(id: UUID().uuidString, title: "messi5", artist: "ronaldo", artwork: URL(string: "https://is5-ssl.mzstatic.com/image/thumb/Music122/v4/cf/79/94/cf7994ea-4fe5-9d8f-72a2-9725fc4b2c3a/19UMGIM16534.rgb.jpg/200x200bb.jpg"), appleMusicUrl: nil))])

extension ArchiveMusicReducer {
    static func build() -> Self {
        ArchiveMusicReducer(
            removePinUseCase: DefaultRemovePinUseCase(pinsRepository: APIPinsRepository())
        )
    }
}
