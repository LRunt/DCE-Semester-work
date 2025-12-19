import { ref } from 'vue';
import { fetchAllResults } from '../api/results';

export function getResults() {
  const results = ref([]);
  const loading = ref(false);
  const error = ref(null);

  /**
   * Load results from the backend API.
   */
  const loadResults = async () => {
    loading.value = true;
    error.value = null;
    
    try {
      results.value = await fetchAllResults();
    } catch (err) {
      error.value = err.message;
      console.error("Chyba v useResults:", err);
    } finally {
      loading.value = false;
    }
  };

  return {
    results,
    loading,
    error,
    loadResults
  };
}