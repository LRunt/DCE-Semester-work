<script setup>
    import { useI18n } from 'vue-i18n';
    import { onMounted } from 'vue';
    import { getResults } from '../composables/resultService';
    const { results, loading, error, loadResults } = getResults();

    onMounted(() => {
        loadResults();
    });

    const formatDate = (dateString) => {
      if (!dateString) return '';
      const date = new Date(dateString);
      
      return new Intl.DateTimeFormat('cs-CZ', {
        day: '2-digit',
        month: '2-digit',
        year: 'numeric'
      }).format(date);
    };
  
    useI18n();
</script>
<template>
  <div class="results-container">
    <div v-if="loading" class="state-msg loading">
      <div class="spinner"></div> Načítám výsledky...
    </div>

    <div v-else-if="error" class="state-msg error">
      <span class="icon">⚠️</span> {{ error }}
    </div>

    <div v-else-if="results.length > 0" class="table-wrapper">
      <table class="ui-table">
        <thead>
          <tr>
            <th>{{ $t("sport.table.date") }}</th>
            <th>{{ $t("sport.table.name") }}</th>
            <th>{{ $t("sport.table.position") }}</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="result in results" :key="result.id">
            <td data-label="Datum">{{ formatDate(result.race_date) }}</td>
            <td data-label="Závod" class="race-name">{{ result.race_name }}</td>
            <td data-label="Pozice">{{ result.position }}. místo</td>
          </tr>
        </tbody>
      </table>
    </div>

    <div v-else class="state-msg empty">
      Zatím nebyly nalezeny žádné záznamy.
    </div>
  </div>
</template>