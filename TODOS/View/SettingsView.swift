//
//  SettingsView.swift
//  TODOS
//
//  Created by Phoon Thet Pine on 30/10/23.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    
    private let alternateAppIcons: [String] = [
        "Blue Dark",
        "Blue Light",
        "Blue",
        "Green Dark",
        "Green Light",
        "Green",
        "Pink Dark",
        "Pink Light",
        "Pink"
    ]
    
    // MARK: - BODY

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                // MARK: - FORM
                
                
                Form {
                    // MARK: - SECTION 1
                    Section(header: Text("Choose the app icon")) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(alternateAppIcons.indices, id: \.self) { item in
                                    Button(action: {
                                        print("Icon was press")
                                        
                                        UIApplication.shared.setAlternateIconName(self.alternateAppIcons[item]) {
                                            error in if error != nil {
                                                print("Failed request to update the app's icon")
                                            } else {
                                                print("Sucess!")
                                            }
                                        }
                                    }, label: {
                                        Image("\(alternateAppIcons[item])")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 40, height: 40)
                                            .cornerRadius(16)
                                    })
                                    .buttonStyle(.borderless)
                                }
                            }
                        }
                    }
                    .padding(.vertical, 3)
                    
                    // MARK: - SECTION 3
                    
                    Section(header: Text("Follow us on social media")) {
                        FormRowLinkView(icon: "globe", color: Color.pink, text: "Website", link: "https://github.com/Thet9354")
                        
                        FormRowLinkView(icon: "link", color: Color.blue, text: "Twitter", link: "https://twitter.com/Slim_Shady_Fred")
                        
                        FormRowLinkView(icon: "play.rectangle", color: Color.green, text: "Medium", link: "https://medium.com/@thetpine254")

                    } //: SECTION 3
                    .padding(.vertical, 3)
                    
                    // MARKL - SECTION 4
                    
                    Section(header: Text("About the application")) {
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "TODOS")
                        
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone, iPad")

                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Frederick")

                        FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Thet Pine")
                        
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.0")


                    } //: SECTION 4
                } //: FORM
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
                // MARK: - FOOTER
                
                Text("Copyright @ All rights reserved.\nBetter Apps ♡ Less Code")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundColor(Color.secondary)
            } //: VSTACK
            .navigationBarItems(trailing: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark")
                }
            )
            .navigationBarTitle("Settings", displayMode: .inline)
            .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

#Preview {
    SettingsView()
}
