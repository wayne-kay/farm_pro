<script setup>
import { ref } from 'vue';
import { RouterView } from 'vue-router';
import NavBar from './components/NavBar.vue';
import Chat from './components/chat.vue';

const isChatOpen = ref(false);
</script>

<template>
    <v-app class="app-shell">
    <NavBar/>
    <v-main>
    <RouterView />
    </v-main>

    <div class="position-fixed bottom-0 end-0 ma-6 chat-container" style="z-index: 9999 !important;">
    <v-expand-transition>
      <div v-show="isChatOpen" class="mb-4">
        <Chat @close="isChatOpen = false" />
      </div>
    </v-expand-transition>

    <div class="d-flex justify-end">
      <v-btn :color="isChatOpen ? 'grey-darken-1' : 'primary'" icon elevation="4" size="large" @click="isChatOpen = !isChatOpen" >
        <v-icon :icon="isChatOpen ? 'mdi-chevron-down' : 'mdi-comment-text-multiple'"></v-icon>
      </v-btn>
    </div>
  </div>

  </v-app>
</template>

<style>
.app-shell {
  background:
    radial-gradient(circle at top, rgba(58, 125, 68, 0.14), transparent 32%),
    linear-gradient(180deg, #f4fbf5 0%, #eef6ee 100%);
}

:root, .v-theme--light {
  --v-theme-primary: 58, 125, 68 !important;
  --v-theme-secondary: 168, 198, 134 !important;
}

.page-section {
  padding-block: 32px;
}

.section-title {
  font-size: clamp(1.8rem, 2vw, 2.6rem);
  font-weight: 800;
  letter-spacing: -0.03em;
  color: #000000;
}

.section-subtitle {
  max-width: 720px;
  margin: 0 auto;
  color: rgba(0, 0, 0, 0.65);
}
</style>
