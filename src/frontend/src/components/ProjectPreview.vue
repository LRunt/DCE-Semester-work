<script setup>
    const props = defineProps({
    headline: {
        type: String,
        required: true
    },
    description: {
        type: String,
        required: true
    },
    imagePath: {
        type: String,
        default: null
    }
    });
</script>
<template>
  <div class="project-entry">
    <h3 class="project-headline">{{ headline }}</h3>
    
    <div class="project-content row">
      <div v-if="imagePath" class="project-img-col">
        <img :src="imagePath" :alt="headline" class="project-img" />
      </div>
      <div class="project-text-col">
        <p class="project-description">
          {{ description }}
        </p>
      </div>
    </div>
  </div>
</template>