<script setup>
import { RouterView } from 'vue-router'
import NavBar from './components/NavBar.vue';
import bannerImage from './assets/img/banner.png'
</script>

<template>
  <nav-bar />

  <b-img :src="bannerImage" fluid rounded class="my-4"></b-img>

  <RouterView />
</template>

<style scoped>
header {
  width: 50%;
}
</style>
