/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyenps.cart;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class Cart implements Serializable{
    private Map<String, Integer> items;

    public Map<String, Integer> getItems() {
        return items;
    }
    
    public void addItemToCart(String title, int quantityInput) {
        //1. kiem tra ngan ton tai hay chua
        if(this.items == null) {
            this.items = new  HashMap<>();
        } // end if item not exits
        //2. kiem tra co chau do chua
        int quantity = quantityInput;
        if(this.items.containsKey(title)) {
            quantity = this.items.get(title) + quantityInput;
        }// end if item is exits
        this.items.put(title, quantity);
    }
    
    public void removeItemFromCart(String title) {
        if(this.items == null) {
            return;
        }
        
        if(this.items.containsKey(title)) {
            this.items.remove(title);
            if(this.items.isEmpty()) {
                this.items = null;
            }
        }
    }
}
