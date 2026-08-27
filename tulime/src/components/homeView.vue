<script setup>
</script>

<template>
  <v-container fluid class="page-section">
    <v-sheet class="hero-sheet mx-auto rounded-xl overflow-hidden" color="primary" elevation="12">
      <v-row align="center" class="ma-0">
        <v-col cols="12" lg="6" class="pa-8 pa-md-12 text-white">
          <v-chip color="white" variant="tonal" class="mb-4">Your Trusted Marketplace</v-chip>
          <h1 class="text-h2 font-weight-black mb-4">Shop Everything You Need.</h1>
          <p class="text-body-1 text-white text-medium-emphasis mb-6">
            Discover millions of products from trusted sellers. Shop electronics, fashion, home essentials, and more with fast delivery and secure payments.
          </p>
          <div class="d-flex flex-wrap ga-3">
            <v-btn color="white" class="text-primary" size="large" to="/product">Start Shopping</v-btn>
            <v-btn variant="outlined" color="white" size="large" to="/seller">Become a Seller</v-btn>
          </div>
        </v-col>
        <v-col cols="12" lg="6" class="pa-0">
          <v-carousel cycle hide-delimiters show-arrows="hover" height="420">
            <v-carousel-item src="/carousell1.png.png" cover />
            <v-carousel-item src="/carousell2.png.png" cover />
            <v-carousel-item src="/carousell3,png.png" cover />
            <v-carousel-item src="/carousell4.png.png" cover />
          </v-carousel>
        </v-col>
      </v-row>
    </v-sheet>
  </v-container>

  <v-container class="page-section">
    <v-row class="text-center mb-8">
      <v-col cols="12">
        <div class="section-title black-heading">Why Choose Tulime?</div>
        <p class="section-subtitle mt-4">
          Your one-stop marketplace for quality products at unbeatable prices.
        </p>
      </v-col>
    </v-row>

    <v-row>
      <v-col cols="12" md="4">
        <v-card rounded="xl" elevation="8" class="pa-4 h-100">
          <v-icon icon="mdi-store-search" color="primary" size="40" />
          <v-card-title class="px-0">Huge Selection</v-card-title>
          <v-card-text class="px-0">Browse thousands of products across multiple categories all in one place.</v-card-text>
        </v-card>
      </v-col>
      <v-col cols="12" md="4">
        <v-card rounded="xl" elevation="8" class="pa-4 h-100">
          <v-icon icon="mdi-shield-check" color="primary" size="40" />
          <v-card-title class="px-0">Buyer Protection</v-card-title>
          <v-card-text class="px-0">Shop with confidence with our buyer protection guarantee and secure payment options.</v-card-text>
        </v-card>
      </v-col>
      <v-col cols="12" md="4">
        <v-card rounded="xl" elevation="8" class="pa-4 h-100">
          <v-icon icon="mdi-lightning-bolt" color="primary" size="40" />
          <v-card-title class="px-0">Fast Checkout</v-card-title>
          <v-card-text class="px-0">Quick and easy checkout process with multiple payment methods available.</v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>

  <v-container class="page-section">
    <v-row class="mb-6">
      <v-col cols="12" class="text-center">
        <div class="section-title black-heading">Popular Categories</div>
        <p class="section-subtitle mt-4">Explore our most popular product categories.</p>
      </v-col>
    </v-row>

    <v-row>
      <v-col cols="12" md="6" lg="3">
        <v-card rounded="xl" elevation="10" class="h-100 d-flex flex-column overflow-hidden category-card">
          <v-img src="/avocado.jpg" height="240" cover />
          <v-card-title>Fresh Fruits</v-card-title>
          <v-card-subtitle>Farm-picked fruits every day</v-card-subtitle>
          <v-card-actions class="pa-4 pt-0 mt-auto">
            <v-btn color="primary" variant="elevated" to="/product">Explore</v-btn>
          </v-card-actions>
        </v-card>
      </v-col>
      <v-col cols="12" md="6" lg="3">
        <v-card rounded="xl" elevation="10" class="h-100 d-flex flex-column overflow-hidden category-card">
          <v-img src="/coriander.jpg" height="240" cover />
          <v-card-title>Leafy Greens</v-card-title>
          <v-card-subtitle>Nutritious greens for every meal</v-card-subtitle>
          <v-card-actions class="pa-4 pt-0 mt-auto">
            <v-btn color="primary" variant="elevated" to="/product">Explore</v-btn>
          </v-card-actions>
        </v-card>
      </v-col>
      <v-col cols="12" md="6" lg="3">
        <v-card rounded="xl" elevation="10" class="h-100 d-flex flex-column overflow-hidden category-card">
          <v-img src="/carrot.jpg" height="240" cover />
          <v-card-title>Root Vegetables</v-card-title>
          <v-card-subtitle>Healthy roots for soups and stews</v-card-subtitle>
          <v-card-actions class="pa-4 pt-0 mt-auto">
            <v-btn color="primary" variant="elevated" to="/product">Explore</v-btn>
          </v-card-actions>
        </v-card>
      </v-col>
      <v-col cols="12" md="6" lg="3">
        <v-card rounded="xl" elevation="10" class="h-100 d-flex flex-column overflow-hidden category-card">
          <v-img src="/tomato.jpg" height="240" cover />
          <v-card-title>Kitchen Essentials</v-card-title>
          <v-card-subtitle>Daily staples for home cooking</v-card-subtitle>
          <v-card-actions class="pa-4 pt-0 mt-auto">
            <v-btn color="primary" variant="elevated" to="/product">Explore</v-btn>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </v-container>

  <v-sheet color="primary" class="py-8 mt-8">
    <v-container>
      <v-row align="center">
        <v-col cols="12" md="4" class="text-center text-md-start">
          <router-link to="/" class="d-inline-flex align-center text-decoration-none text-white">
            <strong class="text-h6">Tulime</strong>
          </router-link>
          <p class="text-white mt-2 mb-0">Your trusted online marketplace</p>
        </v-col>
        <v-col cols="12" md="4" class="text-center text-white">
          <div class="mb-3 font-weight-bold">Connect With Us</div>
          <div class="d-flex justify-center ga-2">
            <v-icon icon="mdi-instagram" class="footer-icon" />
            <v-icon icon="mdi-twitter" class="footer-icon" />
            <v-icon icon="mdi-facebook" class="footer-icon" />
          </div>
        </v-col>
        <v-col cols="12" md="4" class="text-center text-white text-md-end">
          <div class="mb-2">
            <strong>Contact Us</strong>
          </div>
          <div>support@tulime.com</div>
          <div>Tel: +254 717 342 789</div>
        </v-col>
      </v-row>
    </v-container>
  </v-sheet>
</template>

<style scoped>
.hero-sheet {
  min-height: 420px;
}

.black-heading {
  color: #000;
}

.category-card {
  transition: transform 0.2s;
}

.category-card:hover {
  transform: translateY(-4px);
}

.footer-icon {
  cursor: pointer;
  transition: all 0.2s;
}

.footer-icon:hover {
  transform: scale(1.2);
}
</style>
