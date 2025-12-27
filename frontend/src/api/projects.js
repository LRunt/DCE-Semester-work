/**
 * Fetch all projects from the backend API.
 */
export async function fetchAllProjects(lang) {
  const response = await fetch(`/api/projects?lang=${lang}`);
  
  if (!response.ok) {
    const errorData = await response.json().catch(() => ({}));
    throw new Error(errorData.detail || 'Failed to fetch projects from backend.');
  }
  
  return await response.json();
}