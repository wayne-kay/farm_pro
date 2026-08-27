import { ref, computed } from 'vue'
import { defineStore } from 'pinia'

export const useOrdersStore = defineStore('orders',  {
   state: () => {
        const orders= {

            0:{
                id: 1,
                customerId: 1,
                productId: 1,
                quantity: 7,
                total: 14000,
                status: "pending",
                date: "2023-08-01",
            },

            1:{
                id: 2,
                customerId: 2,
                productId: 2,
                quantity: 4,
                total: 10000,
                status: "pending",
                date: "2023-08-02",
            },  

            2:{
                id: 3,
                customerId: 3,
                productId: 3,
                quantity: 4,
                total: 10000,
                status: "pending",
                date: "2023-08-03",
            },

            3:{
                id: 4,
                customerId: 4,
                productId: 4,
                quantity: 4,
                total: 10000,
                status: "pending",
                date: "2023-08-04",
            }


        }

        return{
            orders
        }
   },
   actions:{
      addToOrder(payload) {
          this.updateOrder(payload)
      },
      updateOrder(payload) {
           const newId = Object.keys(this.orders).length;
           this.orders[newId] = payload;
           console.log(this.orders)
            
       },
      completeOrder(orderId) {
           const order = Object.values(this.orders).find((item) => item.id === orderId)
           if (order) {
                order.status = 'fulfilled'
           }
       },
   },
   persist: true,
})