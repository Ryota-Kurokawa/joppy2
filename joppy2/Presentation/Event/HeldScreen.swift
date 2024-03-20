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
            Image(systemName: "pencil")
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
        .frame(width: 60,height: 60)
        .background(Color.customRedColor)
        .cornerRadius(30.0)
        .shadow(color: .gray, radius: 3, x: 3, y: 3)
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
    @State private var keyboardHeight: CGFloat = 0 // キーボードの高さを保持する状態
    @FocusState private var isFocused: Bool


    var body: some View {
        ZStack {
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture {
                    // テキストフィールドからフォーカスを外す
                    isFocused = false
                }
            VStack {
                Button (action:{
                    DescriptionVM.addEvent(title: typeTitle, description: typeDescription, customDate: HeldDate)
                    typeTitle = ""
                    typeDescription = ""
                    print("typeTitle after reset: \(typeTitle)")
                    isShowSheet = false
                }) {
                    Text("投稿する")
                        .fontWeight(.semibold)
                        .font(.custom("Helvetica", size: 20))
                        .padding()
                        .foregroundColor(.white)
                }
                .frame(width: 140,height: 70)
                .background(Color.customRedColor)
                .cornerRadius(15.0)
                DatePicker(
                    "日付と時刻を選択",
                    selection: $HeldDate,
                    displayedComponents: [.date, .hourAndMinute] // 日付と時刻の選択を可能にする
                )
                .padding()
                TextField("タイトル", text: $typeTitle)
                    .focused($isFocused)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 355,height: 40)
                    .padding(.all)
                TextEditor(text: $typeDescription)
                    .focused($isFocused)
                    .frame(width: 355,height: 285)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5) // 角が丸い四角形をオーバーレイとして追加
                            .stroke(Color.gray, lineWidth: 1) // このオーバーレイに枠線を適用
                    )
                    .padding(.bottom,20)
            }
            .padding(.all)
        }
    }
}


#Preview {
    EditButton(isShowSheet: .constant(true))
}
