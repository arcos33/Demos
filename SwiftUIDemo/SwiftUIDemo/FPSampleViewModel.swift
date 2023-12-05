//
//  FPSampleViewModel.swift
//  SwiftUIDemo
//
//  Created by Joal Arcos on 9/29/23.
//

import Foundation

struct ShoppingCart {
    
}

struct BuyButton {
    let item: Item

    func showShowFreeShippingIcon() {
        print("showing Image")
    }
}

struct Item {
    let price: Double
}

class FPSampleViewModel: ObservableObject {
    var shoppingCartTotal: Double = 0.0
    
    func getBuyButtonsDOM() -> [BuyButton] {
        [BuyButton(item: Item(price: 2.0))]
    }

    func updateShippingIcons() {
        let buyButtons = getBuyButtonsDOM()
        foo(buyButtons: buyButtons)
    }

    func foo(buyButtons: [BuyButton]) {
        for buyButton in buyButtons {
            let item = buyButton.item
            if compare(itemPrice: item.price, total: shoppingCartTotal) {
                buyButton.showShowFreeShippingIcon()
            }
        }
    }

    func compare(itemPrice: Double, total: Double) -> Bool {
        if itemPrice + total >= 20.0 {
            true
        } else {
            false
        }
    }
}

/*
 “function update_shipping_icons() {

       var buy_buttons = get_buy_buttons_dom();

       for(var i = 0; i < buy_buttons.length; i++) {

       var button = buy_buttons[i];

       var item = button.item;

       if(item.price + shopping_cart_total >= 20 ) ❶

       button.show_free_shipping_icon();

       else

       button.hide_free_shipping_icon();

       }

       }”

 Excerpt From
 Grokking Simplicity
 Eric Normand
 https://books.apple.com/us/book/grokking-simplicity/id1572387907
 This material may be protected by copyright.
 */
