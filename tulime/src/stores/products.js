import { defineStore } from 'pinia'

export const useProductsStore = defineStore('products',  {
   state: () => {
        const selectedProduct = null
        const cartItems = []
        const products= {
            0:{
                id: 1,
                name: "Tomato",
                category: "Fruit",
                price: 200,
                availability: true,
                image: 'tomato.jpg',
                long_description: "Hello there, I'm Tomato, your juicy little kitchen star. I come loaded with vitamin C, potassium, folate, and lycopene to support your immunity, heart, and skin. I am low in calories, rich in antioxidants, and always ready to make your meals colorful and delicious."
            },
            1:{
                id: 2,
                name: "Potato",
                category: "Vegetable",
                price: 150,
                availability: true,
                image: 'potato.jpg',
                long_description: "Hello there, I'm Potato, your cozy comfort-food buddy. I bring complex carbs, vitamin B6, vitamin C, and potassium to keep your energy steady and your muscles happy. I also add satisfying fiber, so you feel full and fueled for longer."
            },
            2:{
                id: 3,
                name: "Onion",
                category: "Vegetable",
                price: 120,
                availability: true,
                image: 'onions.jpg',
                long_description: "Hello there, I'm Onion, the flavor hero in your pan. I carry antioxidants like quercetin to help fight inflammation, plus vitamin C and prebiotic fiber for gut and immune support. I make your food taste amazing while quietly boosting your wellness."
            },
            3:{
                id: 4,
                name: "Apple",
                category: "Fruit",
                price: 300,
                availability: true,
                image: 'apple.jpg',
                long_description: "Hello there, I'm Apple, crisp, sweet, and ready to crunch. I bring fiber, vitamin C, and heart-loving polyphenols to your day. When you enjoy me whole, I help with digestion and support steady blood sugar in a naturally tasty way."
            },
            4:{
                id: 5,
                name: "Banana",
                category: "Fruit",
                price: 180,
                availability: false,
                image: 'banana.jpg',
                long_description: "Hello there, I'm Banana, your grab-and-go energy friend. I deliver potassium, vitamin B6, and vitamin C with naturally sweet fuel for busy moments. I am gentle on your stomach, and my fiber helps keep digestion smooth and energy balanced."
            },
            5:{
                id: 6,
                name: "Carrot",
                category: "Vegetable",
                price: 140,
                availability: true,
                image: 'carrot.jpg',
                long_description: "Hello there, I'm Carrot, the crunchy orange cheerleader on your plate. I am packed with beta-carotene that turns into vitamin A for healthy eyes and glowing skin. I also bring fiber and antioxidants, plus a sweet crunch that makes healthy eating fun."
            },
            6:{
                id: 7,
                name: "Cabbage",
                category: "Vegetable",
                price: 220,
                availability: true,
                image: 'cabbage.jpg',
                long_description: "Hello there, I'm Cabbage, humble but super helpful. I offer vitamin K, vitamin C, and folate to support strong bones and a happy immune system. I am also full of fiber and plant compounds that keep your digestion and gut health on track."
            },
            7:{
                id: 8,
                name: "Mango",
                category: "Fruit",
                price: 450,
                availability: false,
                image: 'mango.jpg',
                long_description: "Hello there, I'm Mango, your tropical sunshine in fruit form. I bring vitamin C, vitamin A, and folate to support immunity and radiant skin. I also carry antioxidants and natural enzymes that can help digestion feel easier and lighter."
            },
            8:{
                id: 9,
                name: "Orange",
                category: "Fruit",
                price: 260,
                availability: true,
                image: 'orange.jpg',
                long_description: "Hello there, I'm Orange, bright, zesty, and full of goodness. I am famous for vitamin C to support immunity and collagen production for healthy skin. I also offer hydration, fiber, and antioxidants to keep you feeling fresh and energized."
            },
            9:{
                id: 10,
                name: "Pineapple",
                category: "Fruit",
                price: 500,
                availability: true,
                image: 'pineapple.jpg',
                long_description: "Hello there, I'm Pineapple, sweet, tangy, and always party-ready. I bring vitamin C, manganese, and bromelain, an enzyme known to support digestion. I am refreshing, antioxidant-rich, and great for adding a tropical boost to your day."
            },
            10:{
                id: 11,
                name: "Spinach",
                category: "Vegetable",
                price: 130,
                availability: true,
                image: 'spinach.jpg',
                long_description: "Hello there, I'm Spinach, your leafy green powerhouse. I supply iron, folate, vitamin K, and magnesium to support blood health and strong bones. I also bring antioxidants like lutein to help protect your eyes and keep your body thriving."
            },
            11:{
                id: 12,
                name: "Broccoli",
                category: "Vegetable",
                price: 280,
                availability: false,
                image: 'broccoli.jpg',
                long_description: "Hello there, I'm Broccoli, your tiny tree with big benefits. I provide fiber, vitamin C, vitamin K, and folate to support immunity and bone strength. I also contain sulforaphane, a natural plant compound that helps your body with detox support."
            },
            12:{
                id: 13,
                name: "Cucumber",
                category: "Vegetable",
                price: 160,
                availability: true,
                image: 'cucumber.jpg',
                long_description: "Hello there, I'm Cucumber, cool, crisp, and super refreshing. I am high in water, plus vitamin K and gentle minerals to help hydration and balance. I keep meals light and fresh while supporting your skin and digestion."
            },
            13:{
                id: 14,
                name: "Watermelon",
                category: "Fruit",
                price: 600,
                availability: true,
                image: 'watermelon.jpg',
                long_description: "Hello there, I'm Watermelon, your summertime hydration champion. I bring plenty of water, vitamin C, vitamin A, and lycopene to support heart and skin health. I am naturally sweet, low in calories, and perfect for cooling you down."
            },
            14:{
                id: 15,
                name: "Green Pepper",
                category: "Vegetable",
                price: 210,
                availability: true,
                image: 'green-pepper.jpg',
                long_description: "Hello there, I'm Green Pepper, crunchy, lively, and full of bite. I am packed with vitamin C, vitamin B6, and antioxidants to support immunity and metabolism. I add fresh flavor to meals while helping your body fight oxidative stress."
            },
            15:{
                id: 16,
                name: "Avocado",
                category: "Fruit",
                price: 190,
                availability: true,
                image: 'avocado.jpg',
                long_description: "Hello there, I'm Avocado, creamy, dreamy, and seriously nourishing. I bring healthy monounsaturated fats, potassium, folate, and vitamin E to support your heart and brain. I am also rich in fiber, so I help keep digestion smooth and you feeling satisfied."
            },
            16:{
                id: 17,
                name: "Coriander",
                category: "Vegetable",
                price: 90,
                availability: true,
                image: 'coriander.jpg',
                long_description: "Hello there, I'm Coriander, the fresh finishing touch your food loves. I add bright flavor along with vitamin K, vitamin C, and antioxidants for everyday wellness. I can support digestion and make healthy meals taste exciting, vibrant, and new."
            }
        }
        
        return{
            products, selectedProduct, cartItems
        }
   },
   actions:{
        updateSelectedProduct(productId){
            this.selectedProduct = Object.values(this.products).find(
                (product) => product.id === productId
            ) || null
        },
        addToCart(product){
            if (!product || !product.id) {
                return
            }

            const existingItem = this.cartItems.find((item) => item.id === product.id)
            if (existingItem) {
                existingItem.quantity += 1
                return
            }

            this.cartItems.push({
                ...product,
                quantity: 1
            })
        },
        clearCart(){
            this.cartItems = []
        }
   },
   persist: true,
})