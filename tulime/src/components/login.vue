<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useAuth } from '../services/auth.js'

const router = useRouter()
const { checkCredentials } = useAuth()

const showPassword = ref(false)

const rules = {
    required: value => !!value || 'Required.',
    min: v => String(v || '').length >= 8 || 'Min 8 characters',
}

const email = ref(null)
const password = ref(null)
const errorMessage = ref('')

async function loginUser() {
    errorMessage.value = ''

    const userData = {
        email: email.value,
        password: password.value,
    }

    try {
        await checkCredentials(userData)
        localStorage.setItem("userData", JSON.stringify(userData))
        await router.push('/').then(() => {
            router.go(0)
        })
    } catch (error) {
        errorMessage.value = error?.message || 'Login failed. Please try again.'
        console.error("Error logging in:", error)
    }
}
</script>

<template>
  <v-container class="py-12">
    <v-row justify="center">
      <v-col cols="12" sm="10" md="7" lg="6">
        <div class="mb-8 text-center">
          <v-avatar size="80" class="mb-4" color="white" elevation="4">
            <v-img src="/tulimeLogo.png.png" cover />
          </v-avatar>
          <h1 class="text-h4 font-weight-bold mb-2">Create Your Account</h1>
          <p class="text-subtitle-1 text-grey-darken-1">Join Tulime Hub and start exploring today</p>
        </div>

        <v-card rounded="lg" elevation="6" style="border-top: 4px solid #2f6ad0;">
          <v-card-text class="pa-8">
            <v-form>
              <v-alert
                v-if="errorMessage"
                type="error"
                variant="tonal"
                class="mb-4"
              >
                {{ errorMessage }}
              </v-alert>

              <v-row>
                <v-col cols="12" sm="6">
                  <v-text-field
                    v-model="email"
                    label="Email Address"
                    type="email"
                    variant="outlined"
                    density="comfortable"
                    prepend-inner-icon="mdi-email-outline"
                  ></v-text-field>
                </v-col>
            </v-row>

              <v-row>
                <v-col cols="12" sm="6">
                  <v-text-field
                    v-model="password"
                    label="Password"
                    :append-inner-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
                    :rules="[rules.required, rules.min]"
                    :type="showPassword ? 'text' : 'password'"
                    variant="outlined"
                    density="comfortable"
                    prepend-inner-icon="mdi-lock-outline"
                    @click:append-inner="showPassword = !showPassword"
                  ></v-text-field>
                </v-col>
              </v-row>

              <v-row class="mt-2">
                <v-col cols="12">
                  <v-btn
                    color="primary"
                    variant="elevated"
                    size="large"
                    class="w-100"
                    style="font-weight: 600; text-transform: none; font-size: 16px;"
                    @click="loginUser()"
                  >
                    Log in
                  </v-btn>
                </v-col>
              </v-row>

              <v-row class="mt-2">
                <v-col cols="12" class="text-center">
                  <span class="text-body-2 text-grey-darken-1">
                    New to Tulime Hub?
                    <router-link to="/signup" class="font-weight-bold text-primary" style="text-decoration: none;">
                      Sign up
                    </router-link>
                  </span>
                </v-col>
              </v-row>
            </v-form>
          </v-card-text>
        </v-card>

        <p class="text-caption text-center text-grey mt-6">
          By signing up, you agree to our Terms of Service and Privacy Policy
        </p>
      </v-col>
    </v-row>
  </v-container>
</template>
