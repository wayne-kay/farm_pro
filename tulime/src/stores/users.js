import { ref, computed } from 'vue'
import { defineStore } from 'pinia'

export const useUsersStore = defineStore('users',  {
   state: () => {
        const users= {
            0:{
                id: 1,
                firstname: "Kyalo",
                lastname: "Wayne",
                email: "kyalo.wayne@gmail.com",
                phone: "0712345678",
                location: "Nairobi",
                address: "123 Main St, Nairobi",

            },

            1:{
                id: 2,
                firstname: "John",
                lastname: "Doe",
                email: "john.doe@gmail.com",
                phone: "0712345679",
                location: "Nairobi",
                address: "124 Main St, Nairobi",
            },

            2:{
                id: 3,
                firstname: "Jane",
                lastname: "Doe",
                email: "jane.doe@gmail.com",
                phone: "0712345680",
                location: "Nairobi",
                address: "125 Main St, Nairobi",
            },

            3:{
                id: 4,
                firstname: "Alice",
                lastname: "Smith",
                email: "alice.smith@gmail.com",
                phone: "0712345681",
                location: "Nairobi",
                address: "126 Main St, Nairobi",
            },
            4:{
                id: 5,
                firstname: "Bob",
                lastname: "Johnson",
                email: "bob.johnson@gmail.com",
                phone: "0712345682",
                location: "Nairobi",
                address: "127 Main St, Nairobi",
            },
            5:{
                id: 6,
                firstname: "Charlie",
                lastname: "Brown",
                email: "charlie.brown@gmail.com",
                phone: "0712345683",
                location: "Nairobi",
                address: "128 Main St, Nairobi",
            },
            6:{
                id: 7,
                firstname: "David",
                lastname: "Wilson",
                email: "david.wilson@gmail.com",
                phone: "0712345684",
                location: "Nairobi",
                address: "129 Main St, Nairobi",
            },
            7:{
                id: 8,
                firstname: "Eve",
                lastname: "Davis",
                email: "eve.davis@gmail.com",
                phone: "0712345685",
                location: "Nairobi",
                address: "130 Main St, Nairobi",
            },
            8:{
                id: 9,
                firstname: "Frank",
                lastname: "Miller",
                email: "frank.miller@gmail.com",
                phone: "0712345686",
                location: "Nairobi",
                address: "131 Main St, Nairobi",
            }

        }

        return{
            users
        }
   }
   
})