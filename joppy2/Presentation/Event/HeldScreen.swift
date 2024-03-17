
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
    @State private var keyboardHeight: CGFloat = 0 // キーボードの高さを保持する状態
    @FocusState private var isEditControll: Bool


    var body: some View {
        VStack {
                Button (action:{
                    DescriptionVM.addEvent(title: typeTitle, description: typeDescription, customDate: HeldDate)
                    typeTitle = ""
                    typeDescription = ""
                    print("typeTitle after reset: \(typeTitle)")
                    isShowSheet = false
                }) {
                    Text("投稿する")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
                .frame(width: 120, height: 60)
                                    .background(Color.orange)
                                    .cornerRadius(30.0)
            DatePicker(
                        "日付と時刻を選択",
                        selection: $HeldDate,
                        displayedComponents: [.date, .hourAndMinute] // 日付と時刻の選択を可能にする
                    )
                    .padding()
            TextField("タイトル", text: $typeTitle)
                .focused($isEditControll)
                .onTapGesture {
                    isEditControll = false
                }
                .textFieldStyle(.roundedBorder)
                .frame(width: 355,height: 40)
                .padding(.all)

            TextEditor(text: $typeDescription)
                .focused($isEditControll)
                .onTapGesture {
                    isEditControll = false//フォーカス解除
                }
                .frame(width: 355,height: 285)
                .overlay(
                    RoundedRectangle(cornerRadius: 5) // 角が丸い四角形をオーバーレイとして追加
                        .stroke(Color.gray, lineWidth: 1) // このオーバーレイに枠線を適用
                )
                .padding(.bottom,20)


        }
        .padding(.all)
//        .offset(x: 0, y: keyboardHeight / 2) // キーボードの高さに応じてオフセット調整
//        .onAppear {
//                    self.registerKeyboardNotifications()
//                }
//                .onDisappear {
//                    NotificationCenter.default.removeObserver(self)
//                }
    }
//    // キーボードの表示・非表示を監視するためのメソッド
//       private func registerKeyboardNotifications() {
//           NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
//               guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
//               self.keyboardHeight = keyboardFrame.height
//           }
//
//           NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
//               self.keyboardHeight = 0
//           }
//       }
}


#Preview {
    EditButton(isShowSheet: .constant(true))
}
