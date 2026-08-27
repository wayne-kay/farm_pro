<script setup>
import { reactive, computed } from 'vue'
import { useProductsStore } from '../stores/products'
import { useCartStore } from '../stores/cart'
import { useRouter } from 'vue-router'

const router = useRouter()
const productsStore = useProductsStore()
const cartStore = useCartStore()
const quantities = reactive({})

const products = computed(() => Object.values(productsStore.products))

function getQuantity(productId) {
  const qty = Number(quantities[productId] || 1)
  return qty < 1 ? 1 : qty
}

function setQuantity(productId, value) {
  const qty = Number(value)
  quantities[productId] = Number.isFinite(qty) && qty > 0 ? qty : 1
}

function addToCart(product) {
  cartStore.updateCart({ ...product, quantity: getQuantity(product.id) })
}

function goBack() {
  router.push('/product')
}
</script>

<template>
  <v-container class="page-section" max-width="1200">
    <v-row class="mb-6" align="center">
      <v-col cols="12" md="2">
        <v-btn icon="mdi-arrow-left" color="primary" variant="tonal" @click="goBack" />
      </v-col>
      <v-col cols="12" md="8" class="text-center">
        <div class="section-title">All product details</div>
      </v-col>
    </v-row>

    <v-row>
      <v-col v-for="product in products" :key="product.id" cols="12">
        <v-card rounded="xl" elevation="10" class="overflow-hidden mb-4">
          <v-row no-gutters>
            <v-col cols="12" md="4">
              <v-img :src="`/${product.image}`" min-height="280" cover />
            </v-col>
            <v-col cols="12" md="8">
              <v-card class="pa-4 pa-md-6 h-100" flat>
                <v-chip class="mb-3" color="primary" variant="tonal">{{ product.category }}</v-chip>
                <v-card-title class="text-h5 px-0">{{ product.name }}</v-card-title>

                <div class="d-flex align-center ga-3 mb-3">
                  <v-rating model-value="5" :size="20" readonly />
                  <v-chip :color="product.availability ? 'green' : 'red'" variant="tonal">
                    {{ product.availability ? 'In stock' : 'Out of stock' }}
                  </v-chip>
                </div>

                <v-card-text class="px-0 text-body-1">
                  {{ product.long_description }}
                </v-card-text>

                <v-row align="center" class="mt-2">
                  <v-col cols="12" sm="4">
                    <v-number-input
                      :model-value="getQuantity(product.id)"
                      @update:model-value="setQuantity(product.id, $event)"
                      control-variant="split"
                      density="comfortable"
                      :min="1"
                      :max="10"
                    />
                  </v-col>
                  <v-col cols="12" sm="4">
                    <div class="text-overline">Price</div>
                    <div class="text-h6 font-weight-bold">Ksh {{ product.price }}</div>
                  </v-col>
                  <v-col cols="12" sm="4" class="text-sm-end">
                    <v-btn
                      color="primary"
                      variant="elevated"
                      :disabled="!product.availability"
                      @click="addToCart(product)"
                    >
                      Add to Cart
                    </v-btn>
                  </v-col>
                </v-row>
              </v-card>
            </v-col>
          </v-row>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>
