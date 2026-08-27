import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../components/homeView.vue'
import Product from '../components/product.vue'
import productDetail from '../components/productDetail.vue'
import productDetails from '../components/productDetails.vue'
import Admin from '../components/Admin.vue'
import login from '../components/login.vue'
import profile from '../components/Profile.vue'
import sellerView from '../components/sellerView.vue'
import signup from '../components/SignUp.vue'




const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/product',
      name: 'product',
      component: Product
    },
    {
      path: '/product/:id',
      name: 'productDetail',
      component: productDetail
    },
    {
      path: '/product-details',
      name: 'productDetails',
      component: productDetails
    },
    {
      path: '/admin',
      name: 'admin',
      component: Admin
    },
    {
      path: '/login',
      name: 'login',
      component: login
    },
    {
      path: '/profile',
      name: 'profile',
      component: profile
    },
    {
      path: '/seller',
      alias: '/sellerView',
      name: 'sellerView',
      component: sellerView
    },
    {
      path: '/signup',
      name: 'signup',
      component: signup
    }
  ],
})

export default router
