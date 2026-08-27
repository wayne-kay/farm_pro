import { ref, computed } from 'vue'
import { defineStore } from 'pinia'

export const useCartStore = defineStore('cart',  {
   state: () => {
        const cart= ref([])

    function removeCart(payload) {
        const targetId = typeof payload === 'object' ? payload.id : payload
        const existingItem = cart.value.findIndex(item => item.id === targetId)
        if (existingItem !== -1) {
            cart.value.splice(existingItem, 1)
        }
    }
    return{
            cart, removeCart
        }
   },

   actions:{
    addToCart(payload) {
          this.updateCart(payload)
      },
    updateCart(payload) {
           const quantity = payload.quantity ?? 1
           const existing = this.cart.find(item => item.id === payload.id)

        if (existing) {
               existing.quantity += quantity
            }
        else {
               this.cart.push({ ...payload, quantity })
            }
       },
   },
   persist: true,
})