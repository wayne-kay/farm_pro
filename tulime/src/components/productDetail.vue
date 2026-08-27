<script setup>
import { computed, ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useProductsStore } from '../stores/products'
import { useCartStore } from '../stores/cart'

const route = useRoute()
const router = useRouter()
const productsStore = useProductsStore()
const cartStore = useCartStore()
const quantity = ref(1)

const fallbackImage = '/book1.png.png'
const productId = computed(() => Number(route.params.id))
const product = computed(() =>
  Object.values(productsStore.products).find((item) => item.id === productId.value) || null
)

const productImage = computed(() => {
  if (!product.value?.image) {
    return fallbackImage
  }
  return `/${product.value.image}`
})

function addToCart(item) {
  if (!item) {
    return
  }
  cartStore.updateCart({ ...item, quantity: quantity.value })
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
        <div class="section-title">Product details</div>
      </v-col>
    </v-row>

    <v-card v-if="product" rounded="xl" elevation="12" class="overflow-hidden">
      <v-row no-gutters>
        <v-col cols="12" md="5">
          <v-img class="h-100" :src="productImage" min-height="520" cover />
        </v-col>
        <v-col cols="12" md="7">
          <v-card class="pa-4 pa-md-8 h-100" color="white" flat>
            <v-chip class="mb-4" color="primary" variant="tonal">{{ product.category }}</v-chip>
            <v-card-title class="text-h4 px-0">{{ product.name }}</v-card-title>
            <v-card-subtitle class="px-0 mb-3">Fresh from the farm</v-card-subtitle>

            <div class="d-flex align-center ga-3 mb-4">
              <v-rating model-value="5" :size="22" readonly />
              <v-chip :color="product.availability ? 'green' : 'red'" variant="tonal">
                {{ product.availability ? 'In stock' : 'Out of stock' }}
              </v-chip>
            </div>

            <v-card-text class="px-0 text-body-1">
              {{ product.long_description }}
            </v-card-text>

            <v-divider class="my-6" />

            <v-row align="center">
              <v-col cols="12" sm="6">
                <div class="text-subtitle-2 mb-2">Quantity</div>
                <v-number-input
                  v-model="quantity"
                  control-variant="split"
                  density="comfortable"
                  :min="1"
                  :max="10"
                />
              </v-col>
              <v-col cols="12" sm="6" class="text-sm-end">
                <div class="text-overline">Price</div>
                <div class="text-h5 font-weight-bold">Ksh {{ product.price }}</div>
              </v-col>
            </v-row>

            <v-card-actions class="px-0 pt-6 flex-wrap ga-2">
              <v-btn
                color="primary"
                variant="elevated"
                :disabled="!product.availability"
                @click="addToCart(product)"
              >
                Add to Cart
              </v-btn>
              <v-btn variant="outlined" color="primary" @click="goBack">Back to products</v-btn>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>
    </v-card>

    <v-row v-else>
      <v-col cols="12">
        <v-alert type="error" variant="tonal">
          Product not found. Please go back and choose a valid item.
        </v-alert>
      </v-col>
    </v-row>
  </v-container>
</template>