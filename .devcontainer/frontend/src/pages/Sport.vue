<script setup>
  import { useI18n } from 'vue-i18n';
  import Table from '../components/Table.vue';

  useI18n();
</script>

<template>
  <div class="content-body">
    <h2 class="title">{{ $t("sport.title") }}</h2>

    <Table></Table>
  </div>
</template>