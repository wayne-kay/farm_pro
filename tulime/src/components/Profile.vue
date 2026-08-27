<script setup>
let user = null
try {
  user = JSON.parse(localStorage.getItem('user') || 'null')
} catch {
  user = null
}
</script>

<template>
  <v-container class="py-10">
    <v-row justify="center">
      <v-col cols="12" md="10" lg="8">
        <v-card rounded="xl" elevation="8" class="overflow-hidden">
          <v-sheet color="primary" class="pa-6 text-white">
            <div class="d-flex align-center ga-4">
              <v-avatar size="64" color="white" class="text-primary">
                <span class="text-h5 font-weight-bold">
                  {{ user?.firstName ? user.firstName[0] : 'U' }}
                </span>
              </v-avatar>
              <div>
                <h1 class="text-h4 font-weight-bold mb-1">My Profile</h1>
                <p class="ma-0 text-white text-medium-emphasis">Manage your account details</p>
              </div>
            </div>
          </v-sheet>

          <v-card-text class="pa-6">
            <template v-if="user">
              <v-row>
                <v-col cols="12" md="6">
                  <div class="label-text">Full Name</div>
                  <div class="value-text">{{ user.firstName }} {{ user.lastName }}</div>
                </v-col>
                <v-col cols="12" md="6">
                  <div class="label-text">Email</div>
                  <div class="value-text">{{ user.email }}</div>
                </v-col>
                <v-col cols="12" md="6">
                  <div class="label-text">Phone Number</div>
                  <div class="value-text">{{ user.phoneNumber || '-' }}</div>
                </v-col>
                <v-col cols="12" md="6">
                  <div class="label-text">Location</div>
                  <div class="value-text">{{ user.location || '-' }}</div>
                </v-col>
                <v-col cols="12">
                  <div class="label-text">Address</div>
                  <div class="value-text">{{ user.address || '-' }}</div>
                </v-col>
              </v-row>
            </template>

            <v-alert v-else type="info" variant="tonal">
              No profile data found. Please sign up or log in first.
            </v-alert>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<style scoped>
.label-text {
  color: rgba(0, 0, 0, 0.58);
  font-size: 0.82rem;
  margin-bottom: 4px;
}

.value-text {
  font-size: 1rem;
  font-weight: 600;
  color: #1f2937;
}
</style>