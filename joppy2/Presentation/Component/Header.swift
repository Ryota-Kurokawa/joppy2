import SwiftUI

struct Header: View {
    var body: some View {
        ZStack {
            Color.orange
                .edgesIgnoringSafeArea(.top)
            
            Text("Joppy")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
            .previewLayout(.fixed(width: 300, height: 100))
    }
}

