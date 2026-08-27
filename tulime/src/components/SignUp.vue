<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useAuth } from '../services/auth.js'

const router = useRouter()
const { signup } = useAuth()

const showPassword = ref(false)
const password = ref(null)

const confirmPassword = ref(null)
const showConfirm = ref(false)
const rules = {
    required: value => !!value || 'Required.',
    min: v => String(v || '').length >= 8 || 'Min 8 characters',
    passwordMatch: () => password.value === confirmPassword.value || 'Passwords must match'
}

const firstName = ref(null)
const lastName = ref(null)
const email = ref(null)
const phoneNumber = ref(null)
const location = ref(null)
const address = ref(null)

function registerUser() {
    const userData = {
        firstName: firstName.value,
        lastName: lastName.value,
        email: email.value,
        phoneNumber: phoneNumber.value,
        location: location.value,
        address: address.value,
        password: password.value,
        role: 2,
    }

    signup(userData)
    router.push('/').then(() => {
        router.go(0)
    })

    try {
        localStorage.setItem("userData", JSON.stringify(userData))
    } catch (error) {
        console.error("Error saving user data:", error)
    }
}
</script>

<template>
  <v-container class="py-12">
    <v-row justify="center">
      <v-col cols="12" sm="10" md="6" lg="5">
        <div class="mb-8 text-center">
          <h1 class="text-h4 font-weight-bold mb-2 text">Create Your Account</h1>
          <p class="text-subtitle-1 text-grey-darken-1">Join Tulime Hub and start exploring today</p>
        </div>

        <v-card rounded="lg" elevation="6" style="border-top: 4px solid #2f6ad0;">
          <v-card-text class="pa-8">
            <v-form>
              <v-row>
                <v-col cols="12" sm="6">
                  <v-text-field
                    v-model="firstName"
                    label="First Name"
                    variant="outlined"
                    density="comfortable"
                    prepend-inner-icon="mdi-account-outline"
                  ></v-text-field>
                </v-col>
                <v-col cols="12" sm="6">
                  <v-text-field
                    v-model="lastName"
                    label="Last Name"
                    variant="outlined"
                    density="comfortable"
                    prepend-inner-icon="mdi-account-outline"
                  ></v-text-field>
                </v-col>
              </v-row>

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
                <v-col cols="12" sm="6">
                  <v-text-field
                    v-model="phoneNumber"
                    label="Phone Number"
                    type="number"
                    variant="outlined"
                    density="comfortable"
                    prepend-inner-icon="mdi-phone-outline"
                  ></v-text-field>
                </v-col>
              </v-row>

              <v-row>
                <v-col cols="12" sm="6">
                  <v-select
                    v-model="location"
                    label="Location"
                    :items="['Mombasa', 'Nairobi', 'Kisumu', 'Eldoret', 'Thika', 'Naivasha', 'Machakos']"
                    variant="outlined"
                    density="comfortable"
                    prepend-inner-icon="mdi-map-marker-outline"
                  ></v-select>
                </v-col>
                <v-col cols="12" sm="6">
                  <v-text-field
                    v-model="address"
                    label="Address"
                    variant="outlined"
                    density="comfortable"
                    prepend-inner-icon="mdi-home-outline"
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
                <v-col cols="12" sm="6">
                  <v-text-field
                    v-model="confirmPassword"
                    label="Confirm Password"
                    :append-inner-icon="showConfirm ? 'mdi-eye' : 'mdi-eye-off'"
                    :rules="[rules.required, rules.passwordMatch]"
                    :type="showConfirm ? 'text' : 'password'"
                    variant="outlined"
                    density="comfortable"
                    prepend-inner-icon="mdi-lock-check-outline"
                    @click:append-inner="showConfirm = !showConfirm"
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
                    @click="registerUser()"
                  >
                    Create Account
                  </v-btn>
                </v-col>
              </v-row>

              <v-row class="mt-2">
                <v-col cols="12" class="text-center">
                  <span class="text-body-2 text-grey-darken-1">
                    Already have an account?
                    <router-link to="/login" class="font-weight-bold text-primary" style="text-decoration: none;">
                      Sign In
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