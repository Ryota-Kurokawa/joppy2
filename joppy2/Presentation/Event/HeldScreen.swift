
//
//  EditView.swift
//  joppy2
//
//  Created by 櫻井絵理香 on 2024/03/16.
//


//編集するページ
import SwiftUI



struct EditButton: View {
    @Binding var isShowSheet: Bool
    var body: some View {
        Button {
            isShowSheet.toggle()
        } label: {
            Text("編集")
                .frame(width: 100,height: 100)
                .background(.orange)
        }
        .sheet(isPresented: $isShowSheet){
            EditView(isShowSheet: $isShowSheet)
        }
    }
}

struct EditView: View {
    @Binding var isShowSheet: Bool
    var DescriptionVM = EventViewModel()
    @State var typeTitle = ""
    @State var typeDescription = ""
    @State private var HeldDate: Date = Date() // 現在の日付と時刻で初期化

    var body: some View {
        VStack {
            VStack {
                Button (action:{
                    DescriptionVM.addEvent(title: typeTitle, description: typeDescription, customDate: HeldDate)
                    typeTitle = ""
                    typeDescription = ""
                    print("typeTitle after reset: \(typeTitle)")
                    isShowSheet = false
                }) {
                    Text("投稿する")
                }
            }
            TextField("タイトル", text: $typeTitle)
                .textFieldStyle(.roundedBorder)
                .frame(width: 355,height: 40)
                .padding(.all)
            TextEditor(text: $typeDescription)
                .frame(width: 355,height: 380)
                .overlay(
                    RoundedRectangle(cornerRadius: 5) // 角が丸い四角形をオーバーレイとして追加
                        .stroke(.gray, lineWidth: 1) // このオーバーレイに枠線を適用
                )
            DatePicker(
                        "日付と時刻を選択",
                        selection: $HeldDate,
                        displayedComponents: [.date, .hourAndMinute] // 日付と時刻の選択を可能にする
                    )
                    .padding()
        }
    }
}


