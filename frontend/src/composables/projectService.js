import { ref } from 'vue';
import { fetchAllProjects } from '../api/projects';

export function getProjects() {
  const projects = ref([]);
  const loading = ref(false);
  const error = ref(null);

  /**
   * Load results from the backend API.
   */
  const loadProjects = async (lang) => {
    loading.value = true;
    error.value = null;
    
    try {
      projects.value = await fetchAllProjects(lang);
    } catch (err) {
      error.value = err.message;
      console.error("Error in getProjects:", err);
    } finally {
      loading.value = false;
    }
  };

  return {
    projects,
    loading,
    error,
    loadProjects
  };
}