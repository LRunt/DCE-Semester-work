<script setup>
import Header from './components/Header.vue'
import Footer from './components/Footer.vue';
</script>

<template>
  <Header></Header>
  <div class="background">
    <RouterView></RouterView>
  </div>
  <Footer></Footer>

</template>
