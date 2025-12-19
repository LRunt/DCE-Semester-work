<script setup>
  import { onMounted } from 'vue';
  import { getResults } from '../composables/resultService';

  const { results, loading, error, loadResults } = getResults();

  onMounted(() => {
    loadResults();
  });
</script>

<template>
    <h1>Sportovní výsledky</h1>

    <div v-if="loading" class="alert info">
      Načítám výsledky z databáze...
    </div>

    <div v-else-if="error" class="alert error">
      ⚠️ {{ error }}
    </div>

    <div v-else>
      <table v-if="results.length > 0" class="results-table">
        <thead>
          <tr>
            <th>Datum</th>
            <th>Závod</th>
            <th>Pozice</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="result in results" :key="result.id">
            <td>{{ result.race_date }}</td>
            <td>{{ result.race_name }}</td>
            <td :class="{ 'gold': result.position === 1 }">
              {{ result.position }}. místo
            </td>
          </tr>
        </tbody>
      </table>
      
      <p v-else class="empty-msg">Zatím nebyly nalezeny žádné záznamy.</p>
    </div>
</template>