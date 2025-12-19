<script setup>
import AboutMe from '../components/AboutMe.vue'
import Expirience from '../components/Expirience.vue';
import Education from '../components/Education.vue';
</script>

<template>
  <AboutMe></AboutMe>
    <div class="resume-section">
      <hr>
      <Expirience></Expirience>
      <hr>
      <Education></Education>
    </div>
</template>