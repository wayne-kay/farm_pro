<script setup>
import {ref, computed} from 'vue'
import { useProductsStore } from '../stores/products'
import { useCartStore } from '../stores/cart'
import { useOrdersStore } from '../stores/orders'
import { useRouter } from 'vue-router'

const router = useRouter()
const productsStore = useProductsStore()
const ordersStore = useOrdersStore()
const products= productsStore.products
const isAuthenticated = localStorage.getItem('isAuthenticated')

function view(product){
   productsStore.updateSelectedProduct(product.id) // keep track of the selected item
    router.push(`/product/${product.id}`)
}

//cart
const cartStore = useCartStore()
const cart = cartStore.cart
const cartCount = computed(() => cart.length)
const dialog = ref(false)

const quantity = ref(1)
const total = ref(0)

function addToCart(product){
    if (isAuthenticated) {
        product.quantity = quantity.value
        cartStore.updateCart(product)
    }
    else{
        router.push('/login')
    }
}
function checkout(){
    if (isAuthenticated) {
        ordersStore.checkout(cart)
        console.log('here')
    }
    else{
        router.push('/login')
    }
    
}
function checkoutCart() {
    if (!cartCount.value) {
        return
    }
    dialog.value = true
}
const cartTotal = computed(() => {
  return cart.reduce((sum, item) => {
    const qty = Number(item.quantity || 0)
    const price = Number(item.price || 0)
    return sum + (price * qty)
  }, 0)
})
const handleRemove = (productId) => {
  cartStore.removeCart(productId)
}



</script>

<template>
    <v-container class="page-section">
        <v-row class="mb-6">
            <v-col cols="12" class="text-center">
                <div class="section-title black-heading">
                    Browse products
                </div>
            </v-col>
        </v-row>
        <v-row class="mb-4" justify="end">
            <v-col cols="12" md="4" class="d-flex justify-end">
                <v-fab-transition>
                    <v-btn color="primary" variant="elevated" position="fixed" class="checkout-fab" :disabled="!cartCount" @click="checkoutCart">Checkout</v-btn>
                </v-fab-transition>
            </v-col>
        </v-row>
        <v-row>
            <v-col
                v-for="product in products"
                :key="product.id"
                cols="12"
                sm="6"
                md="4"
                lg="3"
            >
                <v-card class="h-100 d-flex flex-column" rounded="xl" elevation="8">
                    <v-img :src="product.image" height="220" cover />
                    <v-card-title>{{ product.name }}</v-card-title>
                    <v-card-subtitle>{{ product.category }}</v-card-subtitle>
                    <v-card-text>
                        <div class="d-flex align-center justify-space-between">
                            <span class="price-text">Ksh {{ product.price }}</span>
                            <v-chip
                                :color="product.availability ? 'green' : 'red'"
                                size="small"
                                variant="flat"
                            >
                                {{ product.availability ? 'In Stock' : 'Out of Stock' }}
                            </v-chip>
                        </div>
                    </v-card-text>
                    <v-card-actions class="pt-0 mt-auto d-flex ga-2">
                        <v-btn color="secondary" variant="outlined" :disabled="!product.availability" @click="addToCart(product)">Add to Cart</v-btn>
                        <v-btn color="primary" variant="elevated" :disabled="!product.availability" @click="view(product)">View Product</v-btn>
                    </v-card-actions>
                </v-card>
            </v-col>
        </v-row>
    </v-container>

    <!-- Checkout -->
     <v-dialog v-model="dialog" max-width="600">
        <div v-if="cart.length == 0" class="mt-12">
            <v-card>
                <v-row class="mb-12 mt-12">
                    <v-col cols="12" md="10" sm="12" align="center">
                        <div class="text-display-small">
                            Your cart is empty!
                        </div>
                    </v-col>
                    <v-col cols="12" md="2" sm="12" align="right">
                        <v-btn class="ma-2" color="primary" icon="mdi-close" @click="dialog = false"></v-btn>
                    </v-col>
                </v-row>
            </v-card>
        </div>
        <div v-else>
        <v-row>
            <v-col md="12">
                <v-card>
                    <v-row class="ma-4">
                        <v-col cols="12" md="10" sm="12">
                            <v-card-title>Cart</v-card-title>
                        </v-col>
                        <v-col cols="12" md="2" sm="12" align="right">
                            <v-btn color="primary" icon="mdi-close" @click="dialog = false"></v-btn>
                        </v-col>
                    </v-row>
                    <v-row>
                        <v-divider/>
                        <v-expansion-panels :rounded="[20, 8]" gap="8" variant="accordion" class="ma-4" >
                            <v-expansion-panel v-for="(item, index) in cart" :key="item.id" color="secondary">
                                <v-expansion-panel-title expand-icon="mdi-menu-down">{{ item.name }}</v-expansion-panel-title>
                                <v-expansion-panel-text> Price: {{item.price}} </v-expansion-panel-text>
                                <v-expansion-panel-text>
                                    <v-row>
                                    <v-col md="3">
                                        <v-select v-model="cart[index].quantity" :items="[1,2,3,4,5]" label="Qty" density="compact" variant="outlined" hide-details ></v-select>
                                    </v-col>
                                    <v-col>
                                        Subtotal: {{ (item.price * (item.quantity || 0)).toFixed(2)}}
                                    </v-col>
                                     <v-col cols="2" class="text-center">
                                        <v-btn icon="mdi-trash-can-outline" variant="text" color="error" density="comfortable" @click="handleRemove(item.id)" ></v-btn>
                                    </v-col>
                                    </v-row>
                                </v-expansion-panel-text>
                            </v-expansion-panel>
                        </v-expansion-panels>
                    </v-row>
                    <v-card-actions>
                        <div>
                            <span class="mr-2">Total Amount:</span>
                            <span class="text-h5 font-weight-bold text-primary">Ksh {{ cartTotal.toFixed(2) }}</span>
                        </div>
                        <v-spacer/>
                        <v-btn variant="elevated" @click="checkout">Pay via MPesa</v-btn>
                    </v-card-actions>
                </v-card>
            </v-col>
        </v-row>
        </div>
    </v-dialog>
</template>

<style scoped>
.black-heading {
  color: #000;
}

.price-text {
  font-weight: 700;
  color: #2e7d32;
}

.checkout-fab {
  z-index: 9999;
  top: 100px;
  right: 50px;
}
</style>
