<script setup>
import { useI18n } from 'vue-i18n';

useI18n();
</script>

<template>
    <h2>{{ $t("projects.title") }}</h2>
    <h2>{{ $t("projects.personalProjects") }}</h2>
    <h2>{{ $t("projects.schoolProjects") }}</h2>
</template>