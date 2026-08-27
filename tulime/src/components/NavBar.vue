<script setup>
import { useAuth }  from '../services/auth.js'
import { useRouter } from "vue-router";

const router = useRouter();
const { logout } = useAuth()
const isAuthenticated = localStorage.getItem('isAuthenticated') === 'true'
const isAdmin = localStorage.getItem('isAdmin') === 'true'

let user = null
try {
    user = JSON.parse(localStorage.getItem('user') || 'null')
} catch {
    user = null
}
let role = 0
let letter = ''
if(user){
    const firstName = user.firstName || user.firstname || ''
    letter = firstName ? firstName[0] : ''
    role = user.role
}

function logOut(){
    logout()
    router.push('/').then(() => {
        router.go(0)
    });
}


</script>

<template>
    <v-app-bar color = "primary">
        <v-app-bar-title>
            <router-link to="/" class="brand-link">
                <div class="brand-logo-wrap">
                    <v-img src="/tulimeLogo.png.png" class="brand-logo" cover></v-img>
                </div>
                <span class="brand-title">Tulime</span>
            </router-link>
        </v-app-bar-title>

        <v-btn to="/"> Home </v-btn>
        <v-btn to="/product-details"> Product Detail </v-btn>
        <v-btn to="/product"> Product </v-btn>
        <v-btn to="/seller" v-if = "role == 3"> Seller View </v-btn>
        <v-btn to="/admin" v-if = "role == 1"> Admin </v-btn>
        <v-btn icon="mdi-account" v-if="isAuthenticated" variant="tonal">{{letter}}
            
            <v-menu activator="parent">
                <v-list>
                    <v-list-item>
                        <v-btn color="primary" to="/profile">Profile</v-btn>                        
                    </v-list-item>
                    <v-list-item>
                        <v-btn color="primary" @click="()=> { logOut(); }">Logout</v-btn>
                    </v-list-item>
                </v-list>
            </v-menu>
            
        </v-btn>
        <v-btn to ="/login" v-else>Login</v-btn>
    </v-app-bar>
</template>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@700&display=swap');

.brand-link {
  display: inline-flex;
  align-items: center;
  gap: 10px;
  text-decoration: none;
}

.brand-logo-wrap {
  width: 44px;
  height: 44px;
  border-radius: 12px;
  overflow: hidden;
  background: rgba(255, 255, 255, 0.14);
  display: flex;
  align-items: center;
  justify-content: center;
}

.brand-logo {
  width: 100%;
  height: 100%;
  object-fit: contain;
}

.brand-title {
  font-family: 'Cinzel', serif;
  font-size: 1.45rem;
  letter-spacing: 0.05em;
  color: #ffffff;
  line-height: 1;
}

.navbar {
  background-color: #3a7d44;
  padding: 0.75rem 2rem;
}
.navbar-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.navbar-brand {
  display: flex;
  align-items: center;
  gap: 0.5rem;
}
.navbar-logo {
  height: 40px;
  width: auto;
  object-fit: contain;
}
.navbar-brand h1 {
  margin: 0;
  font-size: 1.5rem;
  color: white;
}
.nav-buttons {
  display: flex;
  align-items: center;
  gap: 0.5rem;
}
.nav-btn {
  background: transparent;
  border: none;
  color: white;
  font-size: 0.95rem;
  padding: 0.4rem 0.9rem;
  border-radius: 6px;
  cursor: pointer;
  transition: background 0.2s;
}
.nav-btn:hover {
  background: rgba(255, 255, 255, 0.15);
}
.nav-btn-outline {
  border: 1px solid white;
}
.nav-btn-outline:hover {
  background: rgba(255, 255, 255, 0.2);
}
.nav-btn-solid {
  background: white;
  color: #3a7d44;
  font-weight: 600;
}
.nav-btn-solid:hover {
  background: #f0f0f0;
}
</style>
